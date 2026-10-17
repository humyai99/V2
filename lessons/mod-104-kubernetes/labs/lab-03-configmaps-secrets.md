# Lab 03: ConfigMaps และ Secrets

**ระยะเวลา:** 60 นาที  **ข้อกำหนดเบื้องต้น:** ทำ Lab 02 เสร็จแล้ว

## วัตถุประสงค์
แยกการตั้งค่าแอปออกมาภายนอกด้วย ConfigMaps และ Secrets, mount เป็น env vars และเป็นไฟล์ และหมุนเวียน (rotate) ค่าโดยไม่ต้อง restart โดยไม่จำเป็น

## ขั้นตอน

### 1. สร้าง ConfigMap จาก literals และไฟล์
```bash
echo "log_level: info" > app.conf
kubectl create configmap app-config --from-literal=APP_ENV=staging --from-file=app.conf=app.conf
kubectl get cm app-config -o yaml
```

### 2. Mount เป็น env vars
```yaml
spec:
  containers:
    - name: api
      envFrom:
        - configMapRef: { name: app-config }
```

### 3. Mount ไฟล์ไว้ที่ /etc/app/
```yaml
      volumeMounts:
        - name: cfg
          mountPath: /etc/app
  volumes:
    - name: cfg
      configMap: { name: app-config }
```

### 4. สร้าง Secret
```bash
kubectl create secret generic db-creds \
  --from-literal=username=app \
  --from-literal=password='s3cr3t!'
kubectl get secret db-creds -o yaml      # base64-encoded
```

### 5. ฉาย (project) Secret keys เป็น env vars
```yaml
      env:
        - name: DB_USER
          valueFrom:
            secretKeyRef: { name: db-creds, key: username }
        - name: DB_PASS
          valueFrom:
            secretKeyRef: { name: db-creds, key: password }
```

### 6. Rotate Secret โดยไม่ต้อง restart (เฉพาะ file mounts)
```bash
kubectl create secret generic db-creds --from-literal=password='n3wp4ss' --dry-run=client -o yaml \
  | kubectl apply -f -
```
File mounts จะอัปเดตภายในประมาณ 60 วินาที (kubelet sync) ส่วนการ inject ผ่าน env var ต้อง restart pod

### 7. Secrets แบบเข้ารหัส — SealedSecrets หรือ External Secrets
โครงร่าง:
```bash
helm install sealed-secrets sealed-secrets/sealed-secrets -n kube-system
echo -n 'mypass' | kubectl create secret generic test --dry-run=client --from-file=password=/dev/stdin -o yaml \
  | kubeseal --format yaml > sealed-secret.yaml      # safe to commit
```

## การตรวจสอบ
- [ ] `kubectl exec pod -- env | grep APP_ENV` แสดง `staging`
- [ ] `kubectl exec pod -- cat /etc/app/app.conf` แสดงไฟล์ของคุณ
- [ ] หลังจาก rotate ค่า Secret แล้ว file mounts สะท้อนค่าใหม่ภายใน 60 วินาทีโดยไม่ต้อง restart pod
- [ ] เมื่อลองดู Secret ด้วย `kubectl get secret db-creds -o yaml` จะเห็นเป็น base64 (ไม่ใช่ plaintext)

## การล้างข้อมูล
```bash
kubectl delete cm app-config secret db-creds
```

## การแก้ไขปัญหา
- **Pod ไม่ restart เมื่อ env เปลี่ยน** — env vars ถูก inject ตอนเริ่มต้นเท่านั้น ให้ restart ด้วยตนเอง: `kubectl rollout restart deployment/...`
- **Secret ดูเหมือน "เข้ารหัส" แต่จริง ๆ ไม่ใช่** — Base64 คือการ encoding ไม่ใช่การเข้ารหัส (encryption) ให้ใช้ SealedSecrets หรือ External Secrets สำหรับการเข้ารหัสขณะจัดเก็บ (at-rest)
- **File mount ไม่อัปเดต** — ตรวจสอบ sync interval ของ kubelet บน kind ค่าเริ่มต้นคือ 60 วินาที
