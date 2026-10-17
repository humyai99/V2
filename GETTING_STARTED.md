# เริ่มต้นใช้งาน - AI Infrastructure Engineer Learning Path

ยินดีต้อนรับ! คู่มือนี้จะช่วยคุณตั้งค่าสภาพแวดล้อมและเริ่มต้นเส้นทางสู่การเป็น AI Infrastructure Engineer

## สารบัญ

- [ตรวจสอบความรู้พื้นฐาน](#prerequisites-check)
- [ตั้งค่าสภาพแวดล้อม](#environment-setup)
- [ตั้งค่าบัญชี Cloud](#cloud-account-setup)
- [ติดตั้งเครื่องมือ](#tools-installation)
- [ตรวจสอบการติดตั้ง](#verify-installation)
- [บทเรียนแรกของคุณ](#your-first-lesson)
- [เคล็ดลับการเรียน](#learning-tips)
- [การแก้ไขปัญหา](#troubleshooting)

---

## ตรวจสอบความรู้พื้นฐาน

ก่อนเริ่ม โปรดตรวจสอบว่าคุณมี:

### ทักษะที่จำเป็น

- **Python**: ระดับกลาง (function, class, การจัดการ error พื้นฐาน)
  - ทดสอบตัวเอง: คุณเขียน class ที่มี method ได้ไหม?
  - ทดสอบตัวเอง: คุณเข้าใจ decorator และ context manager ไหม?
- **Linux/Unix**: การใช้งาน command line พื้นฐาน
  - ทดสอบตัวเอง: คุณเปลี่ยนไดเรกทอรี สร้างไฟล์ และใช้ grep ได้ไหม?
- **Git**: Version control พื้นฐาน
  - ทดสอบตัวเอง: คุณ clone, commit, push และสร้าง branch ได้ไหม?
- **Machine Learning**: แนวคิดพื้นฐาน
  - ทดสอบตัวเอง: คุณเข้าใจ training, inference และการประเมินผลโมเดลไหม?

### ทักษะที่แนะนำ

- ความรู้เบื้องต้นเกี่ยวกับ cloud platform (พื้นฐาน AWS/GCP/Azure)
- พื้นฐาน Docker (แนวคิดเรื่อง container)
- พื้นฐาน networking (HTTP, DNS, load balancing)
- พื้นฐาน SQL

### ข้อกำหนดด้านฮาร์ดแวร์

- **ขั้นต่ำ**: RAM 8GB, พื้นที่ดิสก์ว่าง 20GB
- **แนะนำ**: RAM 16GB, พื้นที่ดิสก์ว่าง 50GB, GPU (สำหรับการทดลองบนเครื่อง)
- **อินเทอร์เน็ต**: การเชื่อมต่อที่เสถียรสำหรับบริการ cloud

---

## ตั้งค่าสภาพแวดล้อม

### 1. ติดตั้ง Python 3.11+

**Linux/macOS:**
```bash
# Check current Python version
python3 --version

# Install Python 3.11 (Ubuntu/Debian)
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11 python3.11-venv python3.11-dev

# Verify installation
python3.11 --version
```

**macOS (Homebrew):**
```bash
brew install python@3.11
```

**Windows:**
ดาวน์โหลดจาก [python.org](https://www.python.org/downloads/) แล้วติดตั้ง

### 2. Clone Repository

```bash
# Clone this repository
git clone https://github.com/ai-infra-curriculum/ai-infra-engineer-learning.git
cd ai-infra-engineer-learning

# Verify you're in the right directory
ls -la
# You should see: lessons/, projects/, README.md, etc.
```

### 3. สร้าง Virtual Environment

```bash
# Create virtual environment
python3.11 -m venv venv

# Activate virtual environment
# Linux/macOS:
source venv/bin/activate

# Windows:
venv\Scripts\activate

# Your prompt should now show (venv)
```

### 4. ติดตั้ง Dependency

```bash
# Upgrade pip
pip install --upgrade pip

# Install core requirements
pip install -r requirements.txt

# Verify installations
pip list
```

**แพ็กเกจที่ควรมี:**
- fastapi
- uvicorn
- torch
- transformers
- numpy
- pandas
- prometheus-client
- pydantic
- pytest

---

## ตั้งค่าบัญชี Cloud

คุณต้องมีบัญชี cloud provider อย่างน้อย **หนึ่ง** ราย (แนะนำให้มีครบทั้งสามรายสำหรับ Module 02)

### AWS Free Tier

1. ไปที่ [aws.amazon.com](https://aws.amazon.com/free/)
2. คลิก "Create a Free Account"
3. ลงทะเบียนให้เสร็จ (ต้องใช้บัตรเครดิต แต่จะไม่ถูกเรียกเก็บเงินหากใช้งานภายใน free tier)
4. **Free tier ประกอบด้วย:**
   - EC2 instance แบบ t2.micro หรือ t3.micro 750 ชั่วโมง/เดือน (12 เดือน)
   - S3 storage 5GB
   - RDS 750 ชั่วโมง (12 เดือน)

**ติดตั้ง AWS CLI:**
```bash
# Linux/macOS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Verify
aws --version

# Configure (you'll need access keys from AWS Console)
aws configure
```

### GCP Free Tier

1. ไปที่ [cloud.google.com/free](https://cloud.google.com/free)
2. คลิก "Get started for free"
3. ลงทะเบียนให้เสร็จ
4. **เครดิต:**
   - เครดิต $300 สำหรับ 90 วัน
   - Always-free tier หลังเครดิตหมดอายุ

**ติดตั้ง gcloud CLI:**
```bash
# Linux
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Initialize
gcloud init

# Verify
gcloud --version
```

### Azure Free Tier

1. ไปที่ [azure.microsoft.com/free](https://azure.microsoft.com/free)
2. คลิก "Start free"
3. ลงทะเบียนให้เสร็จ
4. **เครดิต:**
   - เครดิต $200 สำหรับ 30 วัน
   - บริการฟรี 12 เดือน

**ติดตั้ง Azure CLI:**
```bash
# Linux/macOS
curl -L https://aka.ms/InstallAzureCli | bash

# Verify
az --version

# Login
az login
```

---

## ติดตั้งเครื่องมือ

### 1. Docker

**Linux:**
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add your user to docker group
sudo usermod -aG docker $USER
newgrp docker

# Verify
docker --version
docker run hello-world
```

**macOS/Windows:**
ดาวน์โหลดและติดตั้ง [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### 2. Kubernetes (kubectl)

```bash
# Linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verify
kubectl version --client
```

### 3. Minikube (Kubernetes บนเครื่อง)

```bash
# Linux
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start minikube
minikube start

# Verify
kubectl get nodes
```

### 4. Terraform

```bash
# Linux
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Verify
terraform --version
```

### 5. Git (หากยังไม่ได้ติดตั้ง)

```bash
# Linux
sudo apt install git

# Configure
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## ตรวจสอบการติดตั้ง

รันสคริปต์ตรวจสอบนี้เพื่อเช็กการติดตั้งทั้งหมด:

```bash
# Create verification script
cat > verify_setup.sh << 'EOF'
#!/bin/bash

echo "=== Verifying Installation ==="
echo ""

# Python
echo -n "Python 3.11+: "
python3 --version 2>/dev/null || echo "❌ NOT FOUND"

# Pip packages
echo -n "FastAPI: "
python3 -c "import fastapi" 2>/dev/null && echo "✅ OK" || echo "❌ NOT FOUND"

echo -n "PyTorch: "
python3 -c "import torch" 2>/dev/null && echo "✅ OK" || echo "❌ NOT FOUND"

echo -n "Transformers: "
python3 -c "import transformers" 2>/dev/null && echo "✅ OK" || echo "❌ NOT FOUND"

# Docker
echo -n "Docker: "
docker --version 2>/dev/null && echo "✅ OK" || echo "❌ NOT FOUND"

# Kubernetes
echo -n "kubectl: "
kubectl version --client 2>/dev/null | head -1 && echo "✅ OK" || echo "❌ NOT FOUND"

# Cloud CLIs
echo -n "AWS CLI: "
aws --version 2>/dev/null && echo "✅ OK" || echo "⚠️  OPTIONAL"

echo -n "gcloud CLI: "
gcloud --version 2>/dev/null | head -1 && echo "✅ OK" || echo "⚠️  OPTIONAL"

echo -n "Azure CLI: "
az --version 2>/dev/null | head -1 && echo "✅ OK" || echo "⚠️  OPTIONAL"

# Terraform
echo -n "Terraform: "
terraform --version 2>/dev/null | head -1 && echo "✅ OK" || echo "❌ NOT FOUND"

echo ""
echo "=== Verification Complete ==="
EOF

chmod +x verify_setup.sh
./verify_setup.sh
```

**ผลลัพธ์ที่ควรได้:**
```
=== Verifying Installation ===

Python 3.11+: Python 3.11.x ✅ OK
FastAPI: ✅ OK
PyTorch: ✅ OK
Transformers: ✅ OK
Docker: ✅ OK
kubectl: ✅ OK
AWS CLI: ✅ OK (or ⚠️ OPTIONAL)
gcloud CLI: ✅ OK (or ⚠️ OPTIONAL)
Azure CLI: ✅ OK (or ⚠️ OPTIONAL)
Terraform: ✅ OK

=== Verification Complete ===
```

---

## บทเรียนแรกของคุณ

เมื่อตั้งค่าสภาพแวดล้อมเรียบร้อยแล้ว เริ่มต้นที่ Module 01 ได้เลย!

```bash
# Navigate to Module 01
cd lessons/mod-101-foundations

# Read the module overview
cat README.md

# Start with Lesson 01
cd 01-introduction
cat README.md
```

### เส้นทางการเรียนที่แนะนำ

1. **สัปดาห์ที่ 1-2**: Module 01, บทเรียน 01-04 (Foundations)
2. **สัปดาห์ที่ 3-4**: Module 01, บทเรียน 05-08 (Docker, API)
3. **สัปดาห์ที่ 5-6**: Project 01 (Basic Model Serving)
4. **สัปดาห์ที่ 7-10**: Module 02 (Cloud Computing)
5. **สัปดาห์ที่ 11+**: เรียนต่อ Module 03 เป็นต้นไป

### ตัวเลือกตารางการเรียน

**Full-Time (40 ชั่วโมง/สัปดาห์):**
- เรียนจบในประมาณ 12-15 สัปดาห์

**Part-Time (10 ชั่วโมง/สัปดาห์):**
- เรียนจบในประมาณ 50-60 สัปดาห์ (~1 ปี)

**Weekend Warrior (20 ชั่วโมง/สัปดาห์):**
- เรียนจบในประมาณ 25-30 สัปดาห์ (~6-7 เดือน)

---

## เคล็ดลับการเรียน

### 1. ลงมือปฏิบัติจริง

- **อย่าแค่อ่าน**: พิมพ์ตัวอย่างโค้ดทั้งหมดด้วยตัวเอง
- **ทดลอง**: แก้ไขโค้ด ทำให้พัง แล้วแก้ไข
- **จดบันทึก**: จดสิ่งที่คุณได้เรียนรู้

### 2. เรียนรู้ผ่านโปรเจกต์

- ทำแบบฝึกหัดทั้งหมดในแต่ละบทเรียน
- สร้างโปรเจกต์ตั้งแต่ศูนย์ (อย่าข้าม!)
- ต่อยอดโปรเจกต์ด้วยฟีเจอร์ของคุณเอง

### 3. การจัดการงบประมาณ Cloud

- **ตั้งค่า billing alert** ใน console ของ cloud ทุกราย (แนะนำ: $10, $25, $50)
- **ใช้ทรัพยากร free tier** ทุกครั้งที่ทำได้
- **ปิดทรัพยากร** หลังฝึกเสร็จ
- **ใช้ spot/preemptible instance** เพื่อประหยัดค่าใช้จ่าย

### 4. มีส่วนร่วมกับชุมชน

- เข้าร่วม [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
- แบ่งปันโปรเจกต์และวิธีแก้ปัญหาของคุณ
- ช่วยเหลือผู้เรียนคนอื่น

### 5. ติดตามความคืบหน้า

ใช้ตัวติดตามความคืบหน้า:

```bash
# Copy the progress template
cp progress/checklist.md progress/my-progress.md

# Update as you complete lessons
```

---

## การแก้ไขปัญหา

### ปัญหาที่พบบ่อย

#### ปัญหา: `python3.11: command not found`

**วิธีแก้:**
```bash
# Linux: Install Python 3.11
sudo apt install python3.11

# macOS: Use Homebrew
brew install python@3.11
```

#### ปัญหา: `docker: permission denied`

**วิธีแก้:**
```bash
# Add user to docker group
sudo usermod -aG docker $USER
newgrp docker

# Or run with sudo (not recommended)
sudo docker run hello-world
```

#### ปัญหา: `pip install` ล้มเหลวด้วย SSL error

**วิธีแก้:**
```bash
# Update pip and certificates
pip install --upgrade pip certifi

# Or use HTTP (less secure)
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org <package>
```

#### ปัญหา: พื้นที่ดิสก์เต็ม

**วิธีแก้:**
```bash
# Clean Docker images
docker system prune -a

# Clean pip cache
pip cache purge

# Clean conda cache (if using conda)
conda clean --all
```

#### ปัญหา: การยืนยันตัวตนของ Cloud CLI ล้มเหลว

**AWS:**
```bash
# Reconfigure
aws configure

# Check credentials
aws sts get-caller-identity
```

**GCP:**
```bash
# Re-authenticate
gcloud auth login

# Set project
gcloud config set project YOUR_PROJECT_ID
```

**Azure:**
```bash
# Re-login
az login

# Check subscription
az account show
```

### การขอความช่วยเหลือ

1. **ดู FAQ**: [resources/faq.md](./resources/faq.md)
2. **ค้นหา Issues**: [GitHub Issues](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/issues)
3. **ถามใน Discussions**: [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
4. **สร้าง Issue**: สำหรับบั๊กหรือคำแนะนำที่ไม่ชัดเจน

---

## ขั้นตอนถัดไป

คุณพร้อมเริ่มแล้ว! นี่คือแผนปฏิบัติของคุณ:

- [ ] ตรวจสอบว่าติดตั้งเครื่องมือครบทั้งหมด (รัน `verify_setup.sh`)
- [ ] ตั้งค่าบัญชี cloud อย่างน้อยหนึ่งบัญชี
- [ ] ตั้งค่า billing alert
- [ ] เริ่ม Module 01, บทเรียน 01
- [ ] เข้าร่วมชุมชน GitHub Discussions
- [ ] กด Star ให้ repository นี้เพื่อติดตามการอัปเดต

---

## อ้างอิงด่วน

### คำสั่งสำคัญ

```bash
# Activate virtual environment
source venv/bin/activate

# Run tests
pytest

# Start FastAPI server
uvicorn app:app --reload

# Docker build and run
docker build -t myapp .
docker run -p 8000:8000 myapp

# Kubernetes
kubectl apply -f deployment.yaml
kubectl get pods
kubectl logs <pod-name>

# Check cloud resources
aws ec2 describe-instances
gcloud compute instances list
az vm list
```

### ขีดจำกัดทรัพยากร (Free Tier)

| Provider | Compute | Storage | ระยะเวลา |
|----------|---------|---------|----------|
| AWS | 750h t2.micro | 5GB S3 | 12 เดือน |
| GCP | เครดิต $300 | รวมอยู่แล้ว | 90 วัน |
| Azure | เครดิต $200 | รวมอยู่แล้ว | 30 วัน |

---

**พร้อมเริ่มต้นเส้นทาง AI Infrastructure Engineering ของคุณแล้วหรือยัง?**

```bash
cd lessons/mod-101-foundations/01-introduction
cat README.md
```

ขอให้สนุกกับการเรียนรู้! 🚀
