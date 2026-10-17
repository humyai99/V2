# คู่มือการปรับแต่งประสิทธิภาพ (Performance Optimization)

## การปรับแต่งโมเดล (Model Optimization)

### Quantization
- FP16: ลดหน่วยความจำ 50%
- INT8: ลดหน่วยความจำ 75%
- INT4: ลดหน่วยความจำ 87%
TODO: เพิ่มรายละเอียดการ implement

### Batching
- Continuous batching: เพิ่ม throughput ได้ 3-5 เท่า
TODO: เพิ่มตัวอย่างการตั้งค่า

## การปรับแต่งโครงสร้างพื้นฐาน (Infrastructure Optimization)

### การใช้งาน GPU (GPU Utilization)
TODO: บันทึกกลยุทธ์เพื่อใช้งาน GPU ให้ได้สูงสุด

### Caching
TODO: บันทึกกลยุทธ์การทำ caching

## การปรับลดต้นทุน (Cost Optimization)

TODO: บันทึกเรื่อง:
- Spot instances
- การเลือกขนาดทรัพยากรให้เหมาะสม (Right-sizing)
- นโยบาย Autoscaling
