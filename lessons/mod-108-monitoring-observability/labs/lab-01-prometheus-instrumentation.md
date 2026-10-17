# Lab 01: ติดตั้ง Instrumentation ให้ Python Service ด้วย Prometheus

**ระยะเวลา:** 60 นาที  **สิ่งที่ต้องมีก่อน:** Python 3.11+, Docker

## วัตถุประสงค์
เพิ่ม metrics แบบ Counter, Histogram และ Gauge ให้กับ FastAPI service; เปิดเผยผ่าน `/metrics`; รัน Prometheus บนเครื่องเพื่อ scrape; และ query ผ่าน UI

## ขั้นตอน

### 1. Service ตัวอย่าง
```python
# app.py
import time, random
from fastapi import FastAPI
from prometheus_client import Counter, Histogram, Gauge, make_asgi_app

REQUESTS  = Counter("predictions_total", "Total predictions", ["status"])
LATENCY   = Histogram("inference_latency_seconds", "Inference latency",
                       buckets=(0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0))
INFLIGHT  = Gauge("inflight_requests", "In-flight requests")

app = FastAPI()
app.mount("/metrics", make_asgi_app())

@app.post("/predict")
async def predict(payload: dict):
    INFLIGHT.inc()
    t0 = time.perf_counter()
    try:
        # simulate inference
        time.sleep(random.uniform(0.005, 0.05))
        if random.random() < 0.02:
            REQUESTS.labels(status="error").inc()
            return {"error": "transient"}, 500
        REQUESTS.labels(status="ok").inc()
        return {"prediction": random.random()}
    finally:
        LATENCY.observe(time.perf_counter() - t0)
        INFLIGHT.dec()
```
```bash
pip install fastapi uvicorn prometheus-client
uvicorn app:app --port 8000 &
curl http://localhost:8000/metrics | head -20
```

### 2. prometheus.yml
```yaml
global: { scrape_interval: 5s }
scrape_configs:
  - job_name: app
    static_configs:
      - targets: ['host.docker.internal:8000']
```

### 3. รัน Prometheus ใน Docker
```bash
docker run -d --name prom -p 9090:9090 -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
```

### 4. สร้าง traffic
```bash
for i in $(seq 1 200); do curl -s -X POST http://localhost:8000/predict -d '{}' -H 'content-type: application/json' > /dev/null; done
```

### 5. Query ใน Prometheus UI (http://localhost:9090)
- `predictions_total`
- `rate(predictions_total[1m])`
- `sum by (status) (rate(predictions_total[5m]))`
- `histogram_quantile(0.95, sum by (le) (rate(inference_latency_seconds_bucket[5m])))`
- `inflight_requests`

## การตรวจสอบ
- [ ] endpoint `/metrics` คืนค่าในรูปแบบ Prometheus exposition format
- [ ] หน้า targets ของ Prometheus แสดง `app` เป็น UP
- [ ] query ทั้ง 5 รายการคืนข้อมูลที่ไม่ว่างหลังจากสร้าง traffic แล้ว

## การเก็บกวาด
```bash
docker stop prom && docker rm prom
pkill -f uvicorn
rm prometheus.yml app.py
```

## การแก้ไขปัญหา
- **หน้า Targets แสดง DOWN** — `host.docker.internal` resolve ได้เฉพาะบน macOS/Windows เท่านั้น; บน Linux ให้ใช้ IP ของ host หรือ `--add-host=host.docker.internal:host-gateway`
- **ไม่มีข้อมูลสำหรับ `inflight_requests`** — Gauge มีค่าเป็นศูนย์ในช่วงระหว่างการ scrape แต่ละครั้ง ให้เพิ่ม endpoint ที่ทำงานนานขึ้นเพื่อให้เห็นค่า
- **`histogram_quantile returns NaN`** — จำนวน sample ใน window ไม่เพียงพอ; ขยาย `[5m]` เป็น `[15m]` หรือสร้าง traffic เพิ่ม
