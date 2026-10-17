# คู่มือการ Deploy

## สิ่งที่ต้องมีก่อน (Prerequisites)

1. Kubernetes cluster ที่รองรับ GPU
2. ตั้งค่า kubectl เรียบร้อยแล้ว
3. สิทธิ์เข้าถึง Docker registry
4. ติดตั้ง GPU drivers แล้ว

TODO: เพิ่มรายละเอียดสิ่งที่ต้องมีก่อน

## ขั้นตอนการ Deploy

### 1. Build Docker Image
```bash
# TODO: Add build commands
docker build -t llm-server:latest .
```

### 2. Push ไปยัง Registry
```bash
# TODO: Add push commands
```

### 3. Deploy ไปยัง Kubernetes
```bash
# TODO: Add kubectl commands
kubectl apply -f kubernetes/
```

### 4. ตรวจสอบการ Deploy
```bash
# TODO: Add verification commands
```

## การตั้งค่า (Configuration)

TODO: บันทึกตัวเลือกการตั้งค่า

## การ Monitoring

TODO: บันทึกการตั้งค่า monitoring

## การแก้ไขปัญหา (Troubleshooting)

TODO: เพิ่มปัญหาที่พบบ่อยและวิธีแก้ไข
