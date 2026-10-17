# Lab 07: Drift Monitoring ด้วย Evidently

**ระยะเวลา:** 60 นาที  **สิ่งที่ต้องมีก่อน:** Python 3.11+; มี baseline dataset พร้อมใช้

## วัตถุประสงค์
คำนวณ feature drift และ prediction drift ระหว่าง baseline dataset (ข้อมูล training) กับตัวอย่างข้อมูล production ล่าสุด สร้างรายงาน HTML และสรุปผลแบบ JSON ที่เหมาะสำหรับใช้ทำ alert

## ขั้นตอน

### 1. ติดตั้ง
```bash
pip install 'evidently==0.4.30' pandas pyarrow
```

### 2. Dataset สองชุด
```python
import pandas as pd, numpy as np
np.random.seed(42)

ref = pd.DataFrame({
    "feature_1": np.random.normal(0, 1, 5000),
    "feature_2": np.random.exponential(2, 5000),
    "category":  np.random.choice(["a","b","c"], 5000),
    "prediction": np.random.choice([0,1], 5000, p=[0.7,0.3]),
})

prod = pd.DataFrame({
    "feature_1": np.random.normal(0.4, 1.2, 5000),     # shifted
    "feature_2": np.random.exponential(3, 5000),        # scale changed
    "category":  np.random.choice(["a","b","c"], 5000, p=[0.5,0.3,0.2]),
    "prediction": np.random.choice([0,1], 5000, p=[0.6,0.4]),  # class balance shifted
})
```

### 3. รันรายงาน drift
```python
from evidently.report import Report
from evidently.metric_preset import DataDriftPreset, TargetDriftPreset

rpt = Report(metrics=[DataDriftPreset(), TargetDriftPreset()])
rpt.run(reference_data=ref, current_data=prod, column_mapping=None)
rpt.save_html("drift_report.html")
res = rpt.as_dict()
```

### 4. เปิดไฟล์ HTML
```bash
open drift_report.html
```
ดูคะแนน drift ราย feature, การกระจายตัวของข้อมูล และสรุปผล

### 5. ดึงผล pass/fail ออกมาเป็น JSON
```python
import json
summary = {
    "dataset_drift": res["metrics"][0]["result"]["dataset_drift"],
    "n_drifted":     res["metrics"][0]["result"]["number_of_drifted_columns"],
    "drift_by_column": {
        c["column_name"]: c["drift_score"]
        for c in res["metrics"][0]["result"]["drift_by_columns"].values()
    },
}
json.dump(summary, open("drift_summary.json", "w"), indent=2, default=str)
print(json.dumps(summary, indent=2, default=str))
```

### 6. ตั้งเวลา
ห่อไว้ใน Airflow DAG ที่รันรายวัน; แจ้งเตือนหาก `dataset_drift` เป็น True ติดต่อกัน 3 วัน

## การตรวจสอบ
- [ ] รายงาน HTML เปิดได้และแสดงกราฟซ้อนการกระจายตัวของแต่ละ feature
- [ ] `n_drifted` ≥ 2 เมื่อใช้ข้อมูลทดสอบข้างต้น
- [ ] สรุปผล JSON เหมาะสำหรับส่งต่อไปยังระบบ alerting

## การล้างข้อมูล
```bash
rm drift_report.html drift_summary.json
```

## การแก้ปัญหา
- **`dataset_drift` เป็น False เสมอ** — การทดสอบเริ่มต้น (KS สำหรับข้อมูลตัวเลข, chi2 สำหรับข้อมูลหมวดหมู่) ต้องการการเปลี่ยนแปลงจริง; ข้อมูลสังเคราะห์ที่นี่ถูกปรับให้ trigger ได้
- **รายงาน HTML ใหญ่เกินกว่าจะฝังใน Slack** — ใช้สรุปผล JSON สำหรับ alert และลิงก์ไปยัง HTML สำหรับการตรวจสอบเชิงลึก
- **เกิด drift กับ feature ที่คุณไม่สนใจ** — ใช้ `ColumnMapping` เพื่อตัดออก
