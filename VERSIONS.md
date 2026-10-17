# Technology Versions - Engineer Track

**Last Updated**: January 2025

This document specifies the recommended and tested versions for all technologies used in the AI Infrastructure Engineer curriculum.

## Core Languages & Runtimes

| Technology | Version | Notes |
|------------|---------|-------|
| **Python** | 3.11+ | Recommended: 3.11 or 3.12 for production |
| **Go** | 1.21+ | For high-performance services |
| **Bash** | 5.0+ | Shell scripting |
| **Node.js** | 20 LTS | For tooling/monitoring dashboards |

## Advanced ML Frameworks

### Training Frameworks
| Package | Version | Purpose |
|---------|---------|---------|
| **PyTorch** | 2.1.0+ | Primary training framework |
| **PyTorch Lightning** | 2.1.0+ | Training orchestration |
| **TensorFlow** | 2.15.0+ | Alternative framework |
| **JAX** | 0.4.20+ | High-performance research |
| **DeepSpeed** | 0.12+ | Large-scale distributed training |

### LLM Infrastructure
| Package | Version | Purpose |
|---------|---------|---------|
| **transformers** | 4.35.0+ | Hugging Face models |
| **vLLM** | 0.2.6+ | High-throughput LLM serving |
| **TGI (Text Generation Inference)** | 1.3+ | Hugging Face serving |
| **TensorRT-LLM** | 0.6+ | NVIDIA optimized LLM inference |
| **llama.cpp** | Latest | CPU/low-resource LLM inference |

### Model Optimization
| Package | Version | Purpose |
|---------|---------|---------|
| **ONNX** | 1.15.0+ | Model format conversion |
| **TensorRT** | 8.6+ | NVIDIA inference optimization |
| **OpenVINO** | 2023.2+ | Intel inference optimization |
| **bitsandbytes** | 0.41+ | Quantization library |

## MLOps & Workflow Orchestration

| Technology | Version | Notes |
|------------|---------|-------|
| **Apache Airflow** | 2.7+ | Workflow orchestration |
| **Kubeflow** | 1.8+ | ML platform on Kubernetes |
| **MLflow** | 2.9+ | Experiment tracking & model registry |
| **DVC** | 3.30+ | Data version control |
| **Great Expectations** | 0.18+ | Data validation |

### Feature Stores
| Technology | Version | Purpose |
|------------|---------|---------|
| **Feast** | 0.35+ | Feature store |
| **Tecton** | Latest | Enterprise feature platform |

## Kubernetes Ecosystem

| Technology | Version | Notes |
|------------|---------|-------|
| **Kubernetes** | 1.28+ | Production clusters |
| **kubectl** | 1.28+ | Match cluster version |
| **Helm** | 3.13+ | Package manager |
| **Kustomize** | 5.2+ | Configuration management |
| **ArgoCD** | 2.9+ | GitOps CD |
| **Flux** | 2.2+ | Alternative GitOps |

### Kubernetes Operators
| Operator | Version | Purpose |
|----------|---------|---------|
| **Training Operator** | 1.7+ | Distributed training (PyTorch, TF) |
| **KServe** | 0.12+ | Model serving |
| **Volcano** | 1.8+ | Batch job scheduler |
| **Ray Operator** | 1.0+ | Distributed compute |

### Service Mesh
| Technology | Version | Notes |
|------------|---------|-------|
| **Istio** | 1.20+ | Service mesh |
| **Linkerd** | 2.14+ | Lightweight service mesh |

## Cloud Native Storage

| Technology | Version | Purpose |
|------------|---------|---------|
| **Rook-Ceph** | 1.13+ | Distributed storage operator |
| **MinIO** | RELEASE.2024-01 | S3-compatible object storage |
| **JuiceFS** | 1.1+ | Distributed POSIX filesystem |

## Container Technologies

| Technology | Version | Notes |
|------------|---------|-------|
| **Docker** | 24.0+ | Container runtime |
| **containerd** | 1.7+ | Container runtime (production) |
| **CRI-O** | 1.28+ | Lightweight container runtime |
| **Buildah** | 1.33+ | Container image builder |
| **Podman** | 4.8+ | Daemonless containers |

### GPU Container Support
| Technology | Version | Notes |
|------------|---------|-------|
| **NVIDIA Container Toolkit** | 1.14+ | Docker GPU support |
| **NVIDIA Device Plugin** | 0.14+ | Kubernetes GPU support |
| **MIG Manager** | 0.6+ | Multi-Instance GPU |

## Cloud Platforms - Advanced

### AWS Services
| Service | Recommended Version | Notes |
|---------|-------------------|-------|
| **EKS** | 1.28 | Managed Kubernetes |
| **SageMaker** | Latest | Managed ML platform |
| **EMR** | 6.15+ | Big data processing |
| **Batch** | Latest | Batch computing |
| **Step Functions** | Latest | Workflow orchestration |

### GCP Services
| Service | Recommended Version | Notes |
|---------|-------------------|-------|
| **GKE** | 1.28 | Managed Kubernetes |
| **Vertex AI** | Latest | Managed ML platform |
| **Dataflow** | Latest | Stream/batch processing |
| **TPU** | v5e | Tensor Processing Units |

### Azure Services
| Service | Recommended Version | Notes |
|---------|-------------------|-------|
| **AKS** | 1.28 | Managed Kubernetes |
| **Azure ML** | Latest | Managed ML platform |
| **Azure Batch** | Latest | Batch computing |

## Observability Stack - Production Grade

### Metrics & Monitoring
| Technology | Version | Notes |
|------------|---------|-------|
| **Prometheus** | 2.48+ | Metrics collection |
| **Thanos** | 0.33+ | Long-term Prometheus storage |
| **VictoriaMetrics** | 1.95+ | High-performance metrics DB |
| **Grafana** | 10.2+ | Visualization |
| **Grafana Loki** | 2.9+ | Log aggregation |
| **Grafana Tempo** | 2.3+ | Distributed tracing |

### APM & Tracing
| Technology | Version | Notes |
|------------|---------|-------|
| **Jaeger** | 1.52+ | Distributed tracing |
| **OpenTelemetry** | 1.21+ | Observability framework |
| **Datadog Agent** | 7.50+ | Commercial APM |
| **New Relic** | Latest | Commercial APM |

### Logging
| Technology | Version | Notes |
|------------|---------|-------|
| **Elasticsearch** | 8.11+ | Log storage & search |
| **OpenSearch** | 2.11+ | Elasticsearch fork |
| **Fluentd** | 1.16+ | Log collector |
| **Vector** | 0.34+ | High-performance log collector |

## Infrastructure as Code

| Technology | Version | Notes |
|------------|---------|-------|
| **Terraform** | 1.6+ | Multi-cloud IaC |
| **Pulumi** | 3.95+ | Modern IaC with real languages |
| **Crossplane** | 1.14+ | Kubernetes-native IaC |
| **Ansible** | 2.16+ | Configuration management |

### Terraform Providers
| Provider | Version | Notes |
|----------|---------|-------|
| `hashicorp/aws` | ~> 5.0 | AWS resources |
| `hashicorp/google` | ~> 5.0 | GCP resources |
| `hashicorp/azurerm` | ~> 3.0 | Azure resources |
| `hashicorp/kubernetes` | ~> 2.24 | Kubernetes resources |
| `hashicorp/helm` | ~> 2.12 | Helm releases |

## Data Processing

| Technology | Version | Notes |
|------------|---------|-------|
| **Apache Spark** | 3.5+ | Distributed data processing |
| **Apache Kafka** | 3.6+ | Event streaming |
| **Apache Flink** | 1.18+ | Stream processing |
| **Dask** | 2023.12+ | Parallel Python |
| **Ray** | 2.9+ | Distributed Python |

## Database Technologies - Production

### Relational
| Technology | Version | Notes |
|------------|---------|-------|
| **PostgreSQL** | 16+ | Production database |
| **MySQL** | 8.2+ | Alternative RDBMS |
| **CockroachDB** | 23.2+ | Distributed SQL |

### NoSQL
| Technology | Version | Notes |
|------------|---------|-------|
| **Redis** | 7.2+ | In-memory cache/store |
| **MongoDB** | 7.0+ | Document database |
| **Cassandra** | 4.1+ | Wide-column store |
| **ScyllaDB** | 5.4+ | High-performance Cassandra alternative |

### Vector Databases
| Technology | Version | Notes |
|------------|---------|-------|
| **Pinecone** | Latest | Managed vector DB |
| **Weaviate** | 1.23+ | Open-source vector DB |
| **Milvus** | 2.3+ | Vector similarity search |
| **Qdrant** | 1.7+ | Vector search engine |
| **ChromaDB** | 0.4+ | Embedding database |

## CI/CD

| Technology | Version | Notes |
|------------|---------|-------|
| **GitHub Actions** | Latest | CI/CD platform |
| **GitLab CI** | 16.7+ | Alternative CI/CD |
| **Jenkins** | 2.426+ | Traditional CI/CD |
| **Tekton** | 0.54+ | Kubernetes-native CI/CD |
| **Argo Workflows** | 3.5+ | Kubernetes workflows |

## Security & Secrets Management

| Technology | Version | Notes |
|------------|---------|-------|
| **HashiCorp Vault** | 1.15+ | Secrets management |
| **Sealed Secrets** | 0.24+ | Kubernetes secrets encryption |
| **External Secrets** | 0.9+ | Secrets sync to Kubernetes |
| **SOPS** | 3.8+ | Encrypted file management |
| **cert-manager** | 1.13+ | TLS certificate management |

## GPU & Accelerator Support

| Technology | Version | Notes |
|------------|---------|-------|
| **CUDA** | 12.2+ | NVIDIA GPU programming |
| **cuDNN** | 8.9+ | Deep learning primitives |
| **NCCL** | 2.19+ | Multi-GPU communication |
| **NVIDIA Driver** | 535+ | GPU driver |
| **ROCm** | 5.7+ | AMD GPU support |

### GPU Monitoring
| Technology | Version | Purpose |
|------------|---------|---------|
| **DCGM** | 3.3+ | NVIDIA datacenter GPU monitoring |
| **dcgm-exporter** | 3.3+ | Prometheus DCGM exporter |

## Performance & Cost Optimization

| Technology | Version | Purpose |
|------------|---------|---------|
| **Karpenter** | 0.32+ | Kubernetes autoscaling |
| **Cluster Autoscaler** | 1.28+ | Traditional K8s autoscaling |
| **KEDA** | 2.12+ | Event-driven autoscaling |
| **Kubecost** | 1.108+ | Cost monitoring |

## Service Discovery & Configuration

| Technology | Version | Notes |
|------------|---------|-------|
| **Consul** | 1.17+ | Service mesh & discovery |
| **etcd** | 3.5+ | Distributed key-value store |
| **CoreDNS** | 1.11+ | DNS server |

## Message Queues

| Technology | Version | Notes |
|------------|---------|-------|
| **RabbitMQ** | 3.12+ | Message broker |
| **NATS** | 2.10+ | Cloud-native messaging |
| **Pulsar** | 3.1+ | Distributed messaging |

## Testing & Quality

| Technology | Version | Purpose |
|------------|---------|---------|
| **pytest** | 7.4+ | Python testing |
| **locust** | 2.18+ | Load testing |
| **k6** | 0.48+ | Load testing |
| **Chaos Mesh** | 2.6+ | Chaos engineering |
| **Litmus** | 3.8+ | Chaos engineering |

## Python Packages - Advanced

### Distributed Computing
| Package | Version | Purpose |
|---------|---------|---------|
| **ray[default]** | 2.9+ | Distributed computing |
| **dask[complete]** | 2023.12+ | Parallel computing |
| **horovod** | 0.28+ | Distributed deep learning |

### Performance
| Package | Version | Purpose |
|---------|---------|---------|
| **numba** | 0.58+ | JIT compilation |
| **cython** | 3.0+ | C extensions for Python |
| **pyarrow** | 14.0+ | Apache Arrow for Python |

## Version Compatibility Matrix

### Kubernetes + CUDA + PyTorch
| Kubernetes | CUDA | PyTorch | Status |
|-----------|------|---------|--------|
| 1.28 | 12.2 | 2.1+ | ✅ Recommended |
| 1.28 | 12.1 | 2.1+ | ✅ Supported |
| 1.27 | 12.2 | 2.1+ | ⚠️  Maintenance only |

### Cloud Provider Kubernetes Versions
| Provider | Supported Versions | Recommended |
|----------|-------------------|-------------|
| AWS EKS | 1.26, 1.27, 1.28 | 1.28 |
| GCP GKE | 1.26, 1.27, 1.28, 1.29 | 1.28 |
| Azure AKS | 1.26, 1.27, 1.28 | 1.28 |

## Deprecated Technologies

| Technology | Deprecated Version | End of Support | Migration Path |
|------------|-------------------|----------------|----------------|
| Python | < 3.10 | Already EOL | Upgrade to 3.11+ |
| Kubernetes | < 1.26 | Dec 2024 | Upgrade to 1.28+ |
| TensorFlow | 1.x | EOL | Use TensorFlow 2.15+ |
| Docker Swarm | All | Consider deprecated | Migrate to Kubernetes |

## Installation Commands - Quick Reference

### MLOps Tools
```bash
# MLflow
pip install mlflow==2.9.2

# DVC
pip install dvc[all]==3.30.0

# Kubeflow Pipelines SDK
pip install kfp==2.5.0
```

### Kubernetes Tools
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

## Performance Benchmarks (Reference)

### LLM Inference Throughput (tokens/second)
| Model Size | CPU | T4 GPU | A10G | A100 |
|-----------|-----|---------|------|------|
| 7B params | ~1 | ~20 | ~50 | ~100 |
| 13B params | ~0.5 | ~10 | ~25 | ~50 |
| 70B params | N/A | N/A | ~5 | ~15 |

*Using vLLM with FP16, batch size 1*

## Support & Updates

- **Update Frequency**: Quarterly (January, April, July, October)
- **Security Patches**: As released
- **Breaking Changes**: 30-day advance notice minimum
- **Version Support**: Latest 2 major versions

## Production Readiness Checklist

Before deploying to production, ensure:

- [ ] Using LTS/stable versions (not bleeding edge)
- [ ] Security patches applied
- [ ] Compatibility tested in staging
- [ ] Monitoring configured
- [ ] Backup/disaster recovery tested
- [ ] Documentation updated
- [ ] Team trained on new versions

---

**Maintained by**: AI Infrastructure Engineering Team
**Contact**: See repository issues for version-specific questions
