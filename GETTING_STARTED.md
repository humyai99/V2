# Getting Started - AI Infrastructure Engineer Learning Path

Welcome! This guide will help you set up your environment and begin your journey to becoming an AI Infrastructure Engineer.

## Table of Contents

- [Prerequisites Check](#prerequisites-check)
- [Environment Setup](#environment-setup)
- [Cloud Account Setup](#cloud-account-setup)
- [Tools Installation](#tools-installation)
- [Verify Installation](#verify-installation)
- [Your First Lesson](#your-first-lesson)
- [Learning Tips](#learning-tips)
- [Troubleshooting](#troubleshooting)

---

## Prerequisites Check

Before you begin, ensure you have:

### Required Skills

- **Python**: Intermediate level (functions, classes, basic error handling)
  - Test yourself: Can you write a class with methods?
  - Test yourself: Do you understand decorators and context managers?
- **Linux/Unix**: Basic command line navigation
  - Test yourself: Can you navigate directories, create files, and use grep?
- **Git**: Basic version control
  - Test yourself: Can you clone, commit, push, and create branches?
- **Machine Learning**: Fundamental concepts
  - Test yourself: Do you understand training, inference, and model evaluation?

### Recommended Skills

- Cloud platform awareness (AWS/GCP/Azure basics)
- Docker basics (container concepts)
- Networking fundamentals (HTTP, DNS, load balancing)
- SQL basics

### Hardware Requirements

- **Minimum**: 8GB RAM, 20GB free disk space
- **Recommended**: 16GB RAM, 50GB free disk space, GPU (for local experiments)
- **Internet**: Stable connection for cloud services

---

## Environment Setup

### 1. Install Python 3.11+

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
Download from [python.org](https://www.python.org/downloads/) and install.

### 2. Clone the Repository

```bash
# Clone this repository
git clone https://github.com/ai-infra-curriculum/ai-infra-engineer-learning.git
cd ai-infra-engineer-learning

# Verify you're in the right directory
ls -la
# You should see: lessons/, projects/, README.md, etc.
```

### 3. Create Virtual Environment

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

### 4. Install Dependencies

```bash
# Upgrade pip
pip install --upgrade pip

# Install core requirements
pip install -r requirements.txt

# Verify installations
pip list
```

**Expected packages:**
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

## Cloud Account Setup

You'll need at least ONE cloud provider account (all three recommended for Module 02).

### AWS Free Tier

1. Go to [aws.amazon.com](https://aws.amazon.com/free/)
2. Click "Create a Free Account"
3. Complete registration (requires credit card but won't charge within free tier)
4. **Free tier includes:**
   - 750 hours/month of t2.micro or t3.micro EC2 instances (12 months)
   - 5GB S3 storage
   - 750 hours RDS (12 months)

**Install AWS CLI:**
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

1. Go to [cloud.google.com/free](https://cloud.google.com/free)
2. Click "Get started for free"
3. Complete registration
4. **Credits:**
   - $300 credit for 90 days
   - Always-free tier after credits expire

**Install gcloud CLI:**
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

1. Go to [azure.microsoft.com/free](https://azure.microsoft.com/free)
2. Click "Start free"
3. Complete registration
4. **Credits:**
   - $200 credit for 30 days
   - 12 months of free services

**Install Azure CLI:**
```bash
# Linux/macOS
curl -L https://aka.ms/InstallAzureCli | bash

# Verify
az --version

# Login
az login
```

---

## Tools Installation

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
Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### 2. Kubernetes (kubectl)

```bash
# Linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verify
kubectl version --client
```

### 3. Minikube (Local Kubernetes)

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

### 5. Git (if not installed)

```bash
# Linux
sudo apt install git

# Configure
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## Verify Installation

Run this verification script to check all installations:

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

**Expected output:**
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

## Your First Lesson

Now that your environment is set up, start with Module 01!

```bash
# Navigate to Module 01
cd lessons/mod-101-foundations

# Read the module overview
cat README.md

# Start with Lesson 01
cd 01-introduction
cat README.md
```

### Recommended Learning Path

1. **Week 1-2**: Module 01, Lessons 01-04 (Foundations)
2. **Week 3-4**: Module 01, Lessons 05-08 (Docker, APIs)
3. **Week 5-6**: Project 01 (Basic Model Serving)
4. **Week 7-10**: Module 02 (Cloud Computing)
5. **Week 11+**: Continue with Module 03+

### Study Schedule Options

**Full-Time (40 hours/week):**
- Complete in ~12-15 weeks

**Part-Time (10 hours/week):**
- Complete in ~50-60 weeks (~1 year)

**Weekend Warrior (20 hours/week):**
- Complete in ~25-30 weeks (~6-7 months)

---

## Learning Tips

### 1. Hands-On Practice

- **Don't just read**: Type out all code examples
- **Experiment**: Modify code, break things, fix them
- **Document**: Keep notes on what you learn

### 2. Project-Based Learning

- Complete all exercises in each lesson
- Build the projects from scratch (don't skip!)
- Extend projects with your own features

### 3. Cloud Budget Management

- **Set up billing alerts** in all cloud consoles (recommended: $10, $25, $50)
- **Use free tier resources** whenever possible
- **Shut down resources** after practice sessions
- **Use spot/preemptible instances** for cost savings

### 4. Community Engagement

- Join the [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
- Share your projects and solutions
- Help other learners

### 5. Track Your Progress

Use the progress tracker:

```bash
# Copy the progress template
cp progress/checklist.md progress/my-progress.md

# Update as you complete lessons
```

---

## Troubleshooting

### Common Issues

#### Issue: `python3.11: command not found`

**Solution:**
```bash
# Linux: Install Python 3.11
sudo apt install python3.11

# macOS: Use Homebrew
brew install python@3.11
```

#### Issue: `docker: permission denied`

**Solution:**
```bash
# Add user to docker group
sudo usermod -aG docker $USER
newgrp docker

# Or run with sudo (not recommended)
sudo docker run hello-world
```

#### Issue: `pip install` fails with SSL errors

**Solution:**
```bash
# Update pip and certificates
pip install --upgrade pip certifi

# Or use HTTP (less secure)
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org <package>
```

#### Issue: Out of disk space

**Solution:**
```bash
# Clean Docker images
docker system prune -a

# Clean pip cache
pip cache purge

# Clean conda cache (if using conda)
conda clean --all
```

#### Issue: Cloud CLI authentication fails

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

### Getting Help

1. **Check the FAQ**: [resources/faq.md](./resources/faq.md)
2. **Search Issues**: [GitHub Issues](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/issues)
3. **Ask in Discussions**: [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
4. **Create an Issue**: For bugs or unclear instructions

---

## Next Steps

You're ready to begin! Here's your action plan:

- [ ] Verify all tools are installed (run `verify_setup.sh`)
- [ ] Set up at least one cloud account
- [ ] Configure billing alerts
- [ ] Start Module 01, Lesson 01
- [ ] Join the GitHub Discussions community
- [ ] Star this repository to stay updated

---

## Quick Reference

### Essential Commands

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

### Resource Limits (Free Tier)

| Provider | Compute | Storage | Duration |
|----------|---------|---------|----------|
| AWS | 750h t2.micro | 5GB S3 | 12 months |
| GCP | $300 credit | Included | 90 days |
| Azure | $200 credit | Included | 30 days |

---

**Ready to start your AI Infrastructure Engineering journey?**

```bash
cd lessons/mod-101-foundations/01-introduction
cat README.md
```

Happy Learning! 🚀
