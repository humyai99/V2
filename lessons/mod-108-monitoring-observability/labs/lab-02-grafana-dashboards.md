# Lab 02: สร้าง Grafana Dashboard ตั้งแต่เริ่มต้น

**ระยะเวลา:** 75 นาที  **สิ่งที่ต้องมีก่อน:** Lab 01; ติดตั้ง Grafana แล้ว

## วัตถุประสงค์
ตั้งค่า Grafana ให้พร้อมใช้งาน เชื่อมต่อกับ Prometheus และสร้าง dashboard 5 panel สำหรับ FastAPI service ได้แก่ RPS, error rate, p95 latency, in-flight requests และ error budget

## ขั้นตอน

### 1. รัน Grafana
```bash
docker run -d --name grafana -p 3000:3000 \
  -e GF_SECURITY_ADMIN_PASSWORD=admin grafana/grafana:11.1.0
```
http://localhost:3000  ผู้ใช้ `admin` รหัสผ่าน `admin`

### 2. เพิ่ม data source ของ Prometheus
- URL: `http://host.docker.internal:9090`
- คลิก "Save & Test" → จะเห็นเครื่องหมายถูกสีเขียว

### 3. สร้าง panel
สำหรับแต่ละ panel ให้เลือก "Add visualization" → เลือก Prometheus → วาง query → ตั้งค่า unit → บันทึก

**Panel 1: RPS (timeseries)**
- `sum(rate(predictions_total[1m]))`
- Unit: req/s  Legend: total RPS

**Panel 2: Error Rate (stat)**
- `100 * sum(rate(predictions_total{status="error"}[5m])) / sum(rate(predictions_total[5m]))`
- Unit: percent (0-100)  Thresholds: เขียว <1, เหลือง 1-5, แดง >5

**Panel 3: Latency p50/p95/p99 (timeseries)**
- `histogram_quantile(0.50, sum by (le) (rate(inference_latency_seconds_bucket[5m])))` legend `p50`
- p95 และ p99 ใช้ quantile ที่สอดคล้องกัน
- Unit: seconds

**Panel 4: In-flight requests (timeseries)**
- `inflight_requests`

**Panel 5: 30-day error budget burn (stat)**
- `1 - (sum(increase(predictions_total{status="error"}[30d])) / sum(increase(predictions_total[30d]))) / 0.01`
- (สมมติว่า SLO คือ availability 99%) Unit: percent

### 4. Templating variables
Settings → Variables → เพิ่มตัวแปร `service` ด้วย query `label_values(predictions_total, service)` แล้วนำไปใช้ใน query เป็น `{service=~"$service"}`

### 5. Export และ import
Settings → JSON Model → คัดลอก JSON แล้วบันทึกเป็น `dashboard.json` หากต้องการกู้คืน ให้ใช้ "Import JSON" บน Grafana ตัวใหม่

## การตรวจสอบ
- [ ] การทดสอบการเชื่อมต่อ data source สำเร็จ
- [ ] panel ทั้ง 5 แสดงข้อมูลหลังจากสร้าง traffic แล้ว
- [ ] ตัวเลือกช่วงเวลา (time range) มีผลกับทุก panel
- [ ] export dashboard JSON ได้โดยไม่มีปัญหา

## การเก็บกวาด
```bash
docker stop grafana && docker rm grafana
```

## การแก้ไขปัญหา
- **ทุก panel แสดง "No data"** — URL ของ data source ชี้ไปยัง host ที่ผิด; ตรวจสอบจากภายใน container ของ Grafana ด้วย `docker exec grafana wget -O- http://host.docker.internal:9090/api/v1/query?query=up`.
- **Latency panel คืนค่า 0** — กำหนด histogram bucket ไม่ถูกต้อง bucket ต้องเป็นแบบสะสม (cumulative) (เช่น 0.005, 0.01, 0.025…)
- **ตัวแปร resolve ไม่ได้** — query ของตัวแปรต้องคืนค่าเป็น label ไม่ใช่ value; ให้ใช้ `label_values()`
