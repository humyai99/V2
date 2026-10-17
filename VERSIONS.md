# เวอร์ชันของเทคโนโลยี - แทร็ก Engineer

**อัปเดตล่าสุด**: มกราคม 2025

เอกสารนี้ระบุเวอร์ชันที่แนะนำและผ่านการทดสอบแล้วสำหรับเทคโนโลยีทั้งหมดที่ใช้ในหลักสูตร AI Infrastructure Engineer

## ภาษาและ Runtime หลัก

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Python** | 3.11+ | แนะนำ: 3.11 หรือ 3.12 สำหรับ production |
| **Go** | 1.21+ | สำหรับเซอร์วิสประสิทธิภาพสูง |
| **Bash** | 5.0+ | Shell scripting |
| **Node.js** | 20 LTS | สำหรับเครื่องมือ/dashboard สำหรับ monitoring |

## ML Framework ขั้นสูง

### Framework สำหรับการเทรน
| แพ็กเกจ | เวอร์ชัน | วัตถุประสงค์ |
|---------|---------|---------|
| **PyTorch** | 2.1.0+ | Framework หลักสำหรับการเทรน |
| **PyTorch Lightning** | 2.1.0+ | จัดการลำดับขั้นตอนการเทรน |
| **TensorFlow** | 2.15.0+ | Framework ทางเลือก |
| **JAX** | 0.4.20+ | งานวิจัยประสิทธิภาพสูง |
| **DeepSpeed** | 0.12+ | Distributed training ขนาดใหญ่ |

### LLM Infrastructure
| แพ็กเกจ | เวอร์ชัน | วัตถุประสงค์ |
|---------|---------|---------|
| **transformers** | 4.35.0+ | โมเดลของ Hugging Face |
| **vLLM** | 0.2.6+ | LLM serving แบบ high-throughput |
| **TGI (Text Generation Inference)** | 1.3+ | Serving ของ Hugging Face |
| **TensorRT-LLM** | 0.6+ | LLM inference ที่ปรับแต่งโดย NVIDIA |
| **llama.cpp** | ล่าสุด | LLM inference บน CPU/ทรัพยากรจำกัด |

### Model Optimization
| แพ็กเกจ | เวอร์ชัน | วัตถุประสงค์ |
|---------|---------|---------|
| **ONNX** | 1.15.0+ | แปลงรูปแบบโมเดล |
| **TensorRT** | 8.6+ | Inference optimization ของ NVIDIA |
| **OpenVINO** | 2023.2+ | Inference optimization ของ Intel |
| **bitsandbytes** | 0.41+ | ไลบรารีสำหรับ quantization |

## MLOps และ Workflow Orchestration

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Apache Airflow** | 2.7+ | Workflow orchestration |
| **Kubeflow** | 1.8+ | ML platform บน Kubernetes |
| **MLflow** | 2.9+ | Experiment tracking และ model registry |
| **DVC** | 3.30+ | Data version control |
| **Great Expectations** | 0.18+ | ตรวจสอบความถูกต้องของข้อมูล |

### Feature Store
| เทคโนโลยี | เวอร์ชัน | วัตถุประสงค์ |
|------------|---------|---------|
| **Feast** | 0.35+ | Feature store |
| **Tecton** | ล่าสุด | Feature platform ระดับองค์กร |

## Kubernetes Ecosystem

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Kubernetes** | 1.28+ | Cluster สำหรับ production |
| **kubectl** | 1.28+ | ให้ตรงกับเวอร์ชันของ cluster |
| **Helm** | 3.13+ | Package manager |
| **Kustomize** | 5.2+ | Configuration management |
| **ArgoCD** | 2.9+ | GitOps CD |
| **Flux** | 2.2+ | GitOps ทางเลือก |

### Kubernetes Operator
| Operator | เวอร์ชัน | วัตถุประสงค์ |
|----------|---------|---------|
| **Training Operator** | 1.7+ | Distributed training (PyTorch, TF) |
| **KServe** | 0.12+ | Model serving |
| **Volcano** | 1.8+ | Batch job scheduler |
| **Ray Operator** | 1.0+ | Distributed compute |

### Service Mesh
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Istio** | 1.20+ | Service mesh |
| **Linkerd** | 2.14+ | Service mesh แบบ lightweight |

## Cloud Native Storage

| เทคโนโลยี | เวอร์ชัน | วัตถุประสงค์ |
|------------|---------|---------|
| **Rook-Ceph** | 1.13+ | Operator สำหรับ distributed storage |
| **MinIO** | RELEASE.2024-01 | Object storage ที่รองรับ S3 |
| **JuiceFS** | 1.1+ | Distributed POSIX filesystem |

## เทคโนโลยี Container

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Docker** | 24.0+ | Container runtime |
| **containerd** | 1.7+ | Container runtime (production) |
| **CRI-O** | 1.28+ | Container runtime แบบ lightweight |
| **Buildah** | 1.33+ | เครื่องมือ build container image |
| **Podman** | 4.8+ | Container แบบไม่ใช้ daemon |

### การรองรับ GPU ใน Container
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **NVIDIA Container Toolkit** | 1.14+ | รองรับ GPU ใน Docker |
| **NVIDIA Device Plugin** | 0.14+ | รองรับ GPU ใน Kubernetes |
| **MIG Manager** | 0.6+ | Multi-Instance GPU |

## Cloud Platform - ขั้นสูง

### บริการของ AWS
| บริการ | เวอร์ชันที่แนะนำ | หมายเหตุ |
|---------|-------------------|-------|
| **EKS** | 1.28 | Managed Kubernetes |
| **SageMaker** | ล่าสุด | Managed ML platform |
| **EMR** | 6.15+ | ประมวลผล big data |
| **Batch** | ล่าสุด | Batch computing |
| **Step Functions** | ล่าสุด | Workflow orchestration |

### บริการของ GCP
| บริการ | เวอร์ชันที่แนะนำ | หมายเหตุ |
|---------|-------------------|-------|
| **GKE** | 1.28 | Managed Kubernetes |
| **Vertex AI** | ล่าสุด | Managed ML platform |
| **Dataflow** | ล่าสุด | ประมวลผลแบบ stream/batch |
| **TPU** | v5e | Tensor Processing Unit |

### บริการของ Azure
| บริการ | เวอร์ชันที่แนะนำ | หมายเหตุ |
|---------|-------------------|-------|
| **AKS** | 1.28 | Managed Kubernetes |
| **Azure ML** | ล่าสุด | Managed ML platform |
| **Azure Batch** | ล่าสุด | Batch computing |

## Observability Stack - ระดับ Production

### Metrics และ Monitoring
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Prometheus** | 2.48+ | เก็บ metrics |
| **Thanos** | 0.33+ | Storage ระยะยาวสำหรับ Prometheus |
| **VictoriaMetrics** | 1.95+ | Metrics DB ประสิทธิภาพสูง |
| **Grafana** | 10.2+ | Visualization |
| **Grafana Loki** | 2.9+ | Log aggregation |
| **Grafana Tempo** | 2.3+ | Distributed tracing |

### APM และ Tracing
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Jaeger** | 1.52+ | Distributed tracing |
| **OpenTelemetry** | 1.21+ | Observability framework |
| **Datadog Agent** | 7.50+ | APM เชิงพาณิชย์ |
| **New Relic** | ล่าสุด | APM เชิงพาณิชย์ |

### Logging
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Elasticsearch** | 8.11+ | จัดเก็บและค้นหา log |
| **OpenSearch** | 2.11+ | Fork ของ Elasticsearch |
| **Fluentd** | 1.16+ | Log collector |
| **Vector** | 0.34+ | Log collector ประสิทธิภาพสูง |

## Infrastructure as Code

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Terraform** | 1.6+ | IaC แบบ multi-cloud |
| **Pulumi** | 3.95+ | IaC สมัยใหม่ที่ใช้ภาษาโปรแกรมจริง |
| **Crossplane** | 1.14+ | IaC แบบ Kubernetes-native |
| **Ansible** | 2.16+ | Configuration management |

### Terraform Provider
| Provider | เวอร์ชัน | หมายเหตุ |
|----------|---------|-------|
| `hashicorp/aws` | ~> 5.0 | ทรัพยากร AWS |
| `hashicorp/google` | ~> 5.0 | ทรัพยากร GCP |
| `hashicorp/azurerm` | ~> 3.0 | ทรัพยากร Azure |
| `hashicorp/kubernetes` | ~> 2.24 | ทรัพยากร Kubernetes |
| `hashicorp/helm` | ~> 2.12 | Helm release |

## การประมวลผลข้อมูล

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Apache Spark** | 3.5+ | ประมวลผลข้อมูลแบบกระจาย |
| **Apache Kafka** | 3.6+ | Event streaming |
| **Apache Flink** | 1.18+ | Stream processing |
| **Dask** | 2023.12+ | Python แบบขนาน |
| **Ray** | 2.9+ | Python แบบกระจาย |

## เทคโนโลยีฐานข้อมูล - Production

### Relational
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **PostgreSQL** | 16+ | ฐานข้อมูลสำหรับ production |
| **MySQL** | 8.2+ | RDBMS ทางเลือก |
| **CockroachDB** | 23.2+ | Distributed SQL |

### NoSQL
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Redis** | 7.2+ | Cache/store แบบ in-memory |
| **MongoDB** | 7.0+ | Document database |
| **Cassandra** | 4.1+ | Wide-column store |
| **ScyllaDB** | 5.4+ | ทางเลือกแทน Cassandra ประสิทธิภาพสูง |

### Vector Database
| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Pinecone** | ล่าสุด | Managed vector DB |
| **Weaviate** | 1.23+ | Vector DB แบบ open-source |
| **Milvus** | 2.3+ | Vector similarity search |
| **Qdrant** | 1.7+ | Vector search engine |
| **ChromaDB** | 0.4+ | Embedding database |

## CI/CD

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **GitHub Actions** | ล่าสุด | CI/CD platform |
| **GitLab CI** | 16.7+ | CI/CD ทางเลือก |
| **Jenkins** | 2.426+ | CI/CD แบบดั้งเดิม |
| **Tekton** | 0.54+ | CI/CD แบบ Kubernetes-native |
| **Argo Workflows** | 3.5+ | Workflow บน Kubernetes |

## Security และ Secrets Management

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **HashiCorp Vault** | 1.15+ | Secrets management |
| **Sealed Secrets** | 0.24+ | เข้ารหัส secret ของ Kubernetes |
| **External Secrets** | 0.9+ | Sync secret เข้าสู่ Kubernetes |
| **SOPS** | 3.8+ | จัดการไฟล์ที่เข้ารหัส |
| **cert-manager** | 1.13+ | จัดการ TLS certificate |

## การรองรับ GPU และ Accelerator

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **CUDA** | 12.2+ | การเขียนโปรแกรมบน NVIDIA GPU |
| **cuDNN** | 8.9+ | Primitive สำหรับ deep learning |
| **NCCL** | 2.19+ | การสื่อสารระหว่าง multi-GPU |
| **NVIDIA Driver** | 535+ | GPU driver |
| **ROCm** | 5.7+ | รองรับ AMD GPU |

### GPU Monitoring
| เทคโนโลยี | เวอร์ชัน | วัตถุประสงค์ |
|------------|---------|---------|
| **DCGM** | 3.3+ | Monitoring GPU ใน datacenter ของ NVIDIA |
| **dcgm-exporter** | 3.3+ | Prometheus exporter สำหรับ DCGM |

## Performance และ Cost Optimization

| เทคโนโลยี | เวอร์ชัน | วัตถุประสงค์ |
|------------|---------|---------|
| **Karpenter** | 0.32+ | Autoscaling ของ Kubernetes |
| **Cluster Autoscaler** | 1.28+ | Autoscaling ของ K8s แบบดั้งเดิม |
| **KEDA** | 2.12+ | Autoscaling แบบ event-driven |
| **Kubecost** | 1.108+ | Monitoring ค่าใช้จ่าย |

## Service Discovery และ Configuration

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **Consul** | 1.17+ | Service mesh และ discovery |
| **etcd** | 3.5+ | Distributed key-value store |
| **CoreDNS** | 1.11+ | DNS server |

## Message Queue

| เทคโนโลยี | เวอร์ชัน | หมายเหตุ |
|------------|---------|-------|
| **RabbitMQ** | 3.12+ | Message broker |
| **NATS** | 2.10+ | Messaging แบบ cloud-native |
| **Pulsar** | 3.1+ | Messaging แบบกระจาย |

## Testing และคุณภาพ

| เทคโนโลยี | เวอร์ชัน | วัตถุประสงค์ |
|------------|---------|---------|
| **pytest** | 7.4+ | Testing สำหรับ Python |
| **locust** | 2.18+ | Load testing |
| **k6** | 0.48+ | Load testing |
| **Chaos Mesh** | 2.6+ | Chaos engineering |
| **Litmus** | 3.8+ | Chaos engineering |

## แพ็กเกจ Python - ขั้นสูง

### Distributed Computing
| แพ็กเกจ | เวอร์ชัน | วัตถุประสงค์ |
|---------|---------|---------|
| **ray[default]** | 2.9+ | Distributed computing |
| **dask[complete]** | 2023.12+ | Parallel computing |
| **horovod** | 0.28+ | Distributed deep learning |

### Performance
| แพ็กเกจ | เวอร์ชัน | วัตถุประสงค์ |
|---------|---------|---------|
| **numba** | 0.58+ | JIT compilation |
| **cython** | 3.0+ | C extension สำหรับ Python |
| **pyarrow** | 14.0+ | Apache Arrow สำหรับ Python |

## ตารางความเข้ากันได้ของเวอร์ชัน

### Kubernetes + CUDA + PyTorch
| Kubernetes | CUDA | PyTorch | สถานะ |
|-----------|------|---------|--------|
| 1.28 | 12.2 | 2.1+ | ✅ แนะนำ |
| 1.28 | 12.1 | 2.1+ | ✅ รองรับ |
| 1.27 | 12.2 | 2.1+ | ⚠️  บำรุงรักษาเท่านั้น |

### เวอร์ชัน Kubernetes ของ Cloud Provider
| Provider | เวอร์ชันที่รองรับ | แนะนำ |
|----------|-------------------|-------------|
| AWS EKS | 1.26, 1.27, 1.28 | 1.28 |
| GCP GKE | 1.26, 1.27, 1.28, 1.29 | 1.28 |
| Azure AKS | 1.26, 1.27, 1.28 | 1.28 |

## เทคโนโลยีที่เลิกใช้แล้ว

| เทคโนโลยี | เวอร์ชันที่เลิกใช้ | สิ้นสุดการสนับสนุน | แนวทางการย้าย |
|------------|-------------------|----------------|----------------|
| Python | < 3.10 | EOL แล้ว | อัปเกรดเป็น 3.11+ |
| Kubernetes | < 1.26 | ธ.ค. 2024 | อัปเกรดเป็น 1.28+ |
| TensorFlow | 1.x | EOL | ใช้ TensorFlow 2.15+ |
| Docker Swarm | ทั้งหมด | ถือว่าเลิกใช้แล้ว | ย้ายไปใช้ Kubernetes |

## คำสั่งติดตั้ง - อ้างอิงด่วน

### เครื่องมือ MLOps
```bash
# MLflow
pip install mlflow==2.9.2

# DVC
pip install dvc[all]==3.30.0

# Kubeflow Pipelines SDK
pip install kfp==2.5.0
```

### เครื่องมือ Kubernetes
```bash
# Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# ArgoCD CLI
brew install argocd  # macOS
# Or download binary from releases

# K9s (cluster management)
brew install k9s
```

### Infrastructure as Code
```bash
# Terraform
brew install terraform

# Pulumi
curl -fsSL https://get.pulumi.com | sh

# Crossplane CLI
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
```

## Performance Benchmark (อ้างอิง)

### Throughput ของ LLM Inference (tokens/วินาที)
| ขนาดโมเดล | CPU | T4 GPU | A10G | A100 |
|-----------|-----|---------|------|------|
| 7B params | ~1 | ~20 | ~50 | ~100 |
| 13B params | ~0.5 | ~10 | ~25 | ~50 |
| 70B params | N/A | N/A | ~5 | ~15 |

*ใช้ vLLM กับ FP16, batch size 1*

## การสนับสนุนและการอัปเดต

- **ความถี่ในการอัปเดต**: รายไตรมาส (มกราคม, เมษายน, กรกฎาคม, ตุลาคม)
- **Security Patch**: ทันทีที่มีการปล่อย
- **Breaking Change**: แจ้งล่วงหน้าอย่างน้อย 30 วัน
- **การสนับสนุนเวอร์ชัน**: 2 major version ล่าสุด

## Checklist ความพร้อมสำหรับ Production

ก่อน deploy ขึ้น production ให้ตรวจสอบว่า:

- [ ] ใช้เวอร์ชัน LTS/stable (ไม่ใช่ bleeding edge)
- [ ] ติดตั้ง security patch แล้ว
- [ ] ทดสอบความเข้ากันได้ใน staging แล้ว
- [ ] ตั้งค่า monitoring แล้ว
- [ ] ทดสอบ backup/disaster recovery แล้ว
- [ ] อัปเดตเอกสารแล้ว
- [ ] ทีมได้รับการอบรมเรื่องเวอร์ชันใหม่แล้ว

---

**ดูแลโดย**: AI Infrastructure Engineering Team
**ติดต่อ**: ดู issues ใน repository สำหรับคำถามเกี่ยวกับเวอร์ชันเฉพาะ
