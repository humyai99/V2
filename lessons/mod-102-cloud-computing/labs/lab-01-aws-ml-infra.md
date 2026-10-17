# Lab 01: จัดเตรียมสภาพแวดล้อม AWS ที่พร้อมสำหรับ ML

**ระยะเวลา:** 90 นาที  **สิ่งที่ต้องมีก่อน:** บัญชี AWS, สิทธิ์ IAM admin บนบัญชี sandbox

## วัตถุประสงค์
จัดเตรียม ML workload ขั้นต่ำบน AWS: VPC ที่มี public/private subnet, S3 bucket สำหรับเก็บ model artifact, EC2 instance ที่รัน container iris-api ของคุณ และ Application Load Balancer ที่อยู่ด้านหน้า เมื่อจบแล็บ คุณจะมี URL สาธารณะที่ให้บริการ prediction

## ขั้นตอน

### 1. ตั้งค่า CLI
```bash
aws configure                  # access key, region us-west-2, output json
aws sts get-caller-identity
```

### 2. สร้าง VPC + subnet (CloudShell หรือเครื่อง local)
```bash
aws cloudformation deploy --template-file vpc.yaml --stack-name ml-lab-vpc --capabilities CAPABILITY_NAMED_IAM
```
(หรือใช้ AWS console: VPC → "Create VPC with subnets" → 2 AZ, แต่ละ AZ มี 1 public + 1 private)

### 3. สร้าง S3 bucket
```bash
aws s3 mb s3://ml-lab-$(aws sts get-caller-identity --query Account --output text)-artifacts
aws s3 cp model.joblib s3://ml-lab-$(...)-artifacts/iris/model.joblib
```

### 4. Launch EC2 instance ด้วย image iris-api
- Instance type: `t3.small`
- AMI: Amazon Linux 2023
- Security group: inbound พอร์ต 22 จาก IP ของคุณ, พอร์ต 80 จาก 0.0.0.0/0
- User data:
  ```bash
  #!/bin/bash
  yum install -y docker
  systemctl enable --now docker
  docker run -d -p 80:8000 --restart=always your-account.dkr.ecr.us-west-2.amazonaws.com/iris-api:0.2
  ```

### 5. สร้าง ALB และ target group
- ALB อยู่ใน public subnet, listener บนพอร์ต 80
- Target group: instance โปรโตคอล HTTP พอร์ต 80, health check `/health`
- ลงทะเบียน EC2 instance

### 6. ทดสอบ
```bash
curl http://<alb-dns-name>/health
curl -X POST http://<alb-dns-name>/predict -H 'content-type: application/json' \
  -d '{"sepal_length":5.1,"sepal_width":3.5,"petal_length":1.4,"petal_width":0.2}'
```

## การตรวจสอบ
- [ ] `/health` คืนค่า 200 จาก DNS name ของ ALB
- [ ] `/predict` คืนค่า prediction เป็น JSON
- [ ] S3 bucket มี `iris/model.joblib`
- [ ] Security group ของ EC2 ไม่อนุญาต 0.0.0.0/0 บนพอร์ต 22

## Cleanup
```bash
aws elbv2 delete-load-balancer --load-balancer-arn <arn>
aws ec2 terminate-instances --instance-ids <id>
aws s3 rb s3://ml-lab-$(...)-artifacts --force
aws cloudformation delete-stack --stack-name ml-lab-vpc
```

## การแก้ไขปัญหา
- **EC2 user-data ไม่ทำงาน** — ตรวจสอบ `/var/log/cloud-init-output.log` ผ่าน SSM Session Manager
- **ALB health check ล้มเหลว** — ตรวจให้แน่ใจว่า security group ของ EC2 อนุญาต security group ของ ALB ไม่ใช่แค่ IP ของคุณ
- **ECR pull ถูกปฏิเสธ** — แนบ `AmazonEC2ContainerRegistryReadOnly` ให้กับ instance role
