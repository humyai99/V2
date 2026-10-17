# Lab 02: Service Discovery — ClusterIP, NodePort, LoadBalancer

**ระยะเวลา:** 45 นาที  **ข้อกำหนดเบื้องต้น:** ทำ Lab 01 เสร็จแล้ว

## วัตถุประสงค์
ทำความเข้าใจว่า Services ส่งต่อ traffic ไปยัง Pods อย่างไร ความแตกต่างระหว่าง ClusterIP/NodePort/LoadBalancer และ DNS ทำงานอย่างไรภายในคลัสเตอร์

## ขั้นตอน

### 1. ClusterIP (ค่าเริ่มต้น)
```yaml
apiVersion: v1
kind: Service
metadata: { name: web }
spec:
  selector: { app: web }
  ports: [{ port: 80, targetPort: 80 }]
```
```bash
kubectl apply -f svc.yaml
kubectl get svc web
```

### 2. เรียกใช้งานจากภายในคลัสเตอร์
```bash
kubectl run probe --rm -it --image=curlimages/curl --restart=Never -- sh
# Inside the probe container:
curl http://web                       # by short name (same namespace)
curl http://web.default.svc.cluster.local
nslookup web                          # resolves to ClusterIP
exit
```

### 3. NodePort — เปิดพอร์ตบนทุก node
```yaml
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080
```
```bash
kubectl apply -f svc.yaml
curl http://localhost:8080            # via kind port-mapping
```

### 4. LoadBalancer (บนคลาวด์) หรือผ่าน metallb (บนเครื่อง local)
บนคลัสเตอร์คลาวด์ `type: LoadBalancer` จะจัดสรร external IP ให้ ส่วนบน kind ให้ติดตั้ง metallb เพื่อให้ได้ประสบการณ์ใช้งานแบบเดียวกัน:
```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml
# Then configure an address pool (see metallb docs).
```

### 5. ตรวจสอบ endpoints
```bash
kubectl get endpoints web              # one IP per Ready pod
kubectl describe svc web | head -20
```

### 6. Service กับ label selector ที่ไม่ตรงกัน
เปลี่ยน pod label ของ Deployment เป็น `app: web-v2` ขณะที่ selector ของ Service ยังเป็น `app: web` แล้วดู endpoints ว่างลง:
```bash
kubectl get endpoints web -w
```

## การตรวจสอบ
- [ ] DNS resolve `web` เป็น ClusterIP ได้จากภายในคลัสเตอร์
- [ ] `kubectl get endpoints web` แสดง IP หนึ่งรายการต่อ pod ที่ Ready หนึ่งตัว
- [ ] ทำให้ label selector พัง → endpoints ว่าง → traffic จากภายนอกล้มเหลว

## การล้างข้อมูล
```bash
kubectl delete svc web
```

## การแก้ไขปัญหา
- **`Service has no endpoints`** — label selector ไม่ตรงกับ pod ที่ Ready ตัวใดเลย ตรวจสอบด้วย `kubectl get pods --show-labels`
- **เข้าถึง NodePort จาก host ไม่ได้** — port mapping ของ kind ต้องรวม nodePort ไว้ด้วย (ดู kind-config.yaml จาก mod-101 lab 03)
- **DNS resolution ล้มเหลวภายในคลัสเตอร์** — pod ของ CoreDNS ไม่ healthy ตรวจด้วย `kubectl get pods -n kube-system | grep dns`
