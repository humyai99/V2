# Lab 02: Multi-Stage Build สำหรับ Production Image ที่เล็กกระชับ

**ระยะเวลา:** 60 นาที  **สิ่งที่ต้องมีก่อน:** ทำ Lab 01 เสร็จแล้ว

## วัตถุประสงค์
ใช้ Dockerfile แบบ multi-stage เพื่อแยกสิ่งที่ต้องใช้ตอน build (compiler, dev SDK ขนาดใหญ่) ออกจาก runtime ให้ได้ image ที่มีเฉพาะสิ่งที่จำเป็นสำหรับรับ traffic เท่านั้น

## ขั้นตอน

### 1. ระบุปัญหา
ML library หลายตัว (`xgboost`, `lightgbm`, `pyarrow`, native CUDA binding) ต้องใช้ C/C++ toolchain ตอนติดตั้ง แต่ไม่ต้องใช้ตอน runtime Image แบบ single-stage จึงพก build tool ที่ไม่จำเป็นไปด้วยหลายร้อย MB

### 2. Build แบบสาม stage สำหรับ service ที่ใช้ PyTorch
```dockerfile
# syntax=docker/dockerfile:1.6

# Stage 1: deps with compilers
FROM python:3.11 AS deps
WORKDIR /build
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
    pip wheel --wheel-dir /wheels -r requirements.txt

# Stage 2: app build (e.g., compile Cython extensions)
FROM python:3.11 AS appbuild
WORKDIR /src
COPY pyproject.toml setup.py ./
COPY app/ ./app/
RUN pip install build && python -m build --wheel --outdir /dist

# Stage 3: runtime — only Python + installed wheels
FROM python:3.11-slim AS runtime
RUN groupadd -r app && useradd -r -g app -u 1000 app
WORKDIR /app
COPY --from=deps /wheels /tmp/wheels
COPY --from=appbuild /dist /tmp/dist
RUN pip install --no-index --find-links=/tmp/wheels --find-links=/tmp/dist \
        myapp && rm -rf /tmp/wheels /tmp/dist
USER 1000
CMD ["myapp"]
```

### 3. ตรวจสอบความต่างของขนาด
```bash
docker build --target deps -t app:deps .
docker build --target runtime -t app:runtime .
docker images app
```
`runtime` ควรมีขนาด < 50% ของ `deps`

### 4. ทำซ้ำกับตัวอย่างจริงที่ใช้ PyTorch
ใช้ `pytorch/pytorch:2.3-runtime` ใน runtime stage; copy เฉพาะ model + entrypoint ของคุณ

## การตรวจสอบ
- [ ] `docker image inspect app:runtime` แสดงว่ามี `pip` และ `python` แต่ไม่มี `gcc`/`g++`
- [ ] ขนาด runtime image < 1.5 GB (หรือตามเป้าหมายของคุณ)
- [ ] App เริ่มทำงานและตอบสนองได้สำเร็จ

## การ Cleanup
```bash
docker rmi app:deps app:appbuild app:runtime 2>/dev/null
```

## การแก้ปัญหา
- **ขาด shared library ตอน runtime** — PyTorch op บางตัวต้องใช้ `libgomp1`; เพิ่ม `apt-get install -y libgomp1` ใน runtime stage
- **Wheel จาก stage 1 ใช้ร่วมกันไม่ได้** — Stage 1 และ stage 3 ต้องใช้ Python minor version เดียวกัน (3.11.x ↔ 3.11.x)
