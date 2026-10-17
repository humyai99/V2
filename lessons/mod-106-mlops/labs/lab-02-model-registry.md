# Lab 02: Model Registry และการ Promote Stage

**ระยะเวลา:** 60 นาที  **สิ่งที่ต้องมีก่อน:** Lab 01; MLflow stack ที่รันอยู่

## วัตถุประสงค์
ลงทะเบียนโมเดลใน MLflow Model Registry, เปลี่ยน stage (Staging → Production) และโหลดโมเดลตาม stage ในสคริปต์ serving

## ขั้นตอน

### 1. ลงทะเบียนโมเดลจาก run
```python
import mlflow
mlflow.set_tracking_uri("http://localhost:5000")

best = mlflow.search_runs(experiment_names=["iris-baseline"], order_by=["metrics.accuracy DESC"]).iloc[0]
mv = mlflow.register_model(f"runs:/{best.run_id}/model", name="iris-classifier")
print(mv.version)
```

### 2. เปลี่ยน stage ผ่าน client
```python
from mlflow.tracking import MlflowClient
c = MlflowClient()
c.transition_model_version_stage("iris-classifier", version=mv.version, stage="Staging",
                                  archive_existing_versions=True)
```

### 3. โหลดตาม stage ในสคริปต์ serving
```python
import mlflow.pyfunc
m = mlflow.pyfunc.load_model("models:/iris-classifier/Staging")
print(m.predict([[5.1, 3.5, 1.4, 0.2]]))
```
นี่คือรูปแบบที่ใช้ใน production: โค้ดของแอปอ้างอิง stage ไม่ใช่เวอร์ชันที่ตายตัว

### 4. Promote ไปยัง Production
```python
c.transition_model_version_stage("iris-classifier", mv.version, stage="Production",
                                  archive_existing_versions=True)
```

### 5. Webhook / event เมื่อเปลี่ยน stage (ไม่บังคับ)
MLflow ไม่มี webhook ในตัว แต่คุณสามารถ poll ผ่าน API หรือ trigger ผ่าน CI ของคุณเมื่อมีการติด tag

### 6. ทัวร์ UI
http://localhost:5000 → แท็บ "Models" → "iris-classifier" → ดูประวัติเวอร์ชันและการกำหนด stage

## การตรวจสอบ
- [ ] โมเดลปรากฏใน registry พร้อมเวอร์ชันที่ถูกต้อง
- [ ] การเปลี่ยน stage ทำงานได้ทั้งใน UI และผ่าน client
- [ ] URI `models:/iris-classifier/Production` resolve ได้และทำนายผลได้

## การล้างข้อมูล
```bash
# delete the registered model via UI or:
python -c "from mlflow.tracking import MlflowClient; MlflowClient().delete_registered_model('iris-classifier')"
```

## การแก้ปัญหา
- **`Registered model not found`** — ชื่อสะกดไม่ตรงกันระหว่างขั้นตอน register และ load
- **การเปลี่ยน stage ถูก rollback โดยไม่มีการแจ้งเตือน** — ปัญหาเรื่องสิทธิ์เมื่อใช้ MLflow ที่โฮสต์บน Databricks; MLflow แบบ OSS อนุญาตให้ client ใดก็ได้
- **`archive_existing_versions` ถูก deprecate** — ใน MLflow 2.9+ ให้ใช้ API "aliases" ใหม่แทน stage
