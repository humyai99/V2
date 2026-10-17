# แล็บ 01: รัน Airflow บนเครื่องด้วย docker-compose

**ระยะเวลา:** 60 นาที  **ความรู้พื้นฐานที่ต้องมี:** Docker + Compose

## วัตถุประสงค์
ตั้งค่า Airflow stack ที่ใช้งานได้ (scheduler + webserver + worker + Postgres) บนเครื่องด้วย docker-compose และยืนยันว่าคุณสามารถเขียนและรัน DAG ง่าย ๆ ได้

## ขั้นตอน

### 1. ดาวน์โหลดไฟล์ compose สำหรับ quick-start อย่างเป็นทางการ
```bash
mkdir -p ~/airflow && cd ~/airflow
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.9.1/docker-compose.yaml'
echo "AIRFLOW_UID=$(id -u)" > .env
mkdir -p ./dags ./logs ./plugins ./config
```

### 2. เตรียม metadata database
```bash
docker compose up airflow-init
```
การ init ครั้งแรกใช้เวลาประมาณ 1-2 นาที คุณควรเห็นข้อความ "Admin user airflow created" ในตอนท้าย

### 3. เปิดใช้งาน stack ทั้งหมด
```bash
docker compose up -d
docker compose ps
```
ทุก service (6 ตัวขึ้นไป) ควรอยู่ในสถานะ healthy

### 4. เปิด UI
http://localhost:8080  ผู้ใช้ `airflow` / รหัสผ่าน `airflow` มี DAG ตัวอย่างหลายตัวโหลดไว้ให้แล้ว

### 5. เพิ่ม DAG แบบ hello
```python
# dags/hello.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG("hello", start_date=datetime(2026, 1, 1), schedule=None, catchup=False) as dag:
    BashOperator(task_id="say_hi", bash_command="echo hello from airflow")
```
รีเฟรช UI → จะเห็น `hello` ปรากฏขึ้น ให้ trigger ด้วยตนเองแล้วดู log

### 6. การใช้งาน CLI
```bash
docker compose exec airflow-worker airflow dags list
docker compose exec airflow-worker airflow dags trigger hello
docker compose exec airflow-worker airflow tasks list hello
```

## การตรวจสอบ
- [ ] `docker compose ps` แสดงว่า scheduler, webserver, worker, triggerer, postgres อยู่ในสถานะ healthy ทั้งหมด
- [ ] DAG `hello` รันจนสำเร็จ
- [ ] มองเห็น log ของแต่ละ task ใน UI

## การล้างทรัพยากร
```bash
docker compose down -v
```

## การแก้ไขปัญหา
- **`Permission denied` ที่ logs/** — แก้ไข UID: `echo "AIRFLOW_UID=$(id -u)" > .env` และ `chown -R $(id -u):0 logs/`
- **Webserver ตอบกลับ 502** — Scheduler ยัง init ไม่เสร็จ ให้รอ 30 วินาที
- **ไม่มี DAG ตัวอย่างใน UI** — ตั้งค่า `AIRFLOW__CORE__LOAD_EXAMPLES=true` (เป็นค่าเริ่มต้นใน compose อย่างเป็นทางการ)
