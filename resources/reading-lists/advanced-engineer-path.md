# Reading List — Advanced Engineer Path

You finished the AI Infrastructure Engineer curriculum. You can stand up a production ML platform end-to-end: Kubernetes for serving, MLflow for tracking, Terraform for provisioning, Prometheus/Grafana for observability, and an LLM stack with RAG. The next 9–18 months take you from "can build it" to "can run it at scale and debug the gnarly parts."

This list is opinionated and curated. Read fewer things deeply, with code, rather than skimming everything.

## Track 1 — Production ML Platforms at Scale

### Books

- *Designing Machine Learning Systems* — Chip Huyen. The reference text for thinking about end-to-end ML in production.
- *Machine Learning Engineering* — Andriy Burkov. Tighter, more "checklist" oriented.
- *Reliable Machine Learning* — Pineau et al. Operations focus: reproducibility, monitoring, incident response.

### Papers

- "Hidden Technical Debt in Machine Learning Systems" — Sculley et al. (NeurIPS 2015). Required.
- "The ML Test Score: A Rubric for ML Production Readiness" — Breck et al. (Google).
- "TFX: A TensorFlow-Based Production-Scale Machine Learning Platform" — Baylor et al. (KDD 2017).
- Uber's *Michelangelo* and Meta's *Looper* engineering blog series.
- "Continuous Delivery for Machine Learning" — Sato, Wider, Windheuser (martinfowler.com).

### Build

- Add **shadow deployment + automated A/B + auto-rollback on metric regression** to one of the curriculum projects. Write up what broke.
- Implement a **multi-tenant feature store** that supports both online (Redis-backed) and offline (Parquet-backed) lookups with a consistent API.

---

## Track 2 — LLM Infrastructure Mastery

Beyond what Module 110 covers.

### Papers (read in order)

- *Attention Is All You Need* — Vaswani et al.
- *Efficient Memory Management for Large Language Model Serving with PagedAttention* — Kwon et al. (vLLM paper).
- *FlashAttention* and *FlashAttention-2* — Tri Dao.
- *DeepSpeed-Inference* — Aminabadi et al.
- *Sparrow / Constitutional AI / RLHF papers* if you'll be operating safety pipelines.

### Topics to master

- KV-cache management, paged attention, continuous batching
- Speculative decoding, lookahead decoding
- LoRA / QLoRA / DoRA for fine-tuning
- Quantization (int8, int4, FP8, AWQ, GPTQ) — what each costs, what each gives back
- Multi-LoRA serving at scale
- Production guardrails: prompt-injection defense, output filtering, schema-constrained generation
- Embedding pipelines, hybrid retrieval, re-ranking

### Build

- Take a 7-13B parameter model and serve it three ways: HuggingFace transformers, vLLM, TensorRT-LLM. Measure latency, throughput, $/M tokens. Identify the cliffs.
- Build a production-grade **RAG application end-to-end** with hybrid search (BM25 + dense), re-ranker, citation grounding, and quality monitoring.

---

## Track 3 — Distributed Systems Depth

ML platforms are distributed systems with ML on top.

### Books

- *Designing Data-Intensive Applications* — Martin Kleppmann. Read replication, partitioning, consistency, stream processing chapters.
- *Database Internals* — Alex Petrov.

### Papers (canonical)

- *MapReduce* (Dean & Ghemawat, 2004)
- *Bigtable* (Chang et al., 2006)
- *Dynamo* (DeCandia et al., 2007)
- *Spanner* (Corbett et al., 2012) and the follow-up *Spanner: Becoming a SQL System*
- *Kafka: a Distributed Messaging System for Log Processing* (Kreps et al., 2011)
- *The Dataflow Model* (Akidau et al.)

### Build

- Implement Raft or Paxos in a language you know. Toy version is fine; then read someone else's production implementation.

---

## Track 4 — Kubernetes & Operators Deep Dive

Module 104 covers the basics; advanced means building operators and understanding the API machinery.

### Books

- *Kubernetes in Action* — Marko Lukša (2nd ed.).
- *Programming Kubernetes* — Hausenblas & Schimanski.
- *Kubernetes Patterns* — Ibryam & Huß.

### Build

- A real **operator** with kubebuilder or Operator SDK. A `ModelDeployment` CRD reconciling to Deployment + Service + HPA + ServiceMonitor + Istio VirtualService is a great starter.
- Walk the source for one specific subsystem (kube-scheduler's NodeAffinity scoring, kubelet's volume mount lifecycle, kube-apiserver's admission chain). Don't read all of it.

---

## Track 5 — Performance Engineering for AI Workloads

### Books

- *Systems Performance* — Brendan Gregg (2nd ed.). Required.
- *BPF Performance Tools* — Brendan Gregg.
- *Computer Systems: A Programmer's Perspective* — Bryant & O'Hallaron, for cache + memory hierarchy basics.

### GPU-specific

- NVIDIA's *CUDA C++ Programming Guide* — chapters on memory hierarchy and async execution.
- *PMPP — Programming Massively Parallel Processors* — Hwu, Kirk, El Hajj (4th ed.).
- NVIDIA Tensor Core programming model (mma instructions).

### Build

- Profile a real model serving endpoint end-to-end. Find the bottleneck (CPU? GPU memory bandwidth? GC? deserialization?). Eliminate it. Document with flame graphs.

---

## Track 6 — Observability & SRE

### Books

- *Site Reliability Engineering* (Google SRE book). Full read.
- *The Site Reliability Workbook* (Google).
- *Observability Engineering* — Majors, Fong-Jones, Miranda.
- *Seeking SRE* — David Blank-Edelman (ed.).

### Topics

- SLI/SLO/SLA design for ML services (accuracy, latency, freshness)
- Burn-rate alerts vs. threshold alerts
- Distributed tracing for inference pipelines
- ML-specific drift and quality monitoring (Evidently, Arize, WhyLabs)

### Build

- Instrument a real service with **OpenTelemetry** end-to-end — metrics, logs, traces. Visualize the same request across all three.
- Define real SLOs for a real service. Compute error budget. Build a burn-rate alert.

---

## Track 7 — Security for ML Systems

Underrated. Hiring teams ask about it more every year.

### Books

- *Building Secure and Reliable Systems* — Google SRE/Security.
- *Threat Modeling: Designing for Security* — Adam Shostack.

### Topics

- Threat modeling an ML serving stack (data exfiltration, model theft, adversarial inputs)
- Supply-chain attacks on ML pipelines (poisoned datasets, compromised model artifacts)
- mTLS everywhere — Istio or Linkerd
- Prompt injection, jailbreaks, output filtering for LLM-backed services
- Differential privacy basics

### Build

- Add Trivy + Grype scans to your CI. Sign images with cosign. Set up Kyverno or OPA to enforce signed-image-only policies. Threat-model the same system end-to-end.

---

## Track 8 — Cost Engineering

Where senior engineers earn their seat at the table.

### Topics

- Reserved instances vs. spot vs. on-demand decision modeling
- GPU rightsizing and pre-emption strategies
- Cost-per-1k-predictions as a primary metric
- Egress, NAT, and S3 request cost shapes
- Multi-tenant cost allocation

### Build

- For one curriculum project, produce a **cost-per-1k-predictions** dashboard with breakdowns by workload, instance type, and storage tier. Identify the top 3 levers and quantify their impact.

---

## How to Use This List

- **Pick 3 tracks max** for the next 9–12 months.
- **Build one substantial project per track.** Solo reading without practice fades fast.
- **Write public.** Blog posts, conference talks, or RFCs expose holes in your understanding faster than anything else.
- **Find a partner.** Explaining DDIA Chapter 5 to someone else is how you actually learn it.

Next: [Staff Engineer Path](staff-engineer-path.md) once you've completed 3+ tracks with build projects.
