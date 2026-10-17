# แล็บ 02: เขียน DAG แรกของคุณ

**ระยะเวลา:** 75 นาที  **ความรู้พื้นฐานที่ต้องมี:** ทำแล็บ 01 เสร็จแล้ว และ Airflow กำลังทำงานอยู่

## วัตถุประสงค์
สร้าง DAG แบบ end-to-end ที่จำลอง ML pipeline จริง: ดาวน์โหลดข้อมูล แปลงข้อมูล (transform) เทรนโมเดลขนาดเล็ก และเขียน metrics กลับ โดยใช้ TaskFlow API และสาธิต dependencies, retries และ XCom

## ขั้นตอน

### 1. DAG ของโปรเจกต์
```python
# dags/iris_pipeline.py
from __future__ import annotations

import json
from datetime import datetime, timedelta
from pathlib import Path

from airflow import DAG
from airflow.decorators import task

DEFAULTS = {
    "owner": "ml-platform",
    "retries": 2,
    "retry_delay": timedelta(minutes=1),
    "execution_timeout": timedelta(minutes=15),
}

with DAG(
    dag_id="iris_pipeline",
    description="download → transform → train → report",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args=DEFAULTS,
    tags=["lab", "iris"],
) as dag:

    @task
    def download() -> str:
        from sklearn.datasets import load_iris
        import pandas as pd
        df = pd.DataFrame(load_iris(as_frame=True).frame)
        out = "/tmp/iris.parquet"
        df.to_parquet(out)
        return out

    @task
    def transform(path: str) -> str:
        import pandas as pd
        df = pd.read_parquet(path)
        df = df[df["sepal length (cm)"] > 4.5]
        out = "/tmp/iris_clean.parquet"
        df.to_parquet(out)
        return out

    @task
    def train(path: str) -> dict:
        import pandas as pd
        from sklearn.ensemble import RandomForestClassifier
        from sklearn.metrics import accuracy_score
        from sklearn.model_selection import train_test_split

        df = pd.read_parquet(path)
        X = df.drop(columns=["target"])
        y = df["target"]
        X_tr, X_te, y_tr, y_te = train_test_split(X, y, test_size=0.2, random_state=42)
        model = RandomForestClassifier(n_estimators=50, random_state=42).fit(X_tr, y_tr)
        return {"accuracy": float(accuracy_score(y_te, model.predict(X_te)))}

    @task
    def report(metrics: dict) -> None:
        print(f"final metrics: {json.dumps(metrics)}")

    report(train(transform(download())))
```

### 2. วางไฟล์ไว้ในโฟลเดอร์ dags/ แล้วรอดูให้ปรากฏ
Scheduler จะสแกนทุก 30 วินาที

### 3. Trigger และติดตามผล
UI → iris_pipeline → Trigger DAG โดยใช้ logical date เป็นวันนี้

### 4. สังเกตการไหลของ XCom
คลิกเข้าไปที่ task `train` → แท็บ XCom → จะเห็น dict ที่ส่งต่อไปยัง `report`

### 5. บังคับให้ล้มเหลวเพื่อทดสอบ retries
แก้ไข `transform` ให้ `raise RuntimeError("synthetic")` แล้ว trigger ดูว่ามัน retry สองครั้งก่อนจะล้มเหลวในที่สุด

### 6. ปรับไปใช้ TaskGroups เพื่อความชัดเจน
```python
from airflow.utils.task_group import TaskGroup
with TaskGroup("data") as data_grp:
    raw = download(); clean = transform(raw)
report(train(clean))
```

## การตรวจสอบ
- [ ] DAG ปรากฏใน UI
- [ ] Task ทั้ง 4 ตัวรันสำเร็จตามลำดับ
- [ ] มองเห็น XCom จาก `train`
- [ ] การบังคับให้ล้มเหลวทำให้เกิดการ retry 2 ครั้ง

## การล้างทรัพยากร
```bash
rm ~/airflow/dags/iris_pipeline.py
```

## การแก้ไขปัญหา
- **DAG ไม่ปรากฏ** — มี syntax error: `airflow dags list-import-errors` จะแสดงรายการให้เห็น
- **ไม่รู้จัก `@task`** — Airflow เวอร์ชันเก่า; `from airflow.decorators import task` ต้องใช้ 2.0 ขึ้นไป
- **XCom ใหญ่เกินไป** — backend ค่าเริ่มต้นจำกัดที่ 48KB ให้ใช้ backend แบบ S3/GCS หรือส่ง file path ผ่าน XCom แล้วเก็บข้อมูลไว้ใน object storage
