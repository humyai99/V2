# AI Infrastructure Engineer - เส้นทางการเรียนรู้

<!-- aicg:site-banner -->
> 🎓 ส่วนหนึ่งของระบบนิเวศ **AI Career Curriculum** แบบฟรีและ open-source — [Infrastructure](https://github.com/ai-infra-curriculum) · [ML Engineering](https://github.com/ml-engineering-curriculum) · [AI Engineering](https://github.com/ai-engineering-curriculum) · [Governance](https://github.com/ai-governance-curriculum) คลาสเรียนสดและโปรแกรมสำหรับทีม: **[ai-infra-curriculum.github.io](https://ai-infra-curriculum.github.io/)**
<!-- /aicg:site-banner -->

<!-- aicg:sponsor -->
> 💜 **[สนับสนุนหลักสูตรนี้](https://github.com/sponsors/AI-Infra-Curriculum)** — การสนับสนุนช่วยให้ AI Career Curriculum แบบ open-source ทั้งหมดยังคงฟรีและพัฒนาต่อไปได้
<!-- /aicg:sponsor -->

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Progress](https://img.shields.io/badge/modules-10/10_complete-brightgreen.svg)
![Projects](https://img.shields.io/badge/projects-3/3_complete-brightgreen.svg)
![Duration](https://img.shields.io/badge/duration-500+_hours-red.svg)

*เชี่ยวชาญ AI Infrastructure Engineering ผ่านโปรเจกต์ภาคปฏิบัติและการเรียนรู้เชิงปฏิบัติ*

[ความรู้พื้นฐาน](./PREREQUISITES.md) • [เริ่มต้นใช้งาน](#-เริ่มต้นใช้งาน) • [หลักสูตร](#-ภาพรวมหลักสูตร) • [โปรเจกต์](#-โปรเจกต์) • [แหล่งข้อมูล](#-แหล่งข้อมูล)

</div>

---

## 🎯 ภาพรวม

Repository นี้ประกอบด้วย **เส้นทางการเรียนรู้ที่สมบูรณ์และพร้อมใช้งานระดับ production** สำหรับการเป็น **AI Infrastructure Engineer** ผ่านโมดูลที่ครอบคลุม โปรเจกต์จากโลกจริง และ code stub ระดับ production พร้อม comment TODO เชิงการสอน คุณจะพัฒนาทักษะที่จำเป็นในการสร้าง deploy และดูแล ML infrastructure ในระดับ scale

**สถานะของ Repository:** ✅ **เสร็จสมบูรณ์ 100%** - ทุกโมดูลและโปรเจกต์พร้อมให้เรียนแล้ว!

### สิ่งที่คุณจะเชี่ยวชาญ

- ✅ **สร้าง ML Infrastructure** ตั้งแต่ศูนย์ (Docker, Kubernetes, cloud platform)
- ✅ **Deploy ระบบ ML ระดับ Production** พร้อม auto-scaling และ monitoring ที่ครอบคลุม
- ✅ **พัฒนา MLOps pipeline แบบ End-to-End** (Airflow, MLflow, DVC)
- ✅ **Deploy LLM Infrastructure ล้ำสมัย** (vLLM, RAG, vector database)
- ✅ **Scale การเทรน** ด้วยระบบแบบกระจายและ GPU cluster
- ✅ **Monitor และแก้ไขปัญหา** ระบบ ML ที่ซับซ้อนใน production
- ✅ **Optimize ค่าใช้จ่าย** ข้าม cloud provider (ประหยัดได้ 60-80%)

### ทำไมต้องเส้นทางการเรียนรู้นี้?

- 🎓 **สอดคล้องกับอุตสาหกรรม**: อ้างอิงจากข้อกำหนดงานจริงของ FAANG และบริษัทเทคชั้นนำ
- 💻 **ลงมือปฏิบัติจริง**: Code stub พร้อม comment TODO นำทางคุณผ่านการพัฒนาจริง
- 🏗️ **พร้อมสำหรับ Production**: เรียนรู้ pattern ที่ใช้ใน Netflix, Uber, Airbnb, OpenAI
- 📊 **มุ่งเน้นอาชีพ**: ตรงกับตำแหน่ง AI Infrastructure Engineer ที่มีรายได้ $120k-$180k
- 🚀 **ค่อยเป็นค่อยไป**: 10 โมดูลไล่ระดับจากพื้นฐานจนถึง LLM infrastructure ขั้นสูง
- 🔥 **Stack ทันสมัย**: เทคโนโลยีปี 2024-2025 (vLLM, RAG, GPU optimization)

---

## ✨ มีอะไรใหม่

**2026-05-27 — ปรับโครงสร้างให้เป็นมาตรฐาน:**
- 🧹 **ลบไดเรกทอรี placeholder `mod-XXX-*/` ที่ว่างเปล่า 10 รายการในระดับ root** ซึ่งเป็นสิ่งที่หลงเหลือจากโครงสร้างก่อน refactor เนื้อหาหลักของทุกโมดูลอยู่ภายใต้ `lessons/mod-XXX-*/` มาระยะหนึ่งแล้ว ขณะนี้ repo มีโครงสร้างตรงตามที่การตรวจสอบของ curriculum-runner คาดหวัง (`lessons/` สำหรับเนื้อหาการเรียน, `modules/` ใน repo เฉลยที่จับคู่กัน)
- 🧹 **ลบ `lessons/mod-101-foundations/exercises/solutions/` ที่ไม่มีที่อ้างอิง** (เป็น index ไฟล์เดียวที่ซ้ำซ้อน) เฉลยอ้างอิงอยู่ใน repo คู่กัน [`ai-infra-engineer-solutions`](https://github.com/ai-infra-curriculum/ai-infra-engineer-solutions) และลิงก์ในบทเรียนต่าง ๆ ชี้ไปที่นั่นโดยตรงแล้ว

**อัปเดตพฤษภาคม 2026:**
- 🧪 **เขียน lab ครบทั้ง 62 รายการตามที่สัญญาไว้** ครอบคลุมทั้ง 10 โมดูล (foundations → LLM infrastructure) แต่ละ lab เป็น walkthrough ที่มีเนื้อหาจริงและรันได้ ประกอบด้วยวัตถุประสงค์ ความรู้พื้นฐาน ขั้นตอนแบบมีลำดับ checklist สำหรับตรวจสอบ การ cleanup และการแก้ไขปัญหา
- 📒 **รายการหนังสือแนะนำใหม่ 2 รายการ:** `advanced-engineer-path.md` และ `staff-engineer-path.md` (9–18 เดือน และ 2–5 ปี ตามลำดับ)
- 🧹 **ปรับโครงสร้าง:** แก้ไขเอกสารบรรยายที่ซ้ำกันใน mod-101, รวมตำแหน่งของแบบทดสอบ, เติมเนื้อหาจริงลงใน Makefile/pyproject ที่ว่างเปล่า, แก้ไขการอ้างสถานะใน CURRICULUM.md ให้สะท้อนความคืบหน้าจริง
- 🔍 **ตรวจทานความถูกต้องของ CURRICULUM.md:** การอ้างว่า "เสร็จสมบูรณ์ 100%" ก่อนหน้านี้ถูกแทนที่ด้วยการแจกแจงแบบฝึกหัด/lab รายโมดูล เอกสารบรรยายและโปรเจกต์มีคุณภาพดีเยี่ยม ส่วนแบบฝึกหัดมี 32 จาก 119 รายการที่สัญญาไว้ และจะทยอยเพิ่มในการอัปเดตเนื้อหาครั้งต่อ ๆ ไป

**ก่อนหน้านี้:**
- 📝 **แบบทดสอบที่ครอบคลุม** สำหรับโมดูล 102-110 (265+ ข้อ)
  - Module 102: Cloud Computing (กลางโมดูล + ท้ายโมดูล, 50 ข้อ)
  - Module 103: Containerization (25 ข้อ)
  - Module 104: Kubernetes (30 ข้อ)
  - Module 105: Data Pipelines (25 ข้อ)
  - Module 106: MLOps (30 ข้อ)
  - Module 107: GPU Computing (25 ข้อ)
  - Module 108: Monitoring (25 ข้อ)
  - Module 109: IaC (25 ข้อ)
  - Module 110: LLM Infrastructure (30 ข้อ)
- 📋 **คู่มือเวอร์ชันของเทคโนโลยี** - ข้อกำหนดครบถ้วนสำหรับเครื่องมือกว่า 100 รายการ
- 🗺️ **การอ้างอิงข้ามหลักสูตร** - การจับคู่กับแทร็ก Junior
- 📈 **คู่มือความก้าวหน้าในอาชีพ** - Roadmap จาก Engineer สู่ Principal

---

## 📊 สิ่งที่รวมอยู่

### 10 โมดูลการเรียนรู้ที่สมบูรณ์ (130 ไฟล์)

| โมดูล | หัวข้อ | ชั่วโมง | สถานะ | แบบทดสอบ |
|--------|-------|-------|--------|------|
| 01 | **Foundations** | 50h | ✅ เสร็จสมบูรณ์ (15 ไฟล์) | ✅ 30Q |
| 02 | **Cloud Computing** | 50h | ✅ เสร็จสมบูรณ์ (11 ไฟล์) | ✨ **+50Q** |
| 03 | **Containerization** | 50h | ✅ เสร็จสมบูรณ์ (14 ไฟล์) | ✨ **+25Q** |
| 04 | **Kubernetes** | 50h | ✅ เสร็จสมบูรณ์ (13 ไฟล์) | ✨ **+30Q** |
| 05 | **Data Pipelines** | 50h | ✅ เสร็จสมบูรณ์ (12 ไฟล์) | ✨ **+25Q** |
| 06 | **MLOps** | 50h | ✅ เสร็จสมบูรณ์ (12 ไฟล์) | ✨ **+30Q** |
| 07 | **GPU Computing** | 50h | ✅ เสร็จสมบูรณ์ (12 ไฟล์) | ✨ **+25Q** |
| 08 | **Monitoring & Observability** | 50h | ✅ เสร็จสมบูรณ์ (11 ไฟล์) | ✨ **+25Q** |
| 09 | **Infrastructure as Code** | 50h | ✅ เสร็จสมบูรณ์ (12 ไฟล์) | ✨ **+25Q** |
| 10 | **LLM Infrastructure** | 50h | ✅ เสร็จสมบูรณ์ (12 ไฟล์) | ✨ **+30Q** |

### 3 โปรเจกต์ระดับ Production (77 ไฟล์)

| โปรเจกต์ | เทคโนโลยี | ระยะเวลา | ไฟล์ | สถานะ |
|---------|-------------|----------|-------|--------|
| **01: Basic Model Serving** | FastAPI + K8s + Monitoring | 30h | ~30 | ✅ เสร็จสมบูรณ์ |
| **02: MLOps Pipeline** | Airflow + MLflow + DVC | 40h | 30 | ✅ เสร็จสมบูรณ์ |
| **03: LLM Deployment** | vLLM + RAG + Vector DB | 50h | 47 | ✅ เสร็จสมบูรณ์ |

**รวมทั้ง Repository:** 207 ไฟล์ | โค้ดกว่า ~95,000 บรรทัด | เนื้อหาการเรียนรู้กว่า 500 ชั่วโมง

---

## 🎓 ความรู้พื้นฐาน

### ทางเลือกที่ 1: เรียนหลักสูตร Junior ให้จบ (แนะนำ)

หากคุณเรียนจบหลักสูตร [**Junior AI Infrastructure Engineer**](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning) แล้ว คุณมีความรู้พื้นฐานที่จำเป็น **ครบทั้งหมด**! ✅

หลักสูตร Junior ครอบคลุม:
- ✅ พื้นฐานและแนวคิดขั้นสูงของ Python
- ✅ ความเชี่ยวชาญ command line ของ Linux/Unix
- ✅ Git และ workflow ของ version control
- ✅ พื้นฐาน ML (PyTorch, TensorFlow)
- ✅ Docker และ containerization
- ✅ แนะนำ Kubernetes
- ✅ การพัฒนา API และฐานข้อมูล
- ✅ Monitoring และ cloud platform

**ระยะเวลา**: 440 ชั่วโมง (22 สัปดาห์แบบ part-time, 11 สัปดาห์แบบ full-time)

### ทางเลือกที่ 2: ประเมินตนเอง

**ยังไม่ได้เรียนหลักสูตร Junior?** ใช้ [**คู่มือความรู้พื้นฐาน**](./PREREQUISITES.md) ที่ครอบคลุมของเราเพื่อ:
- ตรวจสอบความพร้อมด้วย checklist ทักษะโดยละเอียด
- ระบุช่องว่างด้านความรู้
- รับคำแนะนำการเรียนรู้เฉพาะบุคคล
- รันการประเมินทักษะอัตโนมัติ

### ข้อกำหนดขั้นต่ำ

หากเรียนด้วยตนเอง คุณต้องมี:
- **Python 3.9+** (ระดับกลาง: OOP, async, testing, type hint)
- **Linux/Unix CLI** (bash scripting, process, debugging)
- **พื้นฐาน Git** (branching, merging, การทำงานร่วมกัน)
- **พื้นฐาน ML** (PyTorch/TensorFlow, training, inference, evaluation)
- **พื้นฐาน Docker** (image, container, Compose)
- **แนะนำ Kubernetes** (pod, deployment, service)

**👉 ไม่แน่ใจว่าพร้อมหรือยัง?** อ่าน [**คู่มือความรู้พื้นฐาน**](./PREREQUISITES.md) สำหรับการประเมินโดยละเอียด

---

## 🚀 เริ่มต้นใช้งาน

### เริ่มต้นอย่างรวดเร็ว

```bash
# 1. Clone repository
git clone https://github.com/ai-infra-curriculum/ai-infra-engineer-learning.git
cd ai-infra-engineer-learning

# 2. Create virtual environment
python3.11 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Start with Module 01
cd lessons/mod-101-foundations
cat README.md
```

### เส้นทางการเรียนรู้

1. **Module 01-02 (Foundations)** - เริ่มที่นี่หากเพิ่งเริ่มต้นกับ ML infrastructure
2. **Module 03-04 (Core Infrastructure)** - เชี่ยวชาญ Docker และ Kubernetes
3. **Module 05-06 (MLOps)** - Data pipeline และ ML operations
4. **Module 07-08 (ขั้นสูง)** - GPU computing และ monitoring
5. **Module 09-10 (Modern Stack)** - IaC และ LLM infrastructure

**คู่มือโดยละเอียด:** [GETTING_STARTED.md](./GETTING_STARTED.md)

---

## 📖 ภาพรวมหลักสูตร

### Module 01: Foundations ✅
**50 ชั่วโมง | 15 ไฟล์**

สร้างพื้นฐานด้าน ML infrastructure:
- ภาพรวมของ ML infrastructure และเส้นทางอาชีพ
- การตั้งค่า Python environment และ best practice
- ML framework (PyTorch, TensorFlow)
- พื้นฐาน Docker และ containerization
- การพัฒนา REST API ด้วย FastAPI

[ดู Module 01 →](./lessons/mod-101-foundations/README.md)

---

### Module 02: Cloud Computing ✅
**50 ชั่วโมง | 11 ไฟล์**

เชี่ยวชาญ cloud platform สำหรับ ML:
- สถาปัตยกรรม cloud สำหรับ ML workload
- AWS (EC2, S3, EKS, SageMaker)
- GCP (Compute Engine, GCS, GKE, Vertex AI)
- Azure (VMs, Blob Storage, AKS, Azure ML)
- กลยุทธ์ multi-cloud และ cost optimization (ประหยัด 60-80%)

[ดู Module 02 →](./lessons/mod-102-cloud-computing/README.md)

---

### Module 03: Containerization ✅
**50 ชั่วโมง | 14 ไฟล์**

เจาะลึกเรื่อง container:
- สถาปัตยกรรม Docker และ best practice
- Multi-stage build และการ optimize
- Docker Compose สำหรับแอปพลิเคชันหลายเซอร์วิส
- Container registry และการจัดการ image
- Security และ vulnerability scanning

[ดู Module 03 →](./lessons/mod-103-containerization/README.md)

---

### Module 04: Kubernetes ✅
**50 ชั่วโมง | 13 ไฟล์**

เชี่ยวชาญ Kubernetes สำหรับ ML:
- สถาปัตยกรรมและองค์ประกอบของ Kubernetes
- Deployment, Service, ConfigMap, Secret
- การจัดการและ scheduling ทรัพยากร GPU
- Autoscaling (HPA, VPA, Cluster Autoscaler)
- Helm chart และ GitOps ด้วย ArgoCD

[ดู Module 04 →](./lessons/mod-104-kubernetes/README.md)

---

### Module 05: Data Pipelines ✅
**50 ชั่วโมง | 12 ไฟล์**

สร้าง data pipeline ที่แข็งแกร่ง:
- Apache Airflow สำหรับ workflow orchestration
- การประมวลผลข้อมูลด้วย Apache Spark
- Streaming data ด้วย Apache Kafka
- Data version control ด้วย DVC
- การตรวจสอบและ monitoring คุณภาพข้อมูล

[ดู Module 05 →](./lessons/mod-105-data-pipelines/README.md)

---

### Module 06: MLOps ✅
**50 ชั่วโมง | 12 ไฟล์**

นำ best practice ของ MLOps ไปใช้:
- Experiment tracking ด้วย MLflow
- Model registry และ versioning
- Feature store และ feature engineering
- CI/CD สำหรับโมเดล ML
- A/B testing และการทดลอง
- ML governance และ best practice

[ดู Module 06 →](./lessons/mod-106-mlops/README.md)

---

### Module 07: GPU Computing & Distributed Training ✅
**50 ชั่วโมง | 12 ไฟล์**

ใช้พลังของ GPU อย่างเต็มที่:
- พื้นฐานการเขียนโปรแกรม CUDA
- GPU acceleration ใน PyTorch
- Distributed training (DDP, FSDP)
- การเทรนแบบ multi-GPU และ multi-node
- Model parallelism และ pipeline parallelism
- GPU memory optimization

[ดู Module 07 →](./lessons/mod-107-gpu-computing/README.md)

---

### Module 08: Monitoring & Observability ✅
**50 ชั่วโมง | 11 ไฟล์**

สร้าง observability ที่ครอบคลุม:
- Prometheus และ Grafana
- Metrics, log และ trace (OpenTelemetry)
- Distributed tracing ด้วย Jaeger
- Alerting และ incident response
- Monitoring ประสิทธิภาพของโมเดล
- SLI, SLO และ SLA

[ดู Module 08 →](./lessons/mod-108-monitoring-observability/README.md)

---

### Module 09: Infrastructure as Code ✅
**50 ชั่วโมง | 12 ไฟล์**

ทำ infrastructure ให้เป็นอัตโนมัติ:
- พื้นฐาน Terraform และ best practice
- Pulumi สำหรับ IaC หลายภาษา
- CloudFormation สำหรับ AWS
- State management และ module
- Deployment หลาย environment
- GitOps workflow

[ดู Module 09 →](./lessons/mod-109-infrastructure-as-code/README.md)

---

### Module 10: LLM Infrastructure ✅
**50 ชั่วโมง | 12 ไฟล์**

เชี่ยวชาญ LLM infrastructure ล้ำสมัย (2024-2025):
- LLM serving ด้วย vLLM และ TensorRT-LLM
- RAG (Retrieval-Augmented Generation)
- Vector database (Pinecone, Weaviate, Milvus)
- Model quantization (FP16, INT8)
- GPU optimization สำหรับ inference
- การติดตามและ optimize ค่าใช้จ่าย

[ดู Module 10 →](./lessons/mod-110-llm-infrastructure/README.md)

---

## 🛠️ โปรเจกต์

### Project 01: Basic Model Serving System ✅
**⭐ ผู้เริ่มต้น | 30 ชั่วโมง | ~30 ไฟล์**

สร้างระบบ model serving ที่สมบูรณ์:
- FastAPI REST API สำหรับ image classification
- Docker containerization พร้อมการ optimize
- Kubernetes deployment พร้อม monitoring
- Dashboard ของ Prometheus และ Grafana
- CI/CD pipeline ด้วย GitHub Actions

**เทคโนโลยี:** FastAPI, Docker, Kubernetes, PyTorch, Prometheus, Grafana

[ดู Project 01 →](./projects/project-101-basic-model-serving/README.md)

---

### Project 02: End-to-End MLOps Pipeline ✅
**⭐⭐ ระดับกลาง | 40 ชั่วโมง | 30 ไฟล์**

สร้าง MLOps pipeline ระดับ production:
- Apache Airflow DAG (data, training, deployment)
- MLflow experiment tracking และ model registry
- DVC สำหรับ data versioning
- Deploy โมเดลขึ้น Kubernetes โดยอัตโนมัติ
- Monitoring และ alerting ที่ครอบคลุม
- CI/CD พร้อม automated testing

**เทคโนโลยี:** Airflow, MLflow, DVC, PostgreSQL, Redis, MinIO, Kubernetes

[ดู Project 02 →](./projects/project-102-mlops-pipeline/README.md)

---

### Project 03: LLM Deployment Platform ✅
**⭐⭐⭐ ขั้นสูง | 50 ชั่วโมง | 47 ไฟล์**

Deploy LLM infrastructure ล้ำสมัย:
- vLLM/TensorRT-LLM สำหรับ serving ที่ optimize แล้ว
- ระบบ RAG พร้อม vector database (Pinecone/ChromaDB/Milvus)
- Document ingestion pipeline (PDF, TXT, web)
- FastAPI พร้อม streaming แบบ Server-Sent Events
- Kubernetes ที่รองรับ GPU
- การติดตามและ optimize ค่าใช้จ่าย
- Monitoring ที่ครอบคลุม

**เทคโนโลยี:** vLLM, LangChain, Vector DBs, FastAPI, Kubernetes + GPU, Transformers

[ดู Project 03 →](./projects/project-103-llm-deployment/README.md)

---

## 💰 ข้อพิจารณาด้านค่าใช้จ่าย

### ค่าใช้จ่าย Cloud

เนื้อหาการเรียนทั้งหมดสามารถเรียนจบได้ภายใน **ขีดจำกัดของ free tier**:
- **AWS**: t2.micro 750 ชั่วโมง/เดือน + เครดิต $300 (แตกต่างกันไป)
- **GCP**: เครดิต $300 (90 วัน)
- **Azure**: เครดิต $200 (30 วัน)

**ค่าใช้จ่าย GPU** (ไม่บังคับ สำหรับโปรเจกต์ขั้นสูง):
- On-demand: $1-3/ชั่วโมง
- Spot instance: $0.30-1/ชั่วโมง (ประหยัด 70%)
- ประมาณการรวม: $50-150 สำหรับหลักสูตรทั้งหมด

### เคล็ดลับการ Optimize

- ใช้ spot instance สำหรับการเทรน (ประหยัด 60-90%)
- ใช้ประโยชน์จาก free tier ของ cloud provider หลายราย
- ลบทรัพยากรเมื่อไม่ได้ใช้งาน
- พัฒนาบนเครื่องของตัวเองเมื่อทำได้

---

## 📚 แหล่งข้อมูล

### เอกสารที่รวมอยู่
- เนื้อหาบทเรียนที่ครอบคลุมพร้อมตัวอย่าง
- Code stub พร้อม comment TODO สำหรับการพัฒนาแบบมีแนวทาง
- ข้อกำหนดโปรเจกต์ที่สมบูรณ์พร้อมแผนภาพสถาปัตยกรรม
- แบบทดสอบและการประเมินผลสำหรับแต่ละโมดูล
- Best practice และ design pattern

### แหล่งข้อมูลภายนอก
- 📖 **รายการหนังสือแนะนำ**: [resources/reading-lists/](./resources/reading-lists/) — เส้นทาง advanced + staff-engineer
- 🛠️ **Cheat Sheet**: [resources/cheat-sheets/](./resources/cheat-sheets/) — docker, kubernetes, git, linux, python infrastructure
- ❓ **FAQ**: [resources/faq.md](./resources/faq.md)

### เอกสารหลักสูตร
- 📋 **[คู่มือเวอร์ชันของเทคโนโลยี](VERSIONS.md)** - เวอร์ชันที่แนะนำสำหรับเครื่องมือและ framework ทั้งหมด
- 🗺️ **[การอ้างอิงข้ามหลักสูตร](https://github.com/ai-infra-curriculum/.github/blob/main/CURRICULUM_CROSS_REFERENCE.md)** - การจับคู่ระหว่างแทร็ก Junior และ Engineer
- 📈 **[คู่มือความก้าวหน้าในอาชีพ](https://github.com/ai-infra-curriculum/.github/blob/main/CAREER_PROGRESSION.md)** - บันไดอาชีพครบถ้วนตั้งแต่ Junior ถึง Principal

---

## 🎯 ผลลัพธ์การเรียนรู้และผลต่ออาชีพ

### หลังเรียนจบ คุณจะมีคุณสมบัติสำหรับ:

**AI Infrastructure Engineer**
- 💰 เงินเดือน: $120,000 - $180,000
- 🏢 บริษัท: บริษัทเทค สตาร์ทอัพด้าน AI องค์กรที่เน้น ML
- 📈 ความต้องการ: สูงมาก (เติบโต 35% ต่อปี)

**ML Platform Engineer**
- 💰 เงินเดือน: $130,000 - $190,000
- 🏢 บริษัท: บริษัทเทคขนาดใหญ่ องค์กรที่มีทีม ML
- 📈 ความต้องการ: สูง (ตำแหน่งเฉพาะทาง)

**MLOps Engineer**
- 💰 เงินเดือน: $110,000 - $170,000
- 🏢 บริษัท: ทุกองค์กรที่ทำ ML ในระดับ scale
- 📈 ความต้องการ: สูงมาก (ตำแหน่งด้าน ML ที่เติบโตเร็วที่สุด)

### ทักษะที่คุณจะแสดงให้เห็น

✅ ความเชี่ยวชาญ Kubernetes พร้อม GPU scheduling
✅ การพัฒนา MLOps pipeline แบบ end-to-end
✅ LLM infrastructure และระบบ RAG
✅ Distributed training และ GPU optimization
✅ Monitoring และ observability ใน production
✅ ความเชี่ยวชาญ cloud platform (AWS, GCP, Azure)
✅ Infrastructure as Code ด้วย Terraform
✅ กลยุทธ์ cost optimization

---

## 📊 สถิติของ Repository

- **จำนวนไฟล์ทั้งหมด:** 207
- **จำนวนบรรทัดโดยประมาณ:** ~95,000+
- **โมดูล:** 10 (เสร็จสมบูรณ์ทั้งหมด)
- **โปรเจกต์:** 3 (เสร็จสมบูรณ์ทั้งหมด)
- **ชั่วโมงการเรียน:** 500+
- **เทคโนโลยี:** 50+

### Technology Stack ที่ครอบคลุม

**Core Infrastructure:**
Docker, Kubernetes, Terraform, Helm, ArgoCD

**ML และ Data:**
PyTorch, TensorFlow, Apache Airflow, Apache Spark, Kafka, DVC

**MLOps:**
MLflow, Feature Stores, Model Registry, CI/CD

**LLM Infrastructure:**
vLLM, TensorRT-LLM, LangChain, Vector Databases (Pinecone, Milvus, ChromaDB)

**Cloud Platform:**
AWS (EC2, S3, EKS, SageMaker), GCP (GCE, GCS, GKE, Vertex AI), Azure (VMs, AKS, Azure ML)

**Monitoring:**
Prometheus, Grafana, OpenTelemetry, Jaeger, ELK Stack

**GPU Computing:**
CUDA, NCCL, Multi-GPU training, Distributed training

---

## 🤝 การร่วมพัฒนา

เรายินดีรับการร่วมพัฒนา! โปรดดู [CONTRIBUTING.md](./CONTRIBUTING.md) สำหรับ:
- การรายงานและแก้ไขบั๊ก
- การปรับปรุงเอกสาร
- แบบฝึกหัดและตัวอย่างใหม่
- Best practice ที่อัปเดต

---

## 🆘 การขอความช่วยเหลือ

- 📖 **เอกสาร**: เริ่มต้นที่ [GETTING_STARTED.md](./GETTING_STARTED.md)
- 💬 **GitHub Discussions**: [ถามคำถาม](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
- 🐛 **Issues**: [รายงานบั๊ก](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/issues)
- 📧 **ติดต่อ**: ai-infra-curriculum@joshua-ferguson.com

---

## 📜 สัญญาอนุญาต

โปรเจกต์นี้อยู่ภายใต้ **MIT License** - ดูรายละเอียดที่ [LICENSE](./LICENSE)

---

## 🌟 ตัวชี้วัดความสำเร็จ

เมื่อเรียนจบ คุณควรสามารถ:

- [ ] Deploy โมเดล ML ขึ้น production ได้อย่างมั่นใจ
- [ ] สร้าง MLOps pipeline ที่สมบูรณ์ได้ตั้งแต่ศูนย์
- [ ] พัฒนา LLM infrastructure พร้อม RAG
- [ ] Optimize ค่าใช้จ่าย cloud ได้ 60-80%
- [ ] Debug ระบบแบบกระจายที่ซับซ้อน
- [ ] ผ่านการสัมภาษณ์งานด้านเทคนิคสำหรับตำแหน่ง AI Infrastructure
- [ ] อภิปรายเรื่อง trade-off ใน system design ได้อย่างมั่นใจ
- [ ] นำโปรเจกต์ด้าน infrastructure ในองค์กรของคุณ

---

## 🚀 ขั้นตอนถัดไปหลังเรียนจบ

หลักสูตรนี้เตรียมความพร้อมสำหรับตำแหน่ง **AI Infrastructure Engineer** สำหรับความก้าวหน้าในอาชีพ:

1. **สั่งสมประสบการณ์** (1-2 ปี)
   - ทำงานกับระบบ ML ใน production
   - รับมือกับ incident และเข้าเวร on-call
   - ร่วมพัฒนาโปรเจกต์ ML infrastructure แบบ open-source

2. **ก้าวสู่ Senior Engineer** (รวม 2-3 ปี)
   - เรียนต่อใน[แทร็ก Senior Engineer](https://github.com/ai-infra-curriculum/ai-infra-senior-engineer-learning)
   - นำโปรเจกต์ที่ใหญ่ขึ้นและเป็นพี่เลี้ยงให้รุ่นน้อง
   - ออกแบบระบบที่ซับซ้อน

3. **เป็น Architect** (รวม 4-6 ปี)
   - เรียนต่อใน[แทร็ก Architect](https://github.com/ai-infra-curriculum/ai-infra-architect-learning)
   - ออกแบบ ML platform ระดับองค์กร
   - เป็นผู้นำด้านเทคนิคเชิงกลยุทธ์

---

<div align="center">

## พร้อมที่จะเชี่ยวชาญ AI Infrastructure Engineering แล้วหรือยัง?

**เริ่มต้นเส้นทางของคุณวันนี้!**

[📘 เริ่มต้นใช้งาน](./GETTING_STARTED.md) | [📚 ดูหลักสูตรทั้งหมด](./CURRICULUM.md) | [🚀 เริ่ม Module 01](./lessons/mod-101-foundations/README.md)

---

⭐ **กด Star ให้ repository นี้** หากคุณเห็นว่ามีประโยชน์!

**แบ่งปันให้ผู้อื่น** ที่กำลังเรียนรู้ AI Infrastructure Engineering!

---

*ติดต่อ: ai-infra-curriculum@joshua-ferguson.com*

**ขอให้สนุกกับการเรียนรู้!** 🎓🚀

</div>

---

<!-- aicg:maintained-by -->
ดูแลโดย [VeriSwarm.ai](https://veriswarm.ai)
