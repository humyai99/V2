# Lab 01: Pod และ Deployment แรกของคุณ

**ระยะเวลา:** 60 นาที  **ข้อกำหนดเบื้องต้น:** มีคลัสเตอร์ kind/minikube ทำงานอยู่

## วัตถุประสงค์
รัน Pod เปล่า ๆ จากนั้นขยับไปใช้ Deployment ที่มี replicas, rolling updates และ rollback

## ขั้นตอน

### 1. รัน Pod เปล่า
```bash
kubectl run nginx --image=nginx:1.27 --port=80
kubectl get pods
kubectl describe pod nginx | tail -20
kubectl port-forward pod/nginx 8080:80 &
curl http://localhost:8080
kill %1
kubectl delete pod nginx
```
สังเกตว่า Pod หายไปเลย — ไม่มี controller คอยสร้างมันขึ้นมาใหม่

### 2. ยกระดับเป็น Deployment
```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata: { name: web }
spec:
  replicas: 3
  selector: { matchLabels: { app: web } }
  template:
    metadata: { labels: { app: web } }
    spec:
      containers:
        - name: nginx
          image: nginx:1.27
          ports: [{ containerPort: 80 }]
          resources:
            requests: { cpu: 50m, memory: 64Mi }
            limits:   { cpu: 200m, memory: 128Mi }
```
```bash
kubectl apply -f deployment.yaml
kubectl get pods -l app=web
kubectl delete pod -l app=web --field-selector=status.phase=Running --grace-period=0  # delete one
kubectl get pods -l app=web                                                            # replaced
```

### 3. Roll out image ใหม่
```bash
kubectl set image deployment/web nginx=nginx:1.27-alpine
kubectl rollout status deployment/web
kubectl rollout history deployment/web
```

### 4. Rollback
```bash
kubectl rollout undo deployment/web
kubectl rollout history deployment/web
```

### 5. ปรับแต่งกลยุทธ์การ rollout
```yaml
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
```
apply ใหม่ แล้ว redeploy ด้วย image ใหม่ สังเกตการ rollout ที่เข้มงวดขึ้น: มี pod ไม่เกิน 4 ตัวในเวลาใดก็ตาม และ Ready อย่างน้อย 3 ตัว

## การตรวจสอบ
- [ ] `kubectl get deployment web` แสดง 3/3 Ready
- [ ] หลังจากลบ pod หนึ่งตัว จะมีตัวแทนปรากฏขึ้นภายในไม่กี่วินาที
- [ ] `kubectl rollout history` แสดงอย่างน้อย 3 revisions
- [ ] Rollback คืนค่า image ก่อนหน้า (ตรวจสอบด้วย `kubectl describe pod -l app=web | grep Image`).

## การล้างข้อมูล
```bash
kubectl delete -f deployment.yaml
```

## การแก้ไขปัญหา
- **Pods ค้างที่สถานะ Pending** — `kubectl describe pod` จะแสดงเหตุผลของการจัดตาราง (CPU/memory ไม่พอ, taints)
- **Rollout ค้าง** — ใช้ `kubectl rollout status --timeout=30s` แล้ว `kubectl describe` pods ตัวใหม่
