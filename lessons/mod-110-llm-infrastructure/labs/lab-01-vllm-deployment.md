# Lab 01: Deploy LLM ด้วย vLLM

**ระยะเวลา:** 75 นาที  **ข้อกำหนดเบื้องต้น:** GPU ที่มี VRAM ≥12GB; Docker พร้อม NVIDIA toolkit

## วัตถุประสงค์
รัน LLM ขนาด 7B พารามิเตอร์ (Mistral-7B หรือ Llama-3-8B-Instruct) ผ่าน server ที่เข้ากันได้กับ OpenAI ของ vLLM, benchmark throughput เทียบกับ baseline ของ HuggingFace และใช้ KV-cache ของ PagedAttention เพื่อรองรับ request พร้อมกันได้มากขึ้น

## ขั้นตอน

### 1. Pull และเริ่ม vLLM
```bash
docker run -d --gpus all --name vllm \
  -p 8000:8000 \
  -v $HOME/.cache/huggingface:/root/.cache/huggingface \
  -e HUGGING_FACE_HUB_TOKEN=$HF_TOKEN \
  vllm/vllm-openai:v0.5.0 \
  --model mistralai/Mistral-7B-Instruct-v0.3 \
  --max-model-len 4096 \
  --dtype bfloat16
```
รอประมาณ 5-10 นาทีสำหรับการดาวน์โหลดและโหลดโมเดล

### 2. ตรวจสอบ
```bash
curl http://localhost:8000/v1/models
```

### 3. Completion เดี่ยว (เข้ากันได้กับ OpenAI)
```bash
curl http://localhost:8000/v1/chat/completions \
  -H 'content-type: application/json' \
  -d '{
    "model": "mistralai/Mistral-7B-Instruct-v0.3",
    "messages": [{"role": "user", "content": "Explain async I/O in 3 sentences."}],
    "max_tokens": 200
  }' | jq .
```

### 4. Benchmark throughput
```bash
pip install openai
python - <<'PY'
import asyncio, time
from openai import AsyncOpenAI
client = AsyncOpenAI(base_url="http://localhost:8000/v1", api_key="dummy")

async def one():
    await client.chat.completions.create(
        model="mistralai/Mistral-7B-Instruct-v0.3",
        messages=[{"role":"user","content":"Write a haiku about Kubernetes."}],
        max_tokens=64,
    )

async def bench(n=64, concurrency=16):
    sem = asyncio.Semaphore(concurrency)
    async def go():
        async with sem: await one()
    t0 = time.perf_counter()
    await asyncio.gather(*(go() for _ in range(n)))
    print(f"{n} reqs / {time.perf_counter()-t0:.1f}s = {n/(time.perf_counter()-t0):.1f} req/s")

asyncio.run(bench())
PY
```

### 5. เปรียบเทียบกับ baseline ของ HF transformers
```python
from transformers import pipeline
import time
pipe = pipeline("text-generation", model="mistralai/Mistral-7B-Instruct-v0.3", device=0)
t0=time.perf_counter()
for _ in range(8): pipe("Write a haiku about Kubernetes.", max_new_tokens=64)
print(f"hf: {8/(time.perf_counter()-t0):.1f} req/s")
```
คาดว่า vLLM จะได้ RPS สูงกว่า 5-10 เท่าที่ระดับ concurrency เดียวกัน

### 6. Monitor ด้วย metrics ของ vLLM
vLLM เปิด `/metrics` (Prometheus) ให้ใช้งาน ให้ scrape endpoint นี้; metrics สำคัญได้แก่ `vllm:num_requests_running`, `vllm:gpu_cache_usage_perc`

## การตรวจสอบผล
- [ ] `/v1/models` แสดงรายการโมเดลที่ serve อยู่
- [ ] Completion เดี่ยวคืนข้อความที่สมเหตุสมผล
- [ ] Benchmark แสดง ≥10 req/s ที่ concurrency 16 บน GPU 24GB หนึ่งตัว
- [ ] `gpu_cache_usage_perc` เพิ่มขึ้นเมื่อมีโหลด

## การทำความสะอาด
```bash
docker stop vllm && docker rm vllm
```

## การแก้ไขปัญหา
- **OOM ขณะโหลด** — ลด `--max-model-len` หรือใช้รุ่นที่ quantize แล้ว (`--quantization awq`)
- **`Cannot find HF token`** — Mistral ต้องการการยืนยันตัวตนกับ HF; ตั้งค่า `HF_TOKEN` และส่งผ่าน `-e`
- **Request แรกช้ามาก** — CUDA graphs กำลังคอมไพล์; request ถัดไปจะเร็ว
