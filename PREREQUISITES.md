# Prerequisites for AI Infrastructure Engineer Curriculum

This curriculum is designed for engineers looking to advance their AI infrastructure skills to a mid-level professional standard. Before starting, ensure you have the necessary foundation.

---

## 🎯 Quick Assessment

**Already completed the Junior AI Infrastructure Engineer curriculum?** ✅ You're ready to start!

**Haven't completed Junior curriculum?** → Use the self-assessment below to check your readiness.

---

## Option 1: Complete Junior Curriculum (RECOMMENDED)

The [**Junior AI Infrastructure Engineer**](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning) curriculum provides ALL prerequisites for this Engineer-level course.

### Direct Module Mapping

Every prerequisite for this Engineer curriculum is covered in the Junior curriculum:

| Engineer Prerequisite | Junior Module | Hours | What You'll Learn |
|-----------------------|---------------|-------|-------------------|
| **Python 3.9+ (intermediate level)** | [Module 001: Python Fundamentals](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-001-python-fundamentals) | 15h | OOP, type hints, testing, error handling, decorators, context managers |
| **Linux/Unix command line basics** | [Module 002: Linux Essentials](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-002-linux-essentials) | 15h | CLI navigation, bash scripting, processes, SSH, networking, system administration |
| **Git fundamentals** | [Module 003: Git & Version Control](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-003-git-version-control) | 10h | Branching, merging, rebasing, collaboration workflows, GitHub/GitLab |
| **Basic ML concepts** | [Module 004: ML Basics](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-004-ml-basics) | 20h | PyTorch, TensorFlow, training, inference, evaluation, model export |
| **Docker basics** | [Module 005: Docker & Containerization](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-005-docker-containers) | 15h | Docker images, containers, multi-stage builds, Docker Compose |
| **Kubernetes intro** | [Module 006: Kubernetes Introduction](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-006-kubernetes-intro) | 20h | Pods, deployments, services, ConfigMaps, Secrets, basic operations |
| **API development** | [Module 007: APIs & Web Services](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-007-apis-web-services) | 15h | REST APIs, FastAPI, Flask, authentication, testing |
| **Database basics** | [Module 008: Databases & SQL](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-008-databases-sql) | 15h | SQL fundamentals, PostgreSQL, Redis, data modeling |
| **Monitoring basics** | [Module 009: Monitoring & Logging](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-009-monitoring-basics) | 15h | Prometheus, Grafana, logging, alerting basics |
| **Cloud platforms** | [Module 010: Cloud Platforms](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-010-cloud-platforms) | 20h | AWS, GCP, Azure basics - VMs, storage, networking |

**Total Junior Curriculum**: 440 hours (22 weeks part-time, 11 weeks full-time)

### Why Complete Junior First?

1. **Comprehensive Coverage**: All prerequisites covered with hands-on practice
2. **Portfolio Building**: 5 projects for your resume
3. **Job-Ready Skills**: Qualifies you for entry-level AI infrastructure roles
4. **Smooth Transition**: Designed to prepare you specifically for this Engineer curriculum
5. **No Gaps**: Ensures you have ALL foundational knowledge

### Getting Started with Junior Curriculum

```bash
# Clone the Junior repository
git clone https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning.git
cd ai-infra-junior-engineer-learning

# Follow the getting started guide
cat GETTING_STARTED.md
```

---

## Option 2: Self-Assessment Checklist

If you haven't completed the Junior curriculum, verify you can perform ALL tasks below. Missing ANY skill? → Complete the relevant Junior module first.

### Python Skills ✅

**Required for**: All Engineer modules

- [ ] Write production-quality Python with OOP, type hints, and comprehensive docstrings
- [ ] Use async/await for concurrent programming
- [ ] Write comprehensive unit tests with pytest (80%+ coverage)
- [ ] Use virtual environments (venv, conda) and dependency management
- [ ] Understand and use decorators, context managers, generators
- [ ] Profile and optimize Python code for performance
- [ ] Handle errors gracefully with custom exceptions
- [ ] Use Python dataclasses and Pydantic for validation

**Test Yourself**:
```python
# Can you build a production-quality REST API with:
# - Type hints throughout
# - Async endpoints
# - Error handling
# - Comprehensive tests
# - Pydantic validation?
```

**Missing skills?** → [Junior Module 001](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-001-python-fundamentals)

---

### Linux/Unix Skills ✅

**Required for**: Cloud Computing, Containerization, Kubernetes, all deployment modules

- [ ] Navigate Linux CLI efficiently (cd, ls, grep, sed, awk, find)
- [ ] Write bash scripts for automation (loops, conditionals, functions)
- [ ] Manage processes (ps, top, htop, kill, systemctl)
- [ ] Understand file permissions and ownership (chmod, chown)
- [ ] Configure SSH keys and secure remote access
- [ ] Debug system issues using logs (/var/log, journalctl)
- [ ] Use package managers (apt, yum, brew)
- [ ] Understand environment variables and PATH

**Test Yourself**:
```bash
# Can you write a bash script that:
# - Monitors system resources
# - Logs to syslog
# - Handles errors gracefully
# - Runs as a systemd service?
```

**Missing skills?** → [Junior Module 002](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-002-linux-essentials)

---

### Git & Version Control Skills ✅

**Required for**: All modules (especially IaC, MLOps, CI/CD)

- [ ] Use Git workflows (feature branches, pull requests)
- [ ] Perform branching, merging, and rebasing confidently
- [ ] Resolve merge conflicts
- [ ] Understand Git internals (commits, trees, blobs, refs)
- [ ] Use GitHub/GitLab for collaboration and code review
- [ ] Follow conventional commits and semantic versioning
- [ ] Understand GitOps principles
- [ ] Use git hooks for automation

**Test Yourself**:
```bash
# Can you:
# - Set up a GitOps workflow with ArgoCD?
# - Implement pre-commit hooks?
# - Manage multiple release branches?
```

**Missing skills?** → [Junior Module 003](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-003-git-version-control)

---

### Machine Learning Skills ✅

**Required for**: All modules (foundation for all AI infrastructure work)

- [ ] Train basic models with PyTorch or TensorFlow
- [ ] Understand training, validation, and testing splits
- [ ] Perform model evaluation (accuracy, precision, recall, F1, AUC)
- [ ] Export and load trained models (checkpoint, ONNX)
- [ ] Understand overfitting, underfitting, and regularization
- [ ] Use data loaders and preprocessing pipelines
- [ ] Debug training issues (loss not decreasing, NaN values)
- [ ] Understand basic neural network architectures

**Test Yourself**:
```python
# Can you:
# - Train a CNN for image classification?
# - Implement custom loss functions?
# - Use transfer learning?
# - Export model for production serving?
```

**Missing skills?** → [Junior Module 004](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-004-ml-basics)

---

### Docker & Containerization Skills ✅

**Required for**: Containerization, Kubernetes, MLOps, all deployment modules

- [ ] Build Docker images with Dockerfiles
- [ ] Use multi-stage builds for optimization
- [ ] Run containers with volume mounts and port mapping
- [ ] Use Docker Compose for multi-service applications
- [ ] Understand container networking (bridge, host, overlay)
- [ ] Manage container resources (CPU, memory limits)
- [ ] Debug container issues (logs, exec, inspect)
- [ ] Understand container security basics (user namespaces, read-only filesystems)

**Test Yourself**:
```bash
# Can you:
# - Build optimized ML serving container (<500MB)?
# - Set up multi-container app with Docker Compose?
# - Implement health checks and auto-restart?
```

**Missing skills?** → [Junior Module 005](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-005-docker-containers)

---

### Kubernetes Skills ✅

**Required for**: Kubernetes, MLOps, Monitoring modules

- [ ] Deploy applications to Kubernetes
- [ ] Understand pods, deployments, services, ingress
- [ ] Use ConfigMaps and Secrets for configuration
- [ ] Debug pod issues (logs, describe, exec, port-forward)
- [ ] Understand basic resource management (requests, limits)
- [ ] Use kubectl effectively
- [ ] Understand Kubernetes networking basics
- [ ] Deploy multi-tier applications

**Test Yourself**:
```bash
# Can you:
# - Deploy ML model API to Kubernetes?
# - Set up horizontal pod autoscaling?
# - Configure ingress for external access?
# - Debug pod startup failures?
```

**Missing skills?** → [Junior Module 006](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-006-kubernetes-intro)

---

### API Development Skills ✅

**Required for**: Foundations, MLOps, LLM Infrastructure modules

- [ ] Build REST APIs with FastAPI or Flask
- [ ] Implement authentication and authorization
- [ ] Write API tests (unit and integration)
- [ ] Generate OpenAPI/Swagger documentation
- [ ] Implement rate limiting and caching
- [ ] Handle errors and validation properly
- [ ] Use async endpoints for high concurrency
- [ ] Deploy APIs to production

**Test Yourself**:
```python
# Can you build an API that:
# - Serves ML model predictions?
# - Has authentication (JWT)?
# - Includes comprehensive tests?
# - Has auto-generated docs?
```

**Missing skills?** → [Junior Module 007](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-007-apis-web-services)

---

### Database Skills ✅

**Required for**: Data Pipelines, MLOps modules

- [ ] Write complex SQL queries (joins, aggregations, subqueries)
- [ ] Design normalized database schemas
- [ ] Use PostgreSQL or MySQL for production
- [ ] Understand indexing and query optimization
- [ ] Use Redis for caching
- [ ] Perform database migrations
- [ ] Implement connection pooling
- [ ] Understand ACID properties and transactions

**Test Yourself**:
```sql
-- Can you:
-- - Design schema for ML experiment tracking?
-- - Optimize slow queries?
-- - Implement caching strategy?
```

**Missing skills?** → [Junior Module 008](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-008-databases-sql)

---

### Monitoring & Logging Skills ✅

**Required for**: Monitoring & Observability module

- [ ] Set up Prometheus for metrics collection
- [ ] Create Grafana dashboards
- [ ] Implement application logging (structured logs)
- [ ] Configure alerts based on metrics
- [ ] Understand metrics types (counter, gauge, histogram)
- [ ] Debug issues using logs and metrics
- [ ] Implement log aggregation
- [ ] Understand basic observability concepts

**Test Yourself**:
```bash
# Can you:
# - Set up Prometheus + Grafana for ML API?
# - Create custom metrics for model performance?
# - Configure alerts for service downtime?
```

**Missing skills?** → [Junior Module 009](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-009-monitoring-basics)

---

### Cloud Platform Skills ✅

**Required for**: Cloud Computing, all deployment modules

- [ ] Deploy VMs and storage on AWS/GCP/Azure
- [ ] Use cloud CLI tools (aws-cli, gcloud, az)
- [ ] Understand cloud networking (VPCs, subnets, security groups)
- [ ] Deploy containerized applications to cloud
- [ ] Monitor cloud resources and costs
- [ ] Use managed services (RDS, Cloud SQL, S3, GCS)
- [ ] Implement basic IAM (users, roles, policies)
- [ ] Understand cloud pricing models

**Test Yourself**:
```bash
# Can you:
# - Deploy Kubernetes cluster to cloud?
# - Set up VPC with public/private subnets?
# - Implement cost monitoring and alerts?
```

**Missing skills?** → [Junior Module 010](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning/tree/main/lessons/mod-010-cloud-platforms)

---

## Option 3: Alternative Pathways

### If You Have Industry Experience

Engineers with **1-2 years** of experience in related fields may be able to skip some Junior modules:

#### DevOps/SRE Background
**Can likely skip**: Junior Modules 002, 003, 005 (Linux, Git, Docker)
**Should review**: Modules 004, 006, 009 (ML Basics, Kubernetes, Monitoring)
**Must complete**: Modules 001, 007, 008 (Python for ML, APIs, Databases)

#### Backend Development Background
**Can likely skip**: Junior Modules 001, 003, 007, 008 (Python, Git, APIs, Databases)
**Should review**: Modules 005, 006, 009 (Docker, Kubernetes, Monitoring)
**Must complete**: Modules 002, 004 (Linux, ML Basics)

#### Data Engineering Background
**Can likely skip**: Junior Modules 001, 008, 009 (Python, Databases, Monitoring)
**Should review**: Modules 002, 003, 005 (Linux, Git, Docker)
**Must complete**: Modules 004, 006 (ML Basics, Kubernetes)

#### ML/Data Science Background
**Can likely skip**: Junior Module 004 (ML Basics)
**Should review**: Modules 001, 007 (Python for infrastructure, APIs)
**Must complete**: Modules 002, 003, 005, 006, 009 (Linux, Git, Docker, Kubernetes, Monitoring)

**Recommendation**: Even with experience, review ALL Junior modules to ensure no gaps. The Junior curriculum focuses on AI/ML infrastructure specifically, which may differ from general software engineering.

---

## Recommended Study Plans

### Plan A: Fast Track (Have Most Prerequisites)
**Duration**: 4-6 weeks

**Week 1**: Self-assess using checklists above
**Week 2**: Complete any missing Junior modules
**Week 3**: Review Junior projects for hands-on practice
**Week 4**: Quick refresher on weak areas
**Week 5-6**: Begin Engineer Module 101 (Foundations)

**Best for**: Engineers with 1-2 years DevOps/ML experience

---

### Plan B: Standard Track (Complete Junior First)
**Duration**: 22-24 weeks

**Weeks 1-22**: Complete entire Junior curriculum (440 hours)
**Week 23**: Build capstone project and polish portfolio
**Week 24**: Begin Engineer Module 101 (Foundations)

**Best for**: Career changers, bootcamp grads, recent CS graduates

---

### Plan C: Part-Time Track (Working Professionals)
**Duration**: 44-48 weeks

**Weeks 1-44**: Complete Junior curriculum part-time (10 hours/week)
**Weeks 45-47**: Build capstone project
**Week 48**: Begin Engineer curriculum

**Best for**: Working professionals learning in evenings/weekends

---

## Automated Skill Assessment

### Run the Self-Assessment Tool

```bash
# Clone Junior repository
git clone https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning.git
cd ai-infra-junior-engineer-learning

# Run automated skill assessment
python scripts/assess_skills.py

# Output will show:
# - Current skill levels for each area
# - Recommended modules to complete
# - Estimated time to readiness
```

The assessment tool checks:
- Python coding ability (via coding challenges)
- Linux/Git knowledge (via command simulations)
- Docker/Kubernetes hands-on (via practical tasks)
- ML fundamentals (via conceptual questions)
- Cloud platform familiarity (via scenario questions)

**Passing score**: 70%+ in all areas
**Recommended**: 85%+ for smooth transition to Engineer curriculum

---

## Getting Help

### If You're Unsure About Your Readiness

**Option 1**: Post in [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
- Share your background and experience
- Get personalized recommendations from community

**Option 2**: Join our [Discord Server](https://discord.gg/ai-infra-curriculum)
- Ask questions in #prerequisites channel
- Get feedback from instructors and peers

**Option 3**: Schedule Office Hours
- Weekly Q&A sessions (Fridays 3-4pm PT)
- 1-on-1 prerequisite consultations (by appointment)

**Option 4**: Review Junior Curriculum Structure
- Browse the [Junior course structure](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning)
- Try the first exercise of each module
- If you can complete them easily, you may be ready

---

## Success Metrics: Are You Ready?

You're ready for the Engineer curriculum when you can confidently:

### Technical Capabilities
- [ ] Deploy a complete ML application (API + Docker + K8s + monitoring) from scratch
- [ ] Debug production issues in distributed systems
- [ ] Write infrastructure automation scripts (Python + Bash)
- [ ] Explain ML model serving architecture and trade-offs
- [ ] Navigate and troubleshoot cloud environments
- [ ] Understand and optimize cloud costs
- [ ] Implement CI/CD pipelines for ML applications
- [ ] Monitor and alert on system and model performance

### Assessment Scores
- [ ] Pass Junior curriculum assessments with 80%+ average
- [ ] Complete at least 2 Junior projects with "Excellent" grade
- [ ] Demonstrate proficiency in self-assessment checklist
- [ ] Build a portfolio project demonstrating all prerequisite skills

### Time Investment Ready
- [ ] Can commit 40+ hours/week (full-time) or 20+ hours/week (part-time)
- [ ] Have 6+ months available for dedicated learning
- [ ] Can access cloud accounts (AWS/GCP/Azure free tiers)
- [ ] Have suitable hardware (8GB+ RAM, decent CPU, GPU optional)

---

## What Happens If You Start Without Prerequisites?

**Scenario 1**: Missing Python/Linux/Git basics
❌ **Result**: Will struggle in Module 101, unable to complete exercises
✅ **Fix**: Complete Junior Modules 001-003 first (40 hours)

**Scenario 2**: Missing ML fundamentals
❌ **Result**: Won't understand ML infrastructure trade-offs
✅ **Fix**: Complete Junior Module 004 (20 hours)

**Scenario 3**: Missing Docker/Kubernetes
❌ **Result**: Can't complete containerization and orchestration modules
✅ **Fix**: Complete Junior Modules 005-006 (35 hours)

**Scenario 4**: Missing monitoring/cloud basics
❌ **Result**: Struggle with observability and deployment modules
✅ **Fix**: Complete Junior Modules 009-010 (35 hours)

**Bottom line**: Starting without prerequisites will significantly slow your progress and reduce learning effectiveness. We strongly recommend completing the Junior curriculum or validating all prerequisite skills first.

---

## Prerequisites Timeline Summary

| Starting Point | Time to Ready | Recommended Path |
|---------------|---------------|------------------|
| **Complete beginner** | 22-44 weeks | Complete full Junior curriculum |
| **Some coding experience** | 16-22 weeks | Complete Junior, skip familiar modules |
| **1-2 years DevOps/Backend** | 8-12 weeks | Self-assess, fill gaps, review modules |
| **1-2 years ML Engineering** | 6-10 weeks | Focus on infrastructure modules (002, 005, 006, 009) |
| **Current Junior grad** | 0 weeks | Start immediately! ✅ |

---

## Ready to Begin?

### ✅ If You Have All Prerequisites

**Congratulations!** You're ready to start the Engineer curriculum.

**Next steps**:
1. Read the [Getting Started Guide](./GETTING_STARTED.md)
2. Set up your development environment
3. Begin [Module 101: Foundations](./lessons/mod-101-foundations/README.md)

### ⚠️ If You're Missing Prerequisites

**Don't worry!** The Junior curriculum is designed to get you ready.

**Next steps**:
1. Visit the [Junior AI Infrastructure Engineer](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning) repository
2. Complete relevant modules (or all modules for comprehensive preparation)
3. Build your portfolio with Junior projects
4. Return here when ready

---

## Questions?

**Can I start the Engineer curriculum while completing Junior prerequisites?**
Not recommended. You'll be more successful completing prerequisites first.

**How long does the Junior curriculum take?**
- Full-time: 11 weeks (40 hours/week)
- Part-time: 22 weeks (20 hours/week)
- Working professionals: 44 weeks (10 hours/week)

**Do I need to complete ALL Junior modules?**
If you can pass the self-assessment with 80%+ in all areas, you can skip modules. But we recommend completing all for comprehensive preparation.

**Can I get credit for industry experience?**
The self-assessment checklist allows you to validate skills from any source. If you can demonstrate proficiency, prerequisites are met regardless of where you learned them.

**What if I fail the self-assessment?**
Complete the relevant Junior modules, then retake the assessment. There's no penalty for retaking.

---

**Start Your Journey Today:**

👉 **[Junior AI Infrastructure Engineer Learning Path](https://github.com/ai-infra-curriculum/ai-infra-junior-engineer-learning)**

👉 **[Engineer Curriculum Getting Started](./GETTING_STARTED.md)** (if prerequisites complete)

---

*Last Updated: October 2025*
*Maintained by: AI Infrastructure Curriculum Team*
