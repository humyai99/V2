# Lab 02: PyTorch GPU Inference และการทำ Benchmark

**ระยะเวลา:** 60 นาที  **สิ่งที่ต้องมีก่อน:** ติดตั้ง PyTorch ที่รองรับ CUDA แล้ว

## วัตถุประสงค์
โหลดโมเดลจริง (ResNet-50 จาก torchvision) ย้ายไปไว้บน GPU และ benchmark throughput ของ CPU เทียบกับ GPU บน batch ข้อมูลสังเคราะห์

## ขั้นตอน

### 1. การตั้งค่า
```python
import time, torch
from torchvision.models import resnet50, ResNet50_Weights

assert torch.cuda.is_available(), "no GPU"
device = torch.device("cuda")
model = resnet50(weights=ResNet50_Weights.DEFAULT)
model.train(False)   # inference mode (equivalent to .eval())
```

### 2. CPU benchmark
```python
x = torch.randn(8, 3, 224, 224)
with torch.inference_mode():
    # warm up
    for _ in range(3): model(x)
    t0 = time.perf_counter()
    for _ in range(50): model(x)
    cpu_s = (time.perf_counter() - t0) / 50
print(f"cpu per-batch: {cpu_s*1000:.1f} ms")
```

### 3. GPU benchmark
```python
model_gpu = model.to(device)
x_gpu = x.to(device)
with torch.inference_mode():
    for _ in range(3): model_gpu(x_gpu); torch.cuda.synchronize()
    t0 = time.perf_counter()
    for _ in range(50): model_gpu(x_gpu); torch.cuda.synchronize()
    gpu_s = (time.perf_counter() - t0) / 50
print(f"gpu per-batch: {gpu_s*1000:.1f} ms   speedup: {cpu_s/gpu_s:.1f}x")
```

### 4. Throughput เทียบกับ batch size
```python
for bs in (1, 4, 8, 16, 32, 64):
    x = torch.randn(bs, 3, 224, 224, device=device)
    with torch.inference_mode():
        for _ in range(3): model_gpu(x); torch.cuda.synchronize()
        t0 = time.perf_counter()
        for _ in range(20): model_gpu(x); torch.cuda.synchronize()
        s = (time.perf_counter()-t0)/20
    print(f"bs={bs:3d} per-batch={s*1000:6.1f}ms throughput={bs/s:7.1f} img/s")
```

### 5. fp16 ด้วย autocast
```python
with torch.inference_mode(), torch.amp.autocast("cuda", dtype=torch.float16):
    for _ in range(3): model_gpu(x_gpu); torch.cuda.synchronize()
    t0 = time.perf_counter()
    for _ in range(50): model_gpu(x_gpu); torch.cuda.synchronize()
    fp16_s = (time.perf_counter()-t0)/50
print(f"fp16 per-batch: {fp16_s*1000:.1f}ms")
```

### 6. TorchScript / `torch.compile` (PyTorch 2.x)
```python
compiled = torch.compile(model_gpu, mode="reduce-overhead")
# Compare against eager.
```

## การตรวจสอบผล
- [ ] GPU เร็วกว่า CPU ≥ 5× สำหรับ batch 8 (GPU ระดับ consumer)
- [ ] Latency ต่อภาพลดลงเมื่อ batch size เพิ่มขึ้น (จนกว่าจะชนขีดจำกัดหน่วยความจำ)
- [ ] fp16 เร็วกว่า fp32 1.5-2× บน Ampere หรือใหม่กว่า

## การล้างทรัพยากร
ไม่มี

## การแก้ปัญหา
- **`cuda out of memory`** — ลด batch size และตรวจสอบ `nvidia-smi` ว่ามี process อื่นยึดหน่วยความจำอยู่หรือไม่
- **fp16 ช้ากว่า fp32** — เป็น GPU ยุค Pascal ที่ไม่มี Tensor Cores โดย fp16 จะเร็วกว่าเฉพาะบน Volta ขึ้นไป
- **`torch.compile` errors** — บาง op ยังไม่รองรับ ให้ fallback ไปใช้ eager หรือใช้ `model_compiled = torch.compile(model_gpu, dynamic=True)`.
