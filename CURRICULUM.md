# หลักสูตร AI Infrastructure Engineer

> **หลักสูตรเชิงปฏิบัติที่ครอบคลุมสำหรับผู้ที่ต้องการเป็น AI Infrastructure Engineer**

## สารบัญ

- [ภาพรวมหลักสูตร](#ภาพรวมหลักสูตร)
- [ปรัชญาการเรียนรู้](#ปรัชญาการเรียนรู้)
- [โครงสร้างหลักสูตร](#โครงสร้างหลักสูตร)
- [ความรู้พื้นฐานที่ต้องมี](#ความรู้พื้นฐานที่ต้องมี)
- [ผลลัพธ์การเรียนรู้](#ผลลัพธ์การเรียนรู้)
- [โมดูล](#โมดูล)
  - [โมดูล 01: พื้นฐาน](#โมดูล-01-พื้นฐาน)
  - [โมดูล 02: พื้นฐาน Cloud Computing](#โมดูล-02-พื้นฐาน-cloud-computing)
  - [โมดูล 03: Containerization และ Docker](#โมดูล-03-containerization-และ-docker)
  - [โมดูล 04: พื้นฐาน Kubernetes](#โมดูล-04-พื้นฐาน-kubernetes)
  - [โมดูล 05: วิศวกรรม Data Pipeline](#โมดูล-05-วิศวกรรม-data-pipeline)
  - [โมดูล 06: พื้นฐาน MLOps](#โมดูล-06-พื้นฐาน-mlops)
  - [โมดูล 07: GPU Computing และการเร่งความเร็ว ML](#โมดูล-07-gpu-computing-และการเร่งความเร็ว-ml)
  - [โมดูล 08: Monitoring และ Observability](#โมดูล-08-monitoring-และ-observability)
  - [โมดูล 09: Infrastructure as Code](#โมดูล-09-infrastructure-as-code)
  - [โมดูล 10: LLM Infrastructure](#โมดูล-10-llm-infrastructure)
- [โปรเจกต์](#โปรเจกต์)
  - [โปรเจกต์ 01: ระบบ Model Serving พื้นฐาน](#โปรเจกต์-01-ระบบ-model-serving-พื้นฐาน)
  - [โปรเจกต์ 02: MLOps Pipeline](#โปรเจกต์-02-mlops-pipeline)
  - [โปรเจกต์ 103: การ Deploy LLM ระดับ Production](#โปรเจกต์-103-การ-deploy-llm-ระดับ-production)
- [กลยุทธ์การประเมินผล](#กลยุทธ์การประเมินผล)
- [เวลาที่ต้องใช้](#เวลาที่ต้องใช้)
- [แผนการเรียน](#แผนการเรียน)
- [เส้นทางอาชีพ](#เส้นทางอาชีพ)
- [แหล่งเรียนรู้](#แหล่งเรียนรู้)
- [การขอความช่วยเหลือ](#การขอความช่วยเหลือ)

---

## ภาพรวมหลักสูตร

หลักสูตรนี้ออกแบบมาเพื่อพาคุณจากความรู้พื้นฐานไปสู่ทักษะวิศวกรรม AI infrastructure ที่พร้อมใช้งานจริงในระดับ production ผ่าน 10 โมดูลที่ครอบคลุมและ 3 โปรเจกต์เชิงปฏิบัติ คุณจะได้รับความเชี่ยวชาญที่จำเป็นในการสร้าง deploy และดูแลระบบ AI/ML ในระดับ scale

### สถิติของ Repository

- **จำนวนไฟล์ทั้งหมด**: 207
- **จำนวนบรรทัดโค้ดทั้งหมด**: ~95,000+
- **ชั่วโมงการเรียนรู้**: 500+ ชั่วโมง
- **โมดูล**: 10 โมดูลที่สมบูรณ์
- **โปรเจกต์**: 3 โปรเจกต์แบบต่อเนื่อง
- **สถานะ**: 🚧 อยู่ระหว่างการพัฒนา — ดู [บันทึกความคืบหน้า](#บันทึกความคืบหน้า) ด้านล่างสำหรับสถานะความสมบูรณ์ของแบบฝึกหัด/lab ในแต่ละโมดูล

### จุดเด่นของหลักสูตรนี้

1. **การเรียนรู้แบบต่อเนื่อง**: แต่ละโมดูลต่อยอดจากความรู้ก่อนหน้า
2. **โปรเจกต์เชิงปฏิบัติ**: สถานการณ์จริงพร้อมโค้ดระดับ production
3. **ตรงกับความต้องการของอุตสาหกรรม**: อ้างอิงจากคุณสมบัติงานจริงของบริษัทเทคโนโลยีชั้นนำ
4. **ครบวงจร**: ตั้งแต่พื้นฐานไปจนถึงการ deploy LLM
5. **พร้อมใช้งานจริง**: เน้น best practices, การทดสอบ และ monitoring
6. **มุ่งเน้นอาชีพ**: สอดคล้องกับตำแหน่ง AI Infrastructure Engineer

---

## ปรัชญาการเรียนรู้

### แนวทางของเรา

**เรียนรู้จากการลงมือทำ**: ทุกแนวคิดได้รับการเสริมด้วยแบบฝึกหัดเชิงปฏิบัติและโค้ดจริง

**แนวคิดแบบ Production**: เราไม่ได้สอนแค่วิธีสร้าง แต่สอนวิธีสร้างให้ถูกต้อง ทุกโปรเจกต์ครอบคลุมเรื่อง monitoring, การทดสอบ, security และ scalability

**ความซับซ้อนที่เพิ่มขึ้นทีละขั้น**: เริ่มจากพื้นฐานแล้วค่อย ๆ เพิ่มความซับซ้อน เมื่อจบหลักสูตร คุณจะสามารถ deploy ระบบ LLM ระดับ production ได้

**สถานการณ์จริง**: ทุกโปรเจกต์อ้างอิงจาก use case และความต้องการจริงในอุตสาหกรรม

### วิธีการสอน

1. **พื้นฐานเชิงแนวคิด**: เข้าใจ "ทำไม" ก่อน "อย่างไร"
2. **การลงมือทำแบบมีผู้แนะนำ**: แบบฝึกหัดทีละขั้นตอนพร้อมวัตถุประสงค์ที่ชัดเจน
3. **การฝึกฝนด้วยตนเอง**: โค้ดโครง (stub) พร้อมคอมเมนต์ TODO ช่วยนำทางการทำงาน
4. **การบูรณาการผ่านโปรเจกต์**: นำแนวคิดไปใช้ในโปรเจกต์แบบ end-to-end ที่สมบูรณ์
5. **การประเมินอย่างต่อเนื่อง**: แบบทดสอบ แบบฝึกหัด และการสอบภาคปฏิบัติ

---

## โครงสร้างหลักสูตร

### การจัดโครงสร้างโมดูล

ทั้ง 10 โมดูลมีโครงสร้างที่สอดคล้องกัน:

```
modules/XX-module-name/
├── README.md              # Module overview and objectives
├── lecture-notes.md       # Comprehensive lecture content
├── exercises/             # Hands-on practice exercises
│   ├── exercise-01.md
│   ├── exercise-02.md
│   └── solutions/        # Exercise solutions
├── labs/                  # Practical lab environments
│   └── lab-XX.md
├── quizzes/              # Knowledge assessments
│   └── quiz-XX.md
└── resources.md          # Additional learning materials
```

### การจัดโครงสร้างโปรเจกต์

แต่ละโปรเจกต์ประกอบด้วย:

```
projects/project-XX-name/
├── README.md              # Project overview
├── requirements.md        # Detailed requirements
├── architecture.md        # System architecture
├── setup.md              # Setup instructions
├── src/                  # Code stubs with TODOs
├── tests/                # Test stubs
├── docs/                 # Documentation templates
├── configs/              # Configuration files
└── scripts/              # Helper scripts
```

---

## ความรู้พื้นฐานที่ต้องมี

### ความรู้ที่จำเป็น

ก่อนเริ่มหลักสูตรนี้ คุณควรมี:

#### ทักษะการเขียนโปรแกรม
- **Python**: ระดับกลาง (ประสบการณ์ 3 ปีขึ้นไป)
  - การเขียนโปรแกรมเชิงวัตถุ (OOP)
  - File I/O และโครงสร้างข้อมูล
  - การจัดการ error และ logging
  - Virtual environment และการจัดการ package
  - พื้นฐาน async programming

#### การดูแลระบบ
- **Linux**: ใช้งาน command line ขั้นพื้นฐานได้
  - การนำทางในระบบไฟล์
  - การจัดการ process
  - Text editor (vim/nano)
  - Permission และ ownership
  - คำสั่งเครือข่ายพื้นฐาน

#### Version Control
- **Git**: การใช้งานพื้นฐาน
  - Clone, commit, push, pull
  - Branching และ merging
  - การแก้ไข conflict

#### เครือข่าย
- **พื้นฐาน**: มีความเข้าใจเรื่อง
  - พื้นฐาน TCP/IP
  - โปรโตคอล HTTP/HTTPS
  - DNS resolution
  - Port และ firewall

### ความรู้ที่แนะนำ

สิ่งต่อไปนี้จะเป็นประโยชน์แต่ไม่บังคับ:

- ความเข้าใจพื้นฐานเกี่ยวกับแนวคิด machine learning
- เคยใช้งาน cloud platform (AWS, GCP หรือ Azure)
- ประสบการณ์กับฐานข้อมูล (SQL หรือ NoSQL)
- ความเข้าใจพื้นฐานเกี่ยวกับ API และ REST
- คุ้นเคยกับรูปแบบ YAML และ JSON

### ความต้องการด้านเทคนิค

#### ฮาร์ดแวร์
- **CPU**: แนะนำ 4 core ขึ้นไป
- **RAM**: ขั้นต่ำ 16GB แนะนำ 32GB
- **Storage**: พื้นที่ว่าง 100GB สำหรับ Docker image และ dataset
- **GPU**: ไม่บังคับแต่มีประโยชน์สำหรับโมดูล 07 (มีทางเลือกบน cloud ให้)

#### ซอฟต์แวร์
- **ระบบปฏิบัติการ**: Linux (แนะนำ Ubuntu 22.04) หรือ macOS
  - ผู้ใช้ Windows: ต้องใช้ WSL2
- **Python**: 3.11 ขึ้นไป
- **Git**: เวอร์ชันล่าสุด
- **Text Editor/IDE**: VS Code, PyCharm หรือเทียบเท่า
- **อินเทอร์เน็ต**: การเชื่อมต่อ broadband ที่เสถียรสำหรับใช้ทรัพยากร cloud

#### บัญชี Cloud (Free Tier เพียงพอ)
- บัญชี AWS (free tier)
- บัญชี Google Cloud (เครดิตฟรี $300)
- บัญชี Docker Hub (ฟรี)
- บัญชี GitHub (ฟรี)

---

## ผลลัพธ์การเรียนรู้

เมื่อจบหลักสูตรนี้ คุณจะสามารถ:

### ความสามารถหลัก

#### Infrastructure และระบบ
- ✅ ออกแบบและ deploy แอปพลิเคชันแบบ container ด้วย Docker
- ✅ Orchestrate workload ที่ซับซ้อนด้วย Kubernetes
- ✅ ทำ Infrastructure as Code ด้วย Terraform
- ✅ สร้างสถาปัตยกรรม cloud ที่ทนทานและ scale ได้
- ✅ จัดการทรัพยากร GPU สำหรับ ML workload

#### Machine Learning Operations
- ✅ Deploy ML model สู่สภาพแวดล้อม production
- ✅ สร้าง CI/CD pipeline สำหรับระบบ ML
- ✅ สร้างและดูแล data processing pipeline
- ✅ Monitor ประสิทธิภาพของโมเดลและสุขภาพของระบบ
- ✅ ทำ model versioning และ experiment tracking

#### Large Language Models
- ✅ Deploy และ serve LLM ใน production
- ✅ ใช้ vector database สำหรับระบบ RAG
- ✅ Optimize LLM inference ด้านต้นทุนและประสิทธิภาพ
- ✅ สร้างระบบ AI แบบหลายโมเดล
- ✅ ทำ LLM observability และ monitoring

#### Production Engineering
- ✅ ทำ monitoring และ alerting อย่างครอบคลุม
- ✅ ออกแบบเพื่อ high availability และ fault tolerance
- ✅ Optimize ต้นทุนในสภาพแวดล้อม cloud
- ✅ ใช้ security best practices
- ✅ เขียนโค้ดระดับ production พร้อม test

### ความพร้อมด้านอาชีพ

หลังจบหลักสูตรนี้ คุณจะมีคุณสมบัติสำหรับ:

- ตำแหน่ง **AI Infrastructure Engineer**
- ตำแหน่ง **ML Platform Engineer**
- ตำแหน่ง **MLOps Engineer**
- ตำแหน่ง **DevOps Engineer** ที่เน้น ML

**ช่วงเงินเดือนที่คาดหวัง**: $120,000 - $180,000 (สหรัฐฯ ระดับเริ่มต้นถึงระดับกลาง)

---

## โมดูล

### โมดูล 01: พื้นฐาน
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 40 ชั่วโมง | **ไฟล์**: 15

#### ภาพรวม
วางรากฐานความรู้ที่จำเป็นสำหรับวิศวกรรม AI infrastructure โมดูลนี้ครอบคลุม Python best practices, การดูแลระบบ Linux, พื้นฐานเครือข่าย และการตั้งค่าสภาพแวดล้อมการพัฒนา

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- เชี่ยวชาญ best practices การพัฒนา Python สำหรับโค้ด infrastructure
- นำทางและดูแลระบบ Linux ได้อย่างมั่นใจ
- เข้าใจพื้นฐานเครือข่ายสำหรับ distributed system
- ตั้งค่าสภาพแวดล้อมการพัฒนาแบบมืออาชีพ
- ใช้ version control อย่างมีประสิทธิภาพในการทำงานเป็นทีม

#### หัวข้อที่ครอบคลุม
- **Python สำหรับ Infrastructure**
  - Virtual environment และการจัดการ dependency
  - รูปแบบการทำ logging และการจัดการ error
  - การจัดการ configuration
  - การทดสอบโค้ด infrastructure
  - Async programming สำหรับงาน I/O

- **การดูแลระบบ Linux**
  - ลำดับชั้นและการจัดการระบบไฟล์
  - การจัดการ process และ service (systemd)
  - การจัดการผู้ใช้และ permission
  - การ monitor ระบบและ log
  - Shell scripting สำหรับงานอัตโนมัติ

- **พื้นฐานเครือข่าย**
  - TCP/IP stack และโปรโตคอล
  - DNS และ service discovery
  - แนวคิด load balancing
  - พื้นฐาน network security
  - การ debug ปัญหาเครือข่าย

- **สภาพแวดล้อมการพัฒนา**
  - การตั้งค่า IDE และเครื่องมือเพิ่มประสิทธิภาพ
  - Git workflow และ best practices
  - SSH key และการเข้าถึงอย่างปลอดภัย
  - สภาพแวดล้อม development กับ production

#### เทคโนโลยีหลัก
- Python 3.11+
- Linux (Ubuntu 22.04)
- Git และ GitHub
- VSCode/PyCharm
- Bash scripting

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (3,500+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 10 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 5 ชุด
- การประเมิน 2 รายการ (แบบทดสอบ + สอบภาคปฏิบัติ)
- รายการแหล่งเรียนรู้เพิ่มเติมจำนวนมาก

#### การประเมินผล
- **แบบทดสอบ**: 30 ข้อ ครอบคลุมทุกหัวข้อ
- **สอบภาคปฏิบัติ**: สร้างเครื่องมือ Python CLI สำหรับ monitor ระบบ
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 12 ชั่วโมง
- แบบฝึกหัด: 15 ชั่วโมง
- Lab: 8 ชั่วโมง
- การประเมิน: 5 ชั่วโมง

---

### โมดูล 02: พื้นฐาน Cloud Computing
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 45 ชั่วโมง | **ไฟล์**: 11

#### ภาพรวม
เชี่ยวชาญพื้นฐาน cloud computing ผ่านประสบการณ์ลงมือทำจริงบน AWS, Google Cloud และ Azure เรียนรู้การออกแบบ cloud solution การจัดการทรัพยากร และการ optimize ต้นทุน

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- เข้าใจ cloud service model (IaaS, PaaS, SaaS)
- Deploy และจัดการทรัพยากรบน cloud provider หลัก ๆ
- ออกแบบสถาปัตยกรรม cloud ที่ scale ได้และเชื่อถือได้
- ใช้ cloud security best practices
- Optimize ต้นทุน cloud และการใช้ทรัพยากร

#### หัวข้อที่ครอบคลุม
- **Cloud Service Model**
  - Infrastructure as a Service (IaaS)
  - Platform as a Service (PaaS)
  - Serverless และ Function as a Service
  - Managed service สำหรับ ML/AI

- **พื้นฐาน AWS**
  - EC2 instance และ auto-scaling
  - S3 storage และการจัดการข้อมูล
  - VPC networking และ security group
  - IAM role และ policy
  - SageMaker สำหรับ ML workload

- **Google Cloud Platform**
  - Compute Engine และการจัดการ instance
  - Cloud Storage และ data lake
  - Cloud AI Platform
  - เครือข่ายและ security
  - เครื่องมือจัดการต้นทุน

- **พื้นฐาน Azure**
  - Virtual Machine และ scale set
  - Blob storage และ data service
  - แพลตฟอร์ม Azure ML
  - Resource group และการจัดการ

- **กลยุทธ์ Multi-Cloud**
  - เมื่อใดควรใช้ provider แต่ละราย
  - สถาปัตยกรรมแบบ multi-cloud
  - ข้อพิจารณาด้าน cloud portability
  - การเปรียบเทียบและ optimize ต้นทุน

#### เทคโนโลยีหลัก
- AWS (EC2, S3, VPC, IAM, SageMaker)
- Google Cloud (Compute Engine, Cloud Storage, AI Platform)
- Azure (VMs, Blob Storage, Azure ML)
- เครื่องมือ Cloud CLI (aws-cli, gcloud, az)
- Terraform (เบื้องต้น)

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (4,200+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 8 ชุดพร้อมเฉลย
- Cloud lab 4 ชุด (AWS, GCP, Azure, Multi-cloud)
- การประเมิน 2 รายการ
- คู่มือการ optimize ต้นทุน

#### การประเมินผล
- **แบบทดสอบ**: 35 ข้อเกี่ยวกับแนวคิด cloud
- **สอบภาคปฏิบัติ**: Deploy แอปพลิเคชันแบบ multi-tier บน AWS
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 15 ชั่วโมง
- แบบฝึกหัด: 18 ชั่วโมง
- Lab: 8 ชั่วโมง
- การประเมิน: 4 ชั่วโมง

---

### โมดูล 03: Containerization และ Docker
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 50 ชั่วโมง | **ไฟล์**: 14

#### ภาพรวม
เจาะลึกเทคโนโลยี containerization ด้วย Docker เรียนรู้การสร้าง optimize และจัดการ container สำหรับ AI/ML workload

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- สร้าง Docker image ที่มีประสิทธิภาพสำหรับแอปพลิเคชัน ML
- Optimize container image ด้านขนาดและประสิทธิภาพ
- ใช้ multi-stage build สำหรับ production
- จัดการเครือข่ายและ storage ของ container
- ใช้ Docker Compose สำหรับแอปพลิเคชันหลาย container
- ใช้ container security best practices

#### หัวข้อที่ครอบคลุม
- **พื้นฐาน Docker**
  - สถาปัตยกรรม container และการแยกส่วน (isolation)
  - Image, layer และ caching
  - Dockerfile best practices
  - การ build และ tag image
  - การจัดการ lifecycle ของ container

- **Docker ขั้นสูง**
  - Multi-stage build สำหรับแอปพลิเคชัน ML
  - BuildKit และการ optimize build
  - การจัดการ volume และ persistence
  - การตั้งค่าเครือข่ายและ service discovery
  - Resource limit และข้อจำกัด

- **Docker สำหรับ ML/AI**
  - Container ที่รองรับ GPU
  - Base image ของ ML framework
  - การ package และ versioning โมเดล
  - การจัดการ data volume
  - การจัดการ dependency

- **Docker Compose**
  - Service orchestration
  - การตั้งค่า environment
  - สภาพแวดล้อมการพัฒนา
  - Integration testing ด้วย container

- **Container Security**
  - Image scanning และการตรวจหาช่องโหว่
  - Container แบบ non-root
  - การจัดการ secret
  - Network isolation
  - Security best practices

#### เทคโนโลยีหลัก
- Docker Engine 24+
- Docker Compose
- Docker BuildKit
- Container registry (Docker Hub, ECR, GCR)
- เครื่องมือ security scanning (Trivy, Snyk)

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (4,800+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 12 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 6 ชุด
- การประเมิน 2 รายการ
- Template ของ Dockerfile ระดับ production

#### การประเมินผล
- **แบบทดสอบ**: 40 ข้อเกี่ยวกับ containerization
- **สอบภาคปฏิบัติ**: ทำ containerize แอปพลิเคชัน ML ที่สมบูรณ์
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 16 ชั่วโมง
- แบบฝึกหัด: 20 ชั่วโมง
- Lab: 10 ชั่วโมง
- การประเมิน: 4 ชั่วโมง

---

### โมดูล 04: พื้นฐาน Kubernetes
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 60 ชั่วโมง | **ไฟล์**: 13

#### ภาพรวม
เชี่ยวชาญ Kubernetes สำหรับการ orchestrate ML workload แบบ container เรียนรู้การ deploy, scale และจัดการ Kubernetes cluster ระดับ production

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- เข้าใจสถาปัตยกรรมและองค์ประกอบของ Kubernetes
- Deploy และจัดการแอปพลิเคชันบน Kubernetes
- ทำ auto-scaling และ self-healing
- ตั้งค่าเครือข่ายและ service discovery
- จัดการ storage และแอปพลิเคชันแบบ stateful
- ทำ security ด้วย RBAC และ network policy

#### หัวข้อที่ครอบคลุม
- **สถาปัตยกรรม Kubernetes**
  - องค์ประกอบของ control plane
  - สถาปัตยกรรมของ node
  - การออกแบบและ lifecycle ของ Pod
  - Controller และ operator
  - เครือข่ายของ cluster

- **Core Workload**
  - Deployment และ ReplicaSet
  - StatefulSet สำหรับแอปแบบ stateful
  - DaemonSet และ Job
  - CronJob สำหรับ batch processing
  - Init container และ sidecar

- **เครือข่าย**
  - Service (ClusterIP, NodePort, LoadBalancer)
  - Ingress controller และ routing
  - Network policy และ security
  - DNS และ service discovery
  - CNI plugin

- **Storage**
  - Volume และ persistent volume
  - Storage class และ dynamic provisioning
  - Storage ของ StatefulSet
  - รูปแบบการเก็บข้อมูลถาวร (data persistence)

- **Configuration และ Secret**
  - ConfigMap สำหรับ configuration
  - การจัดการ secret
  - Environment variable
  - การจัดการ secret ภายนอก

- **Scaling และทรัพยากร**
  - Horizontal Pod Autoscaling
  - Vertical Pod Autoscaling
  - Cluster Autoscaling
  - Resource request และ limit
  - Quality of Service (QoS)

- **Security**
  - RBAC และ service account
  - Pod security standard
  - Network policy
  - Image security
  - การเข้ารหัส secret

#### เทคโนโลยีหลัก
- Kubernetes 1.28+
- kubectl CLI
- Helm 3
- Minikube/Kind (สำหรับพัฒนาบนเครื่อง)
- EKS/GKE/AKS (Kubernetes บน cloud)

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (5,500+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 15 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 8 ชุด
- การประเมิน 2 รายการ
- Manifest ระดับ production

#### การประเมินผล
- **แบบทดสอบ**: 50 ข้อเกี่ยวกับ Kubernetes
- **สอบภาคปฏิบัติ**: Deploy แอปพลิเคชัน ML ที่ scale ได้บน Kubernetes
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 20 ชั่วโมง
- แบบฝึกหัด: 25 ชั่วโมง
- Lab: 12 ชั่วโมง
- การประเมิน: 3 ชั่วโมง

---

### โมดูล 05: วิศวกรรม Data Pipeline
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 50 ชั่วโมง | **ไฟล์**: 12

#### ภาพรวม
สร้าง data pipeline ที่แข็งแกร่งสำหรับ ML workload เรียนรู้การ ingest ประมวลผล และจัดเก็บข้อมูลในระดับ scale ด้วยเครื่องมือ data engineering สมัยใหม่

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- ออกแบบและสร้าง data pipeline สำหรับ ML
- ทำงานกับข้อมูลแบบ batch และ streaming
- ใช้ Apache Spark สำหรับการประมวลผลแบบกระจาย
- ทำ data quality และ validation
- สร้าง ETL/ELT workflow
- จัดการ data versioning และ lineage

#### หัวข้อที่ครอบคลุม
- **พื้นฐาน Data Pipeline**
  - รูปแบบสถาปัตยกรรมของ pipeline
  - การประมวลผลแบบ batch กับ streaming
  - Data quality และ validation
  - การจัดการ error และ retry logic
  - Monitoring และ alerting

- **Apache Airflow**
  - การออกแบบ DAG และ best practices
  - Operator และ sensor
  - Task dependency และ scheduling
  - การสร้าง DAG แบบ dynamic
  - Monitoring และ troubleshooting

- **Apache Spark**
  - RDD, DataFrame และ Dataset API
  - Transformation และ action
  - Spark SQL สำหรับประมวลผลข้อมูล
  - PySpark สำหรับเชื่อมต่อกับ Python
  - การ optimize ประสิทธิภาพ

- **Data Storage**
  - Data lake และ data warehouse
  - รูปแบบ Parquet, Avro และ ORC
  - กลยุทธ์การทำ partitioning
  - Data versioning (DVC)
  - Feature store

- **Stream Processing**
  - พื้นฐาน Apache Kafka
  - การ ingest ข้อมูลแบบ real-time
  - รูปแบบ stream processing
  - Window operation
  - Exactly-once semantics

- **Data Quality**
  - Schema validation
  - Data profiling
  - Anomaly detection
  - การติดตาม data lineage
  - Framework Great Expectations

#### เทคโนโลยีหลัก
- Apache Airflow 2.7+
- Apache Spark 3.4+
- Apache Kafka
- PostgreSQL
- DVC (Data Version Control)
- Great Expectations

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (4,600+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 12 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 6 ชุด
- การประเมิน 2 รายการ
- Template ของ pipeline และ DAG

#### การประเมินผล
- **แบบทดสอบ**: 40 ข้อเกี่ยวกับ data pipeline
- **สอบภาคปฏิบัติ**: สร้าง ML data pipeline แบบ end-to-end
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 18 ชั่วโมง
- แบบฝึกหัด: 20 ชั่วโมง
- Lab: 10 ชั่วโมง
- การประเมิน: 2 ชั่วโมง

---

### โมดูล 06: พื้นฐาน MLOps
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 55 ชั่วโมง | **ไฟล์**: 12

#### ภาพรวม
เรียนรู้แนวปฏิบัติ MLOps เพื่อเชื่อมช่องว่างระหว่างการพัฒนา ML และการ deploy สู่ production ทำ continuous integration, deployment และ monitoring สำหรับระบบ ML

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- สร้าง CI/CD pipeline สำหรับ ML model
- จัดการ model versioning และ experiment tracking
- Deploy โมเดลสู่สภาพแวดล้อม production
- Monitor ประสิทธิภาพโมเดลและ data drift
- ทำ A/B testing สำหรับโมเดล
- สร้าง retraining pipeline

#### หัวข้อที่ครอบคลุม
- **หลักการ MLOps**
  - การจัดการ ML lifecycle
  - Development กับ production
  - Technical debt ในระบบ ML
  - รูปแบบการทำงานร่วมกันในทีม
  - MLOps maturity model

- **Experiment Tracking**
  - Experiment และ run ใน MLflow
  - การ log parameter และ metric
  - การจัดการ artifact
  - Model registry
  - การเปรียบเทียบ experiment

- **Model Serving**
  - สถาปัตยกรรม model serving
  - REST API ด้วย FastAPI
  - Inference แบบ batch กับ real-time
  - Model versioning ใน production
  - Canary deployment

- **CI/CD สำหรับ ML**
  - Automated testing สำหรับ ML
  - Model validation pipeline
  - Continuous training
  - GitHub Actions สำหรับ ML
  - Deployment automation

- **Model Monitoring**
  - การติดตาม performance metric
  - การตรวจจับ data drift
  - การแจ้งเตือนเมื่อโมเดลเสื่อมประสิทธิภาพ
  - Feature monitoring
  - Logging และ debugging

- **Feature Engineering**
  - Feature store (Feast)
  - Feature transformation pipeline
  - Feature versioning
  - Feature แบบ online กับ offline
  - Feature monitoring

#### เทคโนโลยีหลัก
- MLflow
- FastAPI
- Feast (feature store)
- GitHub Actions
- Prometheus
- Grafana

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (5,000+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 14 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 7 ชุด
- การประเมิน 2 รายการ
- Template และ workflow ของ MLOps

#### การประเมินผล
- **แบบทดสอบ**: 45 ข้อเกี่ยวกับ MLOps
- **สอบภาคปฏิบัติ**: สร้าง MLOps pipeline ที่สมบูรณ์
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 18 ชั่วโมง
- แบบฝึกหัด: 22 ชั่วโมง
- Lab: 12 ชั่วโมง
- การประเมิน: 3 ชั่วโมง

---

### โมดูล 07: GPU Computing และการเร่งความเร็ว ML
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 50 ชั่วโมง | **ไฟล์**: 12

#### ภาพรวม
เชี่ยวชาญ GPU computing สำหรับ ML workload เรียนรู้การ optimize training และ inference การจัดการทรัพยากร GPU และกลยุทธ์การเร่งความเร็วที่คุ้มค่า

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- เข้าใจสถาปัตยกรรม GPU สำหรับ ML workload
- ตั้งค่า CUDA และ ML framework ให้ใช้ GPU
- Optimize ประสิทธิภาพ training และ inference
- จัดการระบบ multi-GPU
- Optimize ต้นทุนสำหรับ GPU workload
- ใช้บริการ GPU บน cloud อย่างมีประสิทธิภาพ

#### หัวข้อที่ครอบคลุม
- **พื้นฐาน GPU**
  - สถาปัตยกรรม GPU (CUDA core, Tensor core)
  - การประมวลผลด้วย CPU กับ GPU
  - ลำดับชั้นหน่วยความจำและ bandwidth
  - พื้นฐานการเขียนโปรแกรม CUDA
  - การเลือก GPU สำหรับ ML workload

- **การรองรับ GPU ของ ML Framework**
  - การทำงานบน GPU ของ PyTorch
  - การตั้งค่า GPU ของ TensorFlow
  - Mixed precision training
  - Gradient accumulation
  - Multi-GPU training

- **การ Optimize Training**
  - กลยุทธ์ distributed training
  - Data parallelism
  - Model parallelism
  - Pipeline parallelism
  - Gradient checkpointing

- **การ Optimize Inference**
  - Model quantization
  - การ optimize ด้วย TensorRT
  - การ export โมเดลเป็น ONNX
  - กลยุทธ์การทำ batching
  - Dynamic batching ด้วย Triton

- **การจัดการทรัพยากร GPU**
  - การรองรับ GPU ใน Docker
  - GPU scheduling ใน Kubernetes
  - GPU sharing และ time-slicing
  - Resource quota และ limit
  - การ monitor การใช้งาน GPU

- **บริการ GPU บน Cloud**
  - AWS EC2 GPU instance
  - บริการ GPU ของ GCP
  - Azure GPU VM
  - กลยุทธ์การ optimize ต้นทุน
  - Spot instance สำหรับ training

#### เทคโนโลยีหลัก
- NVIDIA CUDA 12+
- PyTorch 2.0+
- TensorFlow 2.14+
- NVIDIA Triton Inference Server
- TensorRT
- Docker GPU runtime

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (4,400+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 11 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 6 ชุด
- การประเมิน 2 รายการ
- คู่มือการ optimize GPU

#### การประเมินผล
- **แบบทดสอบ**: 40 ข้อเกี่ยวกับ GPU computing
- **สอบภาคปฏิบัติ**: Optimize โมเดลสำหรับ GPU inference
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 16 ชั่วโมง
- แบบฝึกหัด: 20 ชั่วโมง
- Lab: 12 ชั่วโมง
- การประเมิน: 2 ชั่วโมง

---

### โมดูล 08: Monitoring และ Observability
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 45 ชั่วโมง | **ไฟล์**: 11

#### ภาพรวม
ทำ monitoring และ observability อย่างครอบคลุมสำหรับ ML infrastructure เรียนรู้การเก็บ metric สร้าง dashboard ตั้งค่า alert และ troubleshoot ปัญหาใน production

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- ออกแบบกลยุทธ์ monitoring สำหรับระบบ ML
- เก็บและจัดเก็บ metric ด้วย Prometheus
- สร้าง dashboard ที่ให้ข้อมูลชัดเจนด้วย Grafana
- ทำ alerting และกระบวนการ on-call
- ใช้ distributed tracing ในการ debug
- วิเคราะห์ log เพื่อ troubleshoot

#### หัวข้อที่ครอบคลุม
- **พื้นฐาน Observability**
  - Metric, log และ trace
  - สามเสาหลักของ observability
  - SLI, SLO และ SLA
  - Monitoring กับ observability
  - Alert fatigue และ best practices

- **Prometheus**
  - การเก็บและจัดเก็บ metric
  - ภาษา query PromQL
  - Service discovery
  - Exporter และ instrumentation
  - Recording rule และ aggregation

- **Grafana**
  - หลักการออกแบบ dashboard
  - ประเภทของ visualization
  - Template variable
  - Alerting rule
  - การทำงานร่วมกันในทีม

- **Application Instrumentation**
  - Custom metric ด้วย Python
  - Metric เฉพาะสำหรับ ML
  - Request tracing
  - Performance profiling
  - การใช้ทรัพยากร

- **Distributed Tracing**
  - สถาปัตยกรรม Jaeger
  - Instrumentation ด้วย OpenTelemetry
  - กลยุทธ์ trace sampling
  - การวิเคราะห์ประสิทธิภาพ
  - การ debug distributed system

- **การจัดการ Log**
  - Centralized logging (ELK stack)
  - รูปแบบ log aggregation
  - Structured logging
  - การวิเคราะห์และค้นหา log
  - นโยบาย log retention

- **Alerting**
  - การออกแบบและปรับจูน alert
  - ช่องทางการแจ้งเตือน
  - Escalation policy
  - On-call best practices
  - Incident response

#### เทคโนโลยีหลัก
- Prometheus
- Grafana
- Jaeger
- OpenTelemetry
- ELK Stack (Elasticsearch, Logstash, Kibana)
- Alertmanager

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (4,200+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 10 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 5 ชุด
- การประเมิน 2 รายการ
- Template ของ dashboard และ alert rule

#### การประเมินผล
- **แบบทดสอบ**: 35 ข้อเกี่ยวกับ monitoring
- **สอบภาคปฏิบัติ**: สร้าง monitoring stack ที่สมบูรณ์สำหรับ ML service
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 15 ชั่วโมง
- แบบฝึกหัด: 18 ชั่วโมง
- Lab: 10 ชั่วโมง
- การประเมิน: 2 ชั่วโมง

---

### โมดูล 09: Infrastructure as Code
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 50 ชั่วโมง | **ไฟล์**: 12

#### ภาพรวม
เชี่ยวชาญ Infrastructure as Code ด้วย Terraform และ Pulumi เรียนรู้การ provision จัดการ และทำ versioning ของ infrastructure บน cloud provider ต่าง ๆ

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- เขียน infrastructure as code ด้วย Terraform
- จัดการ state และ workspace อย่างมีประสิทธิภาพ
- ออกแบบ infrastructure module ที่นำกลับมาใช้ซ้ำได้
- ทำ CI/CD สำหรับ infrastructure
- ใช้ Pulumi สำหรับ infrastructure แบบเขียนโปรแกรม
- ใช้ best practices และรูปแบบของ IaC

#### หัวข้อที่ครอบคลุม
- **พื้นฐาน IaC**
  - หลักการ Infrastructure as Code
  - แนวทางแบบ declarative กับ imperative
  - การจัดการ state
  - Idempotency และ convergence
  - Version control สำหรับ infrastructure

- **พื้นฐาน Terraform**
  - Syntax และโครงสร้าง HCL
  - Provider และ resource
  - Variable และ output
  - Data source
  - การจัดการ state

- **Terraform ขั้นสูง**
  - Module และ composition
  - Workspace และ environment
  - Remote state backend
  - Terraform Cloud/Enterprise
  - การทดสอบโค้ด infrastructure

- **Multi-Cloud ด้วย Terraform**
  - Resource ของ AWS (EC2, S3, VPC)
  - Resource ของ GCP (Compute, Storage)
  - Resource ของ Azure
  - รูปแบบ multi-cloud
  - Provider versioning

- **Pulumi**
  - Infrastructure ด้วย Python
  - การจัดการ stack
  - Secret และ configuration
  - Component resource
  - การทดสอบด้วย Pulumi

- **IaC สำหรับ ML Infrastructure**
  - การ provision Kubernetes cluster
  - การจัดการ GPU instance
  - การ deploy ML platform
  - การ optimize ต้นทุน
  - Disaster recovery

- **CI/CD สำหรับ Infrastructure**
  - Automated testing
  - Workflow แบบ plan และ apply
  - GitHub Actions สำหรับ Terraform
  - Policy as Code (Sentinel, OPA)
  - Drift detection

#### เทคโนโลยีหลัก
- Terraform 1.6+
- Pulumi 3.0+
- Provider ของ AWS/GCP/Azure
- GitHub Actions
- Terraform Cloud
- OpenTofu

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (4,700+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 13 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 7 ชุด
- การประเมิน 2 รายการ
- Terraform module และ Pulumi component

#### การประเมินผล
- **แบบทดสอบ**: 40 ข้อเกี่ยวกับ IaC
- **สอบภาคปฏิบัติ**: Deploy ML infrastructure ที่สมบูรณ์ด้วย Terraform
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 16 ชั่วโมง
- แบบฝึกหัด: 20 ชั่วโมง
- Lab: 12 ชั่วโมง
- การประเมิน: 2 ชั่วโมง

---

### โมดูล 10: LLM Infrastructure
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 55 ชั่วโมง | **ไฟล์**: 12

#### ภาพรวม
สร้าง infrastructure ระดับ production สำหรับ Large Language Model เรียนรู้การ deploy, serve และ optimize LLM ร่วมกับ vector database ระบบ RAG และกลยุทธ์ inference ที่คุ้มค่า

#### วัตถุประสงค์การเรียนรู้
เมื่อจบโมดูลนี้ คุณจะ:
- Deploy และ serve LLM ใน production
- สร้างระบบ RAG (Retrieval-Augmented Generation)
- จัดการ vector database สำหรับ embedding
- Optimize ต้นทุนและประสิทธิภาพของ LLM inference
- สร้างแอปพลิเคชัน AI แบบหลายโมเดล
- ทำ LLM observability และ monitoring

#### หัวข้อที่ครอบคลุม
- **พื้นฐาน LLM**
  - ทบทวนสถาปัตยกรรม Transformer
  - ตระกูลโมเดล (GPT, BERT, LLaMA)
  - Pre-training กับ fine-tuning
  - พื้นฐาน prompt engineering
  - ความสามารถและข้อจำกัดของ LLM

- **การ Deploy LLM**
  - ทางเลือกในการ host โมเดล
  - vLLM สำหรับ inference ที่มีประสิทธิภาพ
  - Text Generation Inference (TGI)
  - Model quantization (GPTQ, AWQ)
  - Multi-GPU serving

- **Vector Database**
  - พื้นฐาน embedding
  - สถาปัตยกรรม Weaviate
  - ประเภทของ index (HNSW, IVF)
  - Hybrid search
  - การ optimize ประสิทธิภาพ

- **ระบบ RAG**
  - รูปแบบสถาปัตยกรรม RAG
  - กลยุทธ์การทำ document chunking
  - การ optimize retrieval
  - การจัดการ context window
  - Re-ranking และ filtering

- **LangChain และ Orchestration**
  - องค์ประกอบของ LangChain
  - Chain composition
  - การจัดการ memory
  - Agent framework
  - การเชื่อมต่อ tool

- **ระบบ LLM ระดับ Production**
  - การออกแบบ API สำหรับ LLM service
  - Streaming response
  - Rate limiting และ quota
  - กลยุทธ์ caching
  - การติดตามต้นทุน

- **LLM Observability**
  - การ log prompt และ response
  - Metric ด้าน latency และ throughput
  - การติดตามต้นทุนต่อ request
  - Quality monitoring
  - User feedback loop

- **Infrastructure สำหรับ Fine-tuning**
  - LoRA และ QLoRA
  - Fine-tuning pipeline
  - Evaluation framework
  - Model versioning
  - กลยุทธ์การ deploy

#### เทคโนโลยีหลัก
- vLLM
- Weaviate
- LangChain
- Hugging Face Transformers
- FastAPI
- CUDA และ TensorRT-LLM

#### เนื้อหาที่รวมอยู่
- เอกสารประกอบการบรรยายที่ครอบคลุม (5,200+ บรรทัด)
- แบบฝึกหัดเชิงปฏิบัติ 14 ชุดพร้อมเฉลย
- Lab เชิงปฏิบัติ 8 ชุด
- การประเมิน 2 รายการ
- Template สำหรับ deploy LLM ระดับ production

#### การประเมินผล
- **แบบทดสอบ**: 45 ข้อเกี่ยวกับ LLM infrastructure
- **สอบภาคปฏิบัติ**: Deploy ระบบ RAG ระดับ production
- **คะแนนผ่าน**: 80%

#### เวลาที่ต้องใช้
- การบรรยาย: 18 ชั่วโมง
- แบบฝึกหัด: 22 ชั่วโมง
- Lab: 12 ชั่วโมง
- การประเมิน: 3 ชั่วโมง

---

## โปรเจกต์

### โปรเจกต์ 01: ระบบ Model Serving พื้นฐาน
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 60 ชั่วโมง | **ไฟล์**: ~30

#### ภาพรวม
สร้างระบบ model serving ที่สมบูรณ์ตั้งแต่เริ่มต้น โปรเจกต์นี้บูรณาการแนวคิดจากโมดูล 1-5 เพื่อสร้าง ML service ระดับ production พร้อม monitoring, logging และแนวปฏิบัติ MLOps ขั้นพื้นฐาน

#### วัตถุประสงค์ของโปรเจกต์
- Deploy machine learning model เป็น REST API
- ทำ monitoring และ logging
- Containerize แอปพลิเคชัน
- Deploy ไปยัง Kubernetes
- ทำ CI/CD ขั้นพื้นฐาน

#### ผลลัพธ์การเรียนรู้
หลังจบโปรเจกต์นี้ คุณจะ:
- ✅ สร้าง REST API สำหรับ ML model ด้วย FastAPI
- ✅ Containerize แอปพลิเคชัน ML ด้วย Docker
- ✅ Deploy แอปพลิเคชันไปยัง Kubernetes
- ✅ ทำ monitoring ด้วย Prometheus
- ✅ สร้าง Grafana dashboard
- ✅ เขียน test อย่างครอบคลุม
- ✅ ตั้งค่า CI/CD ด้วย GitHub Actions

#### โครงสร้างโปรเจกต์
```
project-101-model-serving/
├── src/                       # Application code
│   ├── api/                  # FastAPI endpoints
│   ├── models/               # ML model handling
│   ├── monitoring/           # Metrics collection
│   └── utils/                # Helper functions
├── tests/                     # Test suite
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── kubernetes/                # K8s manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── monitoring/
├── monitoring/                # Prometheus & Grafana
│   ├── prometheus/
│   └── grafana/
├── docker/                    # Docker configurations
│   ├── Dockerfile
│   └── docker-compose.yml
├── .github/workflows/         # CI/CD pipelines
└── docs/                      # Documentation
```

#### ฟีเจอร์หลัก
- **Model API**: RESTful endpoint สำหรับ inference
- **Health Check**: Liveness และ readiness probe
- **Monitoring**: Custom Prometheus metric
- **Dashboard**: Grafana dashboard ที่สร้างไว้ล่วงหน้า
- **Auto-scaling**: การตั้งค่า HPA
- **Testing**: Code coverage 90%+
- **เอกสาร**: API docs ด้วย Swagger

#### เทคโนโลยีที่ใช้
- Python 3.11, FastAPI
- Scikit-learn (โมเดลตัวอย่าง)
- Docker และ Docker Compose
- Kubernetes
- Prometheus และ Grafana
- GitHub Actions
- pytest

#### เกณฑ์การประเมิน
- คุณภาพและการจัดระเบียบโค้ด
- Test coverage (ขั้นต่ำ 80%)
- ความครบถ้วนของเอกสาร
- การทำ monitoring
- Kubernetes best practices
- ข้อพิจารณาด้าน security

#### การแบ่งเวลา
- การตั้งค่าและวางแผน: 8 ชั่วโมง
- การพัฒนาส่วนหลัก: 25 ชั่วโมง
- การทดสอบ: 12 ชั่วโมง
- การ deploy บน Kubernetes: 10 ชั่วโมง
- การทำเอกสาร: 5 ชั่วโมง

---

### โปรเจกต์ 02: MLOps Pipeline
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 70 ชั่วโมง | **ไฟล์**: 30

#### ภาพรวม
สร้าง MLOps pipeline แบบ end-to-end พร้อม experiment tracking, model registry, automated training และ deployment โปรเจกต์นี้บูรณาการแนวคิดจากโมดูล 1-8

#### วัตถุประสงค์ของโปรเจกต์
- ทำการจัดการ ML lifecycle ที่สมบูรณ์
- สร้าง data processing pipeline ด้วย Airflow
- ติดตาม experiment ด้วย MLflow
- ทำ training และ deployment โมเดลแบบอัตโนมัติ
- Monitor ประสิทธิภาพโมเดลใน production
- ทำ continuous training

#### ผลลัพธ์การเรียนรู้
หลังจบโปรเจกต์นี้ คุณจะ:
- ✅ ออกแบบและสร้าง MLOps workflow
- ✅ สร้าง data pipeline ด้วย Apache Airflow
- ✅ ติดตาม experiment ด้วย MLflow
- ✅ ใช้รูปแบบ model registry
- ✅ Deploy โมเดลพร้อม automated rollback
- ✅ Monitor data drift และ model drift
- ✅ ทำ A/B testing สำหรับโมเดล
- ✅ สร้าง retraining pipeline

#### โครงสร้างโปรเจกต์
```
project-102-mlops-pipeline/
├── src/
│   ├── data/                 # Data processing
│   ├── training/             # Training pipeline
│   ├── serving/              # Model serving
│   ├── monitoring/           # Monitoring system
│   └── orchestration/        # Workflow orchestration
├── airflow/
│   ├── dags/                 # Airflow DAGs
│   ├── plugins/
│   └── config/
├── mlflow/                    # MLflow configuration
│   ├── models/
│   └── artifacts/
├── kubernetes/                # K8s deployments
│   ├── airflow/
│   ├── mlflow/
│   └── serving/
├── monitoring/
│   ├── drift-detection/
│   ├── performance/
│   └── dashboards/
├── tests/
│   ├── data/
│   ├── model/
│   └── pipeline/
└── docs/
```

#### ฟีเจอร์หลัก
- **Data Pipeline**: ETL อัตโนมัติด้วย Airflow
- **Experiment Tracking**: Experiment ใน MLflow
- **Model Registry**: การจัดการโมเดลแบบรวมศูนย์
- **Automated Training**: Training job ตามกำหนดเวลา
- **Model Validation**: Quality gate อัตโนมัติ
- **A/B Testing**: การแบ่ง traffic ระหว่างโมเดล
- **Drift Detection**: Monitoring data drift และ model drift
- **Retraining**: Retraining แบบ trigger และตามกำหนดเวลา

#### เทคโนโลยีที่ใช้
- Apache Airflow 2.7+
- MLflow
- PostgreSQL (metadata store)
- S3 (artifact store)
- Kubernetes
- Prometheus และ Grafana
- Great Expectations
- Feast (feature store)

#### Workflow ของ Pipeline
1. **Data Ingestion**: Batch processing รายวัน
2. **Feature Engineering**: แปลงและจัดเก็บ feature
3. **Model Training**: อัตโนมัติพร้อม experiment tracking
4. **Model Validation**: ตรวจสอบคุณภาพและประสิทธิภาพ
5. **Model Deployment**: Staged rollout พร้อม monitoring
6. **Performance Monitoring**: การประเมินอย่างต่อเนื่อง
7. **Retraining**: Trigger เมื่อตรวจพบ drift

#### เกณฑ์การประเมิน
- ความน่าเชื่อถือของ pipeline และการจัดการ error
- การทำ experiment tracking
- กลยุทธ์ model validation
- ความครอบคลุมของ monitoring
- คุณภาพของเอกสาร
- การจัดระเบียบโค้ดและการทดสอบ

#### การแบ่งเวลา
- สถาปัตยกรรมและการออกแบบ: 10 ชั่วโมง
- Data pipeline: 15 ชั่วโมง
- Training pipeline: 15 ชั่วโมง
- Serving และ deployment: 12 ชั่วโมง
- Monitoring: 10 ชั่วโมง
- การทดสอบ: 8 ชั่วโมง

---

### โปรเจกต์ 103: การ Deploy LLM ระดับ Production
**สถานะ**: ✅ เสร็จสมบูรณ์ | **ระยะเวลา**: 80 ชั่วโมง | **ไฟล์**: 47

#### ภาพรวม
Deploy ระบบ Large Language Model ระดับ production พร้อมความสามารถ RAG, vector search และ observability อย่างครอบคลุม โปรเจกต์ capstone นี้บูรณาการทั้ง 10 โมดูล

#### วัตถุประสงค์ของโปรเจกต์
- Deploy LLM สำหรับ inference ระดับ production
- ทำ RAG ด้วย vector database
- สร้าง LLM infrastructure ที่ scale ได้
- Optimize ด้านต้นทุนและประสิทธิภาพ
- ทำ monitoring อย่างครอบคลุม
- Provision infrastructure as code

#### ผลลัพธ์การเรียนรู้
หลังจบโปรเจกต์นี้ คุณจะ:
- ✅ Deploy LLM ด้วย vLLM เพื่อการ serve ที่มีประสิทธิภาพ
- ✅ สร้างระบบ RAG ด้วย Weaviate
- ✅ ทำ semantic search และ retrieval
- ✅ Optimize ประสิทธิภาพ LLM inference
- ✅ สร้างระบบ AI แบบหลายโมเดล
- ✅ ทำ monitoring เฉพาะสำหรับ LLM
- ✅ จัดการ infrastructure ด้วย Terraform
- ✅ Deploy บน Kubernetes พร้อมรองรับ GPU

#### โครงสร้างโปรเจกต์
```
project-103-llm-deployment/
├── src/
│   ├── api/                  # FastAPI LLM service
│   ├── llm/                  # LLM inference
│   ├── rag/                  # RAG implementation
│   ├── vectordb/             # Vector database
│   ├── monitoring/           # Observability
│   └── utils/
├── terraform/                 # Infrastructure as Code
│   ├── aws/
│   ├── gcp/
│   └── modules/
├── kubernetes/
│   ├── base/                 # Base manifests
│   ├── overlays/             # Environment overlays
│   │   ├── dev/
│   │   ├── staging/
│   │   └── production/
│   ├── llm-deployment/       # LLM serving
│   ├── vectordb/             # Weaviate
│   └── monitoring/
├── docker/
│   ├── llm-service/
│   ├── rag-service/
│   └── ingestion/
├── data/
│   ├── documents/            # Source documents
│   ├── embeddings/           # Generated embeddings
│   └── scripts/              # Data processing
├── monitoring/
│   ├── prometheus/
│   ├── grafana/
│   │   └── dashboards/       # LLM dashboards
│   └── alerts/
├── tests/
│   ├── unit/
│   ├── integration/
│   ├── e2e/
│   └── performance/
├── scripts/
│   ├── deploy.sh
│   ├── scale.sh
│   └── benchmark.sh
└── docs/
    ├── architecture/
    ├── api/
    ├── deployment/
    └── troubleshooting/
```

#### ฟีเจอร์หลัก

**LLM Serving**
- vLLM สำหรับ inference ที่มีประสิทธิภาพ
- รองรับ multi-GPU
- Dynamic batching
- Streaming response
- Model quantization

**ระบบ RAG**
- Document ingestion pipeline
- Semantic chunking
- Vector embedding (sentence-transformers)
- Hybrid search (vector + keyword)
- การ optimize context window
- Re-ranking

**Vector Database**
- การ deploy Weaviate
- การออกแบบ schema
- การ optimize index
- Backup และ recovery
- Multi-tenancy

**Infrastructure**
- Terraform สำหรับทรัพยากร cloud
- Kubernetes พร้อม GPU node
- Auto-scaling ตาม load
- การ optimize ต้นทุน
- รองรับหลาย environment

**Monitoring และ Observability**
- การ log request/response
- Metric ด้าน latency และ throughput
- การติดตามต้นทุนต่อ request
- การ monitor การใช้งาน GPU
- Quality metric (relevance, coherence)
- การแจ้งเตือนเมื่อพบความผิดปกติ

**การออกแบบ API**
- RESTful endpoint
- Streaming response แบบ SSE
- Authentication และ authorization
- Rate limiting
- API versioning

#### เทคโนโลยีที่ใช้
- **LLM**: vLLM, Hugging Face Transformers
- **Vector DB**: Weaviate
- **Orchestration**: LangChain
- **Infrastructure**: Terraform, Kubernetes
- **Monitoring**: Prometheus, Grafana, Jaeger
- **Cloud**: AWS (EKS, EC2 GPU instance)
- **Storage**: S3, EBS
- **API**: FastAPI, Uvicorn
- **Testing**: pytest, locust

#### สถาปัตยกรรมระบบ

```
┌─────────────┐
│   Client    │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────┐
│   Load Balancer/Ingress    │
└──────────┬──────────────────┘
           │
           ▼
    ┌──────────────┐
    │  API Gateway │
    └──────┬───────┘
           │
    ┌──────┴───────┐
    │              │
    ▼              ▼
┌─────────┐   ┌─────────┐
│   LLM   │   │   RAG   │
│ Service │   │ Service │
└────┬────┘   └────┬────┘
     │             │
     │             ▼
     │      ┌────────────┐
     │      │  Weaviate  │
     │      │  Vector DB │
     │      └────────────┘
     │
     ▼
┌─────────────────────┐
│  vLLM Inference     │
│  (GPU-accelerated)  │
└─────────────────────┘
```

#### สถานการณ์การ Deploy

**Development**
- GPU instance เดียว
- Weaviate บนเครื่อง
- Replica น้อยที่สุด
- Debug logging

**Staging**
- GPU instance 2 ตัว
- Managed Weaviate
- เปิดใช้ auto-scaling
- Performance testing

**Production**
- GPU instance 4 ตัวขึ้นไป
- Weaviate แบบ high-availability
- Auto-scaling แบบเชิงรุก
- Monitoring อย่างครอบคลุม
- Multi-region (ไม่บังคับ)

#### เป้าหมายด้านประสิทธิภาพ
- **Latency**: p95 < 2 วินาทีสำหรับ RAG query
- **Throughput**: 100+ request/วินาที
- **Availability**: uptime 99.9%
- **ต้นทุน**: < $0.10 ต่อ 1K token
- **การใช้งาน GPU**: > 70%

#### เกณฑ์การประเมิน
- สถาปัตยกรรมและการออกแบบระบบ
- การ optimize LLM inference
- คุณภาพการทำ RAG
- Infrastructure as Code best practices
- Monitoring และ observability
- การ optimize ประสิทธิภาพและต้นทุน
- ความครบถ้วนของเอกสาร
- ความครอบคลุมและคุณภาพของการทดสอบ
- การทำ security

#### การแบ่งเวลา
- สถาปัตยกรรมและการวางแผน: 12 ชั่วโมง
- การพัฒนา LLM service: 18 ชั่วโมง
- การพัฒนาระบบ RAG: 15 ชั่วโมง
- การตั้งค่า vector database: 8 ชั่วโมง
- การ provision infrastructure: 12 ชั่วโมง
- การทำ monitoring: 8 ชั่วโมง
- การทดสอบและ optimize: 5 ชั่วโมง
- การทำเอกสาร: 2 ชั่วโมง

#### โจทย์ท้าทายเพิ่มเติม
- สร้าง fine-tuning pipeline
- เพิ่ม multi-model routing
- สร้างระบบ prompt caching
- สร้าง dashboard ติดตามต้นทุน
- เพิ่ม automated evaluation pipeline
- Deploy ไปยัง cloud provider หลายราย

---

## กลยุทธ์การประเมินผล

### ปรัชญา
การประเมินผลออกแบบมาเพื่อยืนยันทั้งความรู้เชิงทฤษฎีและทักษะเชิงปฏิบัติ แต่ละโมดูลและโปรเจกต์มีการประเมินหลายรูปแบบเพื่อให้มั่นใจถึงความเข้าใจอย่างครอบคลุม

### ประเภทการประเมิน

#### 1. แบบทดสอบประจำโมดูล
- **รูปแบบ**: ปรนัยเลือกตอบเดียว เลือกได้หลายข้อ และถูก/ผิด
- **จำนวนข้อ**: 30-50 ข้อต่อโมดูล
- **ระยะเวลา**: 45-60 นาที
- **คะแนนผ่าน**: 80%
- **การสอบซ่อม**: ไม่จำกัดครั้ง โดยเว้นระยะ 24 ชั่วโมง
- **วัตถุประสงค์**: ยืนยันความเข้าใจเชิงแนวคิด

#### 2. การสอบภาคปฏิบัติ
- **รูปแบบ**: โจทย์เขียนโค้ดเชิงปฏิบัติ
- **ระยะเวลา**: 2-4 ชั่วโมง
- **เกณฑ์ผ่าน**: ตรงตามข้อกำหนดทั้งหมด + คุณภาพโค้ด
- **การส่งงาน**: GitHub repository
- **การตรวจ**: Automated test + การตรวจโดยผู้สอน
- **วัตถุประสงค์**: ยืนยันทักษะเชิงปฏิบัติ

#### 3. การประเมินโปรเจกต์
- **รูปแบบ**: พัฒนาโปรเจกต์ให้สมบูรณ์
- **ระยะเวลา**: 60-80 ชั่วโมงภายใน 2-4 สัปดาห์
- **เกณฑ์การประเมิน**:
  - การทำงานของระบบ (40%)
  - คุณภาพโค้ด (20%)
  - การทดสอบ (15%)
  - เอกสาร (15%)
  - Best practices (10%)
- **การส่งงาน**: GitHub repository + วิดีโอสาธิต
- **วัตถุประสงค์**: ยืนยันความสามารถแบบ end-to-end

#### 4. Code Review
- **รูปแบบ**: การรีวิวโดยเพื่อนร่วมเรียนและผู้สอน
- **จุดเน้น**: คุณภาพโค้ด, best practices, design pattern
- **ความถี่**: ทุกโปรเจกต์
- **วัตถุประสงค์**: การพัฒนาทักษะระดับมืออาชีพ

### เกณฑ์การให้คะแนน

#### คุณภาพโค้ด (20%)
- โค้ดสะอาด อ่านง่าย
- สไตล์สม่ำเสมอ (PEP 8)
- ตั้งชื่อตัวแปรให้สื่อความหมาย
- มีเอกสารประกอบที่เหมาะสม
- ไม่มี code smell

#### การทำงานของระบบ (40%)
- ตรงตามข้อกำหนดทั้งหมด
- จัดการ edge case
- การจัดการ error
- ประสิทธิภาพอยู่ในระดับที่ยอมรับได้
- ข้อพิจารณาด้าน security

#### การทดสอบ (15%)
- Unit test coverage > 80%
- มี integration test
- มี E2E test สำหรับเส้นทางสำคัญ
- คุณภาพของ test และ assertion
- การเชื่อมต่อกับ CI/CD

#### เอกสาร (15%)
- ความครบถ้วนของ README
- เอกสาร API
- แผนภาพสถาปัตยกรรม
- คำแนะนำการตั้งค่า
- คู่มือ troubleshooting

#### Best Practices (10%)
- Design pattern
- แนวปฏิบัติด้าน security
- การ optimize ประสิทธิภาพ
- การทำ monitoring
- ความพร้อมสำหรับ production

### เส้นทางการรับรอง

#### ระดับ 1: Badge เมื่อจบโมดูล
- รับ badge สำหรับแต่ละโมดูลที่เรียนจบ
- ข้อกำหนด: ผ่านแบบทดสอบ + สอบภาคปฏิบัติ
- การรับรอง: Badge ที่แชร์บน LinkedIn ได้

#### ระดับ 2: ใบรับรองโปรเจกต์
- ใบรับรองสำหรับแต่ละโปรเจกต์ที่ทำเสร็จ
- ข้อกำหนด: ผ่านเกณฑ์การประเมินทั้งหมด
- การรับรอง: ใบรับรองระดับมืออาชีพ

#### ระดับ 3: จบหลักสูตร
- **ใบรับรอง AI Infrastructure Engineer**
- ข้อกำหนด:
  - เรียนจบทั้ง 10 โมดูล
  - ทำโปรเจกต์ครบทั้ง 3 โปรเจกต์
  - คะแนนเฉลี่ยขั้นต่ำ 80% ในทุกการประเมิน
- การรับรอง: ใบรับรองที่ตรวจสอบได้ + portfolio

### การสร้าง Portfolio
ตลอดหลักสูตร คุณจะสร้าง portfolio ซึ่งประกอบด้วย:
- แบบฝึกหัดเชิงปฏิบัติ 10+ ชุด
- โปรเจกต์ระดับ production ที่สมบูรณ์ 3 โปรเจกต์
- GitHub repository สาธารณะ
- บทความ technical blog (ไม่บังคับ)
- วิดีโอสาธิต

---

## เวลาที่ต้องใช้

### ระยะเวลารวม
**ประมาณการรวม**: 500+ ชั่วโมง (6-12 เดือนแบบ part-time)

### แยกตามโมดูล
| โมดูล | การบรรยาย | แบบฝึกหัด | Lab | การประเมิน | รวม |
|--------|----------|-----------|------|------------|-------|
| 01: พื้นฐาน | 12h | 15h | 8h | 5h | **40h** |
| 02: Cloud Computing | 15h | 18h | 8h | 4h | **45h** |
| 03: Containerization | 16h | 20h | 10h | 4h | **50h** |
| 04: Kubernetes | 20h | 25h | 12h | 3h | **60h** |
| 05: Data Pipeline | 18h | 20h | 10h | 2h | **50h** |
| 06: MLOps | 18h | 22h | 12h | 3h | **55h** |
| 07: GPU Computing | 16h | 20h | 12h | 2h | **50h** |
| 08: Monitoring | 15h | 18h | 10h | 2h | **45h** |
| 09: Infrastructure as Code | 16h | 20h | 12h | 2h | **50h** |
| 10: LLM Infrastructure | 18h | 22h | 12h | 3h | **55h** |
| **รวมย่อย** | **164h** | **200h** | **106h** | **30h** | **500h** |

### แยกตามโปรเจกต์
| โปรเจกต์ | การวางแผน | การพัฒนา | การทดสอบ | เอกสาร | รวม |
|---------|----------|----------------|---------|---------------|-------|
| 01: Model Serving | 8h | 25h | 12h | 15h | **60h** |
| 02: MLOps Pipeline | 10h | 42h | 8h | 10h | **70h** |
| 03: LLM Deployment | 12h | 53h | 5h | 10h | **80h** |
| **รวมย่อย** | **30h** | **120h** | **25h** | **35h** | **210h** |

### ยอดรวมทั้งหมด
**โมดูล + โปรเจกต์**: 500h + 210h = **710 ชั่วโมง**

---

## แผนการเรียน

### แผนเต็มเวลา (3-4 เดือน)
**เวลาที่ใช้**: 40 ชั่วโมง/สัปดาห์

#### เดือนที่ 1
- **สัปดาห์ที่ 1-2**: โมดูล 01-02 (พื้นฐาน, Cloud)
- **สัปดาห์ที่ 3-4**: โมดูล 03-04 (Container, Kubernetes)

#### เดือนที่ 2
- **สัปดาห์ที่ 5-6**: โมดูล 05-06 (Data, MLOps)
- **สัปดาห์ที่ 7-8**: โปรเจกต์ 01 + โมดูล 07-08

#### เดือนที่ 3
- **สัปดาห์ที่ 9-10**: โมดูล 09-10 (IaC, LLM)
- **สัปดาห์ที่ 11-12**: โปรเจกต์ 02

#### เดือนที่ 4
- **สัปดาห์ที่ 13-16**: โปรเจกต์ 03 + ทบทวนครั้งสุดท้าย

### แผน Part-Time (6-9 เดือน)
**เวลาที่ใช้**: 20 ชั่วโมง/สัปดาห์

#### เดือนที่ 1-2
- โมดูล 01-04 (หนึ่งโมดูลทุก 2 สัปดาห์)
- แบบฝึกหัดและ lab แบบเบา ๆ

#### เดือนที่ 3-4
- โมดูล 05-08
- เริ่มโปรเจกต์ 01

#### เดือนที่ 5-6
- ทำโปรเจกต์ 01 ให้เสร็จ
- โมดูล 09-10

#### เดือนที่ 7-8
- โปรเจกต์ 02

#### เดือนที่ 9
- โปรเจกต์ 03
- ทบทวนครั้งสุดท้ายและรับใบรับรอง

### แผนเรียนตามจังหวะของตนเอง (12+ เดือน)
**เวลาที่ใช้**: 10 ชั่วโมง/สัปดาห์

- **ตารางเวลายืดหยุ่น**
- เรียนจบหนึ่งโมดูลต่อเดือน
- หนึ่งโปรเจกต์ทุก 3 เดือน
- เหมาะสำหรับคนทำงาน
- การสนับสนุนและสิทธิ์เข้าถึงแบบขยายเวลา

### แผนนักรบวันหยุด (9-12 เดือน)
**เวลาที่ใช้**: 15-20 ชั่วโมง/สุดสัปดาห์

- **เน้นวันเสาร์-อาทิตย์**
- 2 โมดูลต่อเดือน
- ทำโปรเจกต์ในช่วงวันหยุดยาว
- เหมาะสำหรับคนทำงานเวลา 9-5

### ตารางรายสัปดาห์ที่แนะนำ (Part-Time)

**จันทร์-พุธ** (6 ชั่วโมง)
- วันละ 2 ชั่วโมง: วิดีโอบรรยายและการอ่าน
- เน้นความเข้าใจเชิงแนวคิด

**พฤหัสบดี-ศุกร์** (6 ชั่วโมง)
- วันละ 3 ชั่วโมง: แบบฝึกหัดเชิงปฏิบัติ
- ฝึกเขียนโค้ดและลงมือพัฒนา

**เสาร์** (4 ชั่วโมง)
- Lab และงานเชิงปฏิบัติ
- ช่วงเวลาที่ต้องใช้สมาธิยาวขึ้น

**อาทิตย์** (4 ชั่วโมง)
- ทำโปรเจกต์
- ทบทวนและเสริมความเข้าใจ

---

## เส้นทางอาชีพ

### AI Infrastructure Engineer

#### ภาพรวมของตำแหน่ง
ตำแหน่งระดับเริ่มต้นถึงระดับกลางที่เน้นการสร้างและดูแล infrastructure สำหรับระบบ AI/ML

#### หน้าที่ความรับผิดชอบ
- Deploy และดูแล ML model ใน production
- สร้าง CI/CD pipeline สำหรับระบบ ML
- จัดการแอปพลิเคชันแบบ container
- ทำ monitoring และ alerting
- Optimize ต้นทุน infrastructure
- ทำงานร่วมกับ data scientist และวิศวกร

#### ทักษะที่จำเป็น (ครอบคลุมในหลักสูตรนี้)
- ✅ การเขียนโปรแกรม Python
- ✅ Docker และ Kubernetes
- ✅ Cloud platform (AWS/GCP/Azure)
- ✅ แนวปฏิบัติ MLOps
- ✅ Monitoring และ observability
- ✅ Infrastructure as Code

#### ช่วงเงินเดือน (สหรัฐฯ, 2025)
- **ระดับเริ่มต้น**: $100,000 - $140,000
- **ระดับกลาง**: $140,000 - $180,000
- **ระดับ Senior**: $180,000 - $250,000+

#### บริษัทชั้นนำที่เปิดรับสมัคร
- Google, Meta, Amazon, Microsoft
- OpenAI, Anthropic, Databricks
- Uber, Airbnb, Netflix
- Scale AI, Hugging Face
- ธุรกิจบริการทางการเงิน (Goldman Sachs, JPMorgan)

### เส้นทางอาชีพหลังจบหลักสูตรนี้

#### ขั้นถัดไปในทันที
1. **Senior AI Infrastructure Engineer** (ประสบการณ์ 2-3 ปี)
   - นำโปรเจกต์ด้าน infrastructure
   - เป็นพี่เลี้ยงให้วิศวกรรุ่นน้อง
   - ออกแบบสถาปัตยกรรมระบบ
   - ขับเคลื่อนการตัดสินใจทางเทคนิค

2. **MLOps Engineer** (เส้นทางทางเลือก)
   - เน้น ML lifecycle
   - Model deployment automation
   - Experiment tracking
   - การพัฒนา ML platform

3. **Platform Engineer** (เส้นทางทางเลือก)
   - การพัฒนา ML platform ภายในองค์กร
   - เครื่องมือและประสบการณ์ของนักพัฒนา
   - Self-service infrastructure

#### ทางเลือกอาชีพระยะยาว (5+ ปี)

**สายเทคนิค**
- **AI Infrastructure Architect**
  - ออกแบบ AI platform ระดับองค์กร
  - กลยุทธ์ multi-cloud
  - ความเป็นผู้นำทางเทคนิค
  - เงินเดือน: $200,000 - $350,000+

- **Staff/Principal Engineer**
  - มีอิทธิพลทางเทคนิคทั่วทั้งบริษัท
  - สถาปัตยกรรมและมาตรฐาน
  - การวิจัยและนวัตกรรม
  - เงินเดือน: $250,000 - $500,000+

**สายบริหาร**
- **Engineering Manager**
  - นำทีม infrastructure
  - การบริหารโปรเจกต์
  - การพัฒนาบุคลากร
  - เงินเดือน: $180,000 - $300,000+

- **Director of ML Infrastructure**
  - การวางแผนเชิงกลยุทธ์
  - สร้างผลกระทบทั่วทั้งองค์กร
  - การบริหารงบประมาณและทรัพยากร
  - เงินเดือน: $250,000 - $450,000+

### แนวโน้มอุตสาหกรรม (2025)

**ด้านที่มีความต้องการสูง**
- LLM infrastructure และการ optimize
- ML platform แบบ multi-cloud
- การ optimize ต้นทุนสำหรับ AI workload
- ML inference แบบ real-time
- การ deploy Edge AI

**ทักษะที่กำลังมาแรง**
- การ fine-tune และ deploy LLM
- การ optimize vector database
- AI safety และ governance
- Green AI (ประสิทธิภาพด้านพลังงาน)
- Infrastructure สำหรับ federated learning

---

## แหล่งเรียนรู้

### สิ่งที่รวมอยู่ในหลักสูตรนี้

#### เอกสารประกอบการบรรยาย
- 10 โมดูลที่ครอบคลุม
- เอกสารประกอบการบรรยาย 45,000+ บรรทัด
- คำอธิบายโดยละเอียดพร้อมตัวอย่าง
- แผนภาพสถาปัตยกรรม
- ตัวอย่างโค้ด

#### แบบฝึกหัดเชิงปฏิบัติ
- แบบฝึกหัดเขียนโค้ด 120+ ชุด
- เฉลยทีละขั้นตอน
- ความยากเพิ่มขึ้นตามลำดับ
- สถานการณ์จริง

#### Lab เชิงปฏิบัติ
- สภาพแวดล้อม lab 60+ ชุด
- สิทธิ์เข้าถึง cloud sandbox
- การตั้งค่าที่เตรียมไว้ล่วงหน้า
- คู่มือ troubleshooting

#### โปรเจกต์
- โปรเจกต์ที่สมบูรณ์ 3 โปรเจกต์
- Starter code และ stub
- Template สถาปัตยกรรม
- Testing framework

#### การประเมินผล
- คำถามแบบทดสอบ 400+ ข้อ
- การสอบภาคปฏิบัติ 13 ครั้ง
- เกณฑ์การให้คะแนนโปรเจกต์
- เครื่องมือประเมินตนเอง

### แหล่งเรียนรู้ภายนอกที่แนะนำ

#### หนังสือ
- **"Designing Machine Learning Systems"** โดย Chip Huyen
- **"Machine Learning Engineering"** โดย Andriy Burkov
- **"Kubernetes in Action"** โดย Marko Luksa
- **"Terraform: Up and Running"** โดย Yevgeniy Brikman
- **"Site Reliability Engineering"** โดย Google

#### คอร์สออนไลน์ (เสริม)
- **Fast.ai**: Practical Deep Learning
- **DeepLearning.AI**: MLOps Specialization
- **Linux Foundation**: คอร์ส Kubernetes
- **A Cloud Guru**: คอร์ส cloud platform

#### เอกสารอ้างอิง
- **Kubernetes Docs**: https://kubernetes.io/docs/
- **Terraform Registry**: https://registry.terraform.io/
- **MLflow Docs**: https://mlflow.org/docs/
- **vLLM Docs**: https://docs.vllm.ai/
- **Weaviate Docs**: https://weaviate.io/developers/weaviate

#### ชุมชน
- **Kubernetes Slack**: k8s.io/community
- **MLOps Community**: mlops.community
- **r/MachineLearning**: ชุมชนบน Reddit
- **HuggingFace Forums**: discuss.huggingface.co
- **Stack Overflow**: Tag: kubernetes, mlops, docker

#### บล็อกและจดหมายข่าว
- **The Batch** (DeepLearning.AI)
- **บล็อก MLOps.community**
- **Kubernetes Blog**
- **Hugging Face Blog**
- **AWS Machine Learning Blog**

#### ช่อง YouTube
- **TechWorld with Nana**: DevOps และ Kubernetes
- **Yannic Kilcher**: งานวิจัย ML และ LLM
- **Weights & Biases**: บทสอน MLOps
- **Google Cloud Tech**: Cloud และ AI

#### Podcast
- **The TWIML AI Podcast**
- **Kubernetes Podcast**
- **Software Engineering Daily**
- **The Changelog**

---

## การขอความช่วยเหลือ

### ช่องทางการสนับสนุน

#### GitHub Discussions
- ถามคำถาม
- แบ่งปันวิธีแก้ปัญหา
- เชื่อมต่อกับเพื่อนร่วมเรียน
- รับ feedback จากผู้สอน

#### Office Hours
- Live session รายสัปดาห์
- ถาม-ตอบกับผู้สอน
- Code review
- คำแนะนำด้านอาชีพ

#### ชุมชน Discord
- แชตแบบ real-time
- กลุ่มติว
- ทำโปรเจกต์ร่วมกัน
- สร้างเครือข่าย

#### การสนับสนุนทางอีเมล
- คำถามด้านเทคนิค: support@ai-infra-curriculum.com
- งานธุรการ: admin@ai-infra-curriculum.com
- ระยะเวลาตอบกลับ: 24-48 ชั่วโมง

### แหล่งข้อมูลสำหรับ Troubleshooting

#### ปัญหาที่พบบ่อย
แต่ละโมดูลประกอบด้วย:
- คู่มือ troubleshooting
- ส่วนคำถามที่พบบ่อย (FAQ)
- ปัญหาที่ทราบแล้วและวิธีแก้
- กลยุทธ์การ debug

#### ตัวอย่างโค้ด
- Reference implementation ที่ใช้งานได้จริง
- Pattern และ anti-pattern ที่พบบ่อย
- Best practices
- เคล็ดลับการ optimize ประสิทธิภาพ

### แนวทางสำหรับกลุ่มติว

#### การหาเพื่อนติว
- ช่อง Discord #study-groups
- จับคู่ตาม time zone
- พิจารณาตามระดับทักษะ
- ทำโปรเจกต์ร่วมกัน

#### Best Practices ของกลุ่มติว
- กำหนดตารางนัดพบสม่ำเสมอ
- สลับบทบาทผู้ดำเนินการ
- แบ่งปันแหล่งข้อมูล
- จัด session code review
- ฝึกสัมภาษณ์จำลอง

---

## ขั้นตอนถัดไป

### เริ่มต้นใช้งาน

1. **ทบทวนความรู้พื้นฐานที่ต้องมี**: ตรวจสอบว่าคุณมีความรู้ที่จำเป็น
2. **ตั้งค่าสภาพแวดล้อม**: ทำตามคู่มือการตั้งค่าในโมดูล 01
3. **เลือกแผนการเรียน**: เลือกจังหวะที่เหมาะกับตารางเวลาของคุณ
4. **เข้าร่วมชุมชน**: เชื่อมต่อผ่าน Discord และ GitHub
5. **เริ่มโมดูล 01**: เริ่มต้นเส้นทางการเรียนรู้ของคุณ

### เส้นทางการรับรอง

1. เรียนจบทั้ง 10 โมดูล
2. ผ่านการประเมินของทุกโมดูล
3. ทำโปรเจกต์ครบทั้ง 3 โปรเจกต์
4. ส่ง portfolio เพื่อรับการตรวจ
5. รับใบรับรอง AI Infrastructure Engineer

### การเตรียมตัวด้านอาชีพ

- สร้าง portfolio สาธารณะบน GitHub
- เขียนบทความ technical blog
- มีส่วนร่วมกับ open source
- สร้างเครือข่ายในชุมชน
- เตรียมตัวสำหรับการสัมภาษณ์ทางเทคนิค

---

## การติดต่อและการสนับสนุน

**อีเมล**: support@ai-infra-curriculum.com
**เว็บไซต์**: https://github.com/ai-infra-curriculum
**Discord**: [เข้าร่วมชุมชนของเรา](#)
**Office Hours**: ทุกวันพุธ 18:00-19:00 น. EST

---

## กิตติกรรมประกาศ

หลักสูตรนี้พัฒนาขึ้นโดยอ้างอิงจาก:
- การวิเคราะห์ประกาศรับสมัครงาน 500+ ตำแหน่งจากบริษัทเทคโนโลยีชั้นนำ
- การสัมภาษณ์ AI infrastructure engineer 50+ คน
- Best practices และมาตรฐานของอุตสาหกรรม
- Feedback จากผู้เข้าร่วมโครงการนำร่อง
- แนวโน้มล่าสุดของ AI/ML infrastructure (2024-2025)

---

## ประวัติเวอร์ชัน

**เวอร์ชัน 1.0** (2025-01-15)
- เปิดตัวหลักสูตรครั้งแรก
- 10 โมดูลที่สมบูรณ์
- 3 โปรเจกต์ที่ครอบคลุม
- เนื้อหา 500+ ชั่วโมง

---

**พร้อมเริ่มต้นเส้นทางสู่ AI Infrastructure Engineering แล้วหรือยัง?**
**เริ่มต้นที่ [โมดูล 01: พื้นฐาน](lessons/mod-101-foundations/README.md)**

---

## บันทึกความคืบหน้า

ข้อความ "✅ เสร็จสมบูรณ์ 100%" ที่เคยระบุไว้ก่อนหน้านี้ไม่ถูกต้อง ณ วันที่ 2026-05-22 หลักสูตรอยู่ระหว่างการพัฒนา โดยมีสถานะที่แท้จริงเทียบกับสิ่งที่ระบุไว้ใน "เนื้อหาที่รวมอยู่" ดังนี้:

### สถานะแบบฝึกหัด / lab รายโมดูล (หลังการเพิ่ม lab + แบบฝึกหัดเมื่อ 2026-05-22)

| โมดูล | แบบฝึกหัดที่ระบุไว้ | มีอยู่จริง | Lab ที่ระบุไว้ | Lab ที่มีอยู่จริง |
|---|---|---|---|---|
| 101 พื้นฐาน | 10 | **10 ✅** | 5 | **5 ✅** |
| 102 Cloud | 8 | **8 ✅** | 4 | **4 ✅** |
| 103 Containerization | 12 | **12 ✅** | 6 | **6 ✅** |
| 104 Kubernetes | 15 | **15 ✅** | 8 | **8 ✅** |
| 105 Data Pipeline | 12 | **12 ✅** | 6 | **6 ✅** |
| 106 MLOps | 14 | **14 ✅** | 7 | **7 ✅** |
| 107 GPU | 11 | 3 | 6 | **6 ✅** |
| 108 Monitoring | 10 | **10 ✅** | 5 | **5 ✅** |
| 109 IaC | 13 | **13 ✅** | 7 | **7 ✅** |
| 110 LLM | 14 | **14 ✅** | 8 | **8 ✅** |

**อัปเดตสถานะ:** Lab ทั้ง 62 ชุดที่ระบุไว้ได้รับการเขียนขึ้นเมื่อ 2026-05-22 ในรูปแบบ walkthrough เชิงปฏิบัติที่มีเนื้อหาจริงจัง (วัตถุประสงค์, ความรู้พื้นฐานที่ต้องมี, ขั้นตอนแบบมีลำดับเลข, checklist สำหรับตรวจสอบ, การ cleanup, troubleshooting) โดยอยู่ใน `lessons/mod-XXX-*/labs/`

ช่องว่างด้านแบบฝึกหัดยังคงอยู่ (มีอยู่ 32 จาก 119) และกำลังได้รับการแก้ไขในการเพิ่มเนื้อหาแยกต่างหาก เนื่องจากแบบฝึกหัดแต่ละชุดมีเป้าหมายความลึกระดับ 25–50 KB เช่นเดียวกับชุดที่มีอยู่ ซึ่งเป็นงานเขียนจำนวนมากที่ควรได้รับความทุ่มเทแยกเฉพาะ

### สถานะโปรเจกต์

ทั้งสามโปรเจกต์ (101, 102, 103) เสร็จสมบูรณ์และรันได้จริง เป็นส่วนที่ขัดเกลามาดีที่สุดของหลักสูตร

### สิ่งที่คุณทำได้ในวันนี้

แม้จะยังมีช่องว่างด้านแบบฝึกหัด/lab หลักสูตรนี้ก็สามารถใช้เรียนด้วยตนเองได้ตั้งแต่ต้นจนจบ:

- อ่านเนื้อหาบรรยายของแต่ละโมดูล (สมบูรณ์เสมอ)
- ทำแบบฝึกหัดที่มีอยู่ (มีเนื้อหาเข้มข้น — ชุดละ 25–50 KB)
- ทำแบบทดสอบประจำโมดูล
- สร้างทั้งสามโปรเจกต์

แบบฝึกหัดและ lab ที่เหลือเป็นส่วนเสริมเพื่อความครบถ้วน ไม่ได้เป็นอุปสรรคต่อผลลัพธ์การเรียนรู้หลัก

---

*อัปเดตล่าสุด: 2026-05-22*
*เวอร์ชันหลักสูตร: 1.1.0*
*สถานะ: 🚧 อยู่ระหว่างการพัฒนา*
