# Lab 01: การ Optimize Dockerfile สำหรับ ML Workload

**ระยะเวลา:** 60 นาที  **สิ่งที่ต้องมีก่อน:** ติดตั้ง Docker แล้ว; ทำแล็บ 02 ของ mod-101 เสร็จแล้ว

## วัตถุประสงค์
นำ Dockerfile สำหรับ ML แบบพื้นฐานมาปรับให้ดีขึ้น: การเรียงลำดับ layer, multi-stage build, BuildKit cache mount และ `.dockerignore` แล้ววัดขนาด image และเวลา build ก่อน/หลัง

## ขั้นตอน

### 1. เริ่มจาก Dockerfile แบบพื้นฐาน
```dockerfile
FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
```
Build แล้วจดขนาดไว้: `docker build -t naive .` → โดยทั่วไปจะได้ 1.2-1.5 GB

### 2. เปลี่ยนไปใช้ slim base + .dockerignore
```dockerfile
FROM python:3.11-slim
...
```
เพิ่ม `.dockerignore`:
```
__pycache__/
*.pyc
.git/
venv/
tests/
*.md
```

### 3. เรียง layer ตามความถี่ของการเปลี่ยนแปลง
Copy `requirements.txt` และติดตั้งก่อน copy source code — จะถูก cache ไว้ถ้า requirements ไม่เปลี่ยน:
```dockerfile
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
```

### 4. ใช้ BuildKit cache mount สำหรับ pip
```dockerfile
# syntax=docker/dockerfile:1.6
FROM python:3.11-slim
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt
```
Build ด้วย `DOCKER_BUILDKIT=1 docker build`

### 5. ใช้ multi-stage เพื่อตัด build tool ออก
```dockerfile
FROM python:3.11 AS builder
RUN pip wheel --wheel-dir /wheels -r requirements.txt

FROM python:3.11-slim AS runtime
COPY --from=builder /wheels /wheels
RUN pip install --no-index --find-links=/wheels -r requirements.txt && rm -rf /wheels
```

### 6. วัดผล
```bash
docker images | grep -E 'naive|optimized'
hyperfine 'docker build --no-cache -t opt .'
```

## การตรวจสอบ
- [ ] Image ที่ optimize แล้ว < 400 MB (เทียบกับแบบพื้นฐาน > 1 GB)
- [ ] Build ครั้งที่สอง (ไม่มีการเปลี่ยน source) < 5 วินาที (cache hit ที่ layer ของ pip)
- [ ] `docker history opt` แสดงน้อยกว่า 10 layer

## การ Cleanup
```bash
docker rmi naive opt
```

## การแก้ปัญหา
- **Cache mount ไม่มีผล** — ตรวจสอบว่าเปิดใช้ BuildKit แล้ว (`docker buildx version` รายงาน >=0.10)
- **Slim image ขาด system library** — ติดตั้ง `gcc`/`g++` ใน builder stage ไม่ใช่ใน runtime
