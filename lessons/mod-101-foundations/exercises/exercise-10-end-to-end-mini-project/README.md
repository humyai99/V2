# Exercise 10: End-to-End Mini-Project (Capstone for Module 101)

**Duration:** 6 hours
**Difficulty:** Beginner+
**Prerequisites:** All previous exercises in Module 101

## Objective

Integrate everything from exercises 01-09 into one cohesive mini-platform:
1. A scripted **cloud bootstrap** (from ex-07) brings up your sandbox environment.
2. A **production-shape model API** (from ex-08) runs locally in Docker.
3. Its **test suite** (from ex-09) gates a CI workflow.
4. The image is **pushed** to your cloud artifact registry.
5. A **kind cluster** runs the same image with a Service + HPA.
6. **Prometheus + Grafana** scrape and dashboard the deployment.
7. A **simple load test** exercises it end-to-end.

The deliverable is a single repository with a `make up` that produces all of the above and a `make down` that cleans it up. This is the "I can ship a service" merit badge for Module 101.

## Why this matters

Each prior exercise produced a piece. This exercise is the assembly. Engineers who can hold the full stack in their head — from cloud account to running pod with a working dashboard — solve problems 3× faster than those who only know one slice.

## Requirements

### Repo layout

```
mini-platform/
├── README.md                   # this overview, with the demo flow
├── Makefile                    # the orchestration entry point
├── infra/
│   ├── onboard.sh              # wraps `cloud-onboard init`
│   └── kind-config.yaml
├── app/                        # from exercise 08
│   ├── src/model_serve/
│   ├── tests/
│   ├── Dockerfile
│   └── docker-compose.yml
├── deploy/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── hpa.yaml
│   └── servicemonitor.yaml
├── monitoring/
│   ├── values.yaml             # kube-prometheus-stack overrides
│   └── grafana-dashboard.json
└── loadtest/
    ├── locustfile.py
    └── README.md
```

### Make targets

```text
make help          # print available targets
make up            # full bring-up: cluster, prom stack, app, port-forwards
make test          # run app tests (pytest)
make image         # build + push image to your cloud registry
make load          # run locust against the deployed service
make dashboard     # open grafana
make down          # destroy everything (cluster, cloud sandbox, local images)
```

### `make up` must produce, in order:

1. A running kind cluster.
2. NGINX Ingress controller installed in the cluster.
3. kube-prometheus-stack installed.
4. Your model API deployed with 2 replicas + HPA + ServiceMonitor.
5. Port-forwards: app on :8080, Grafana on :3000, Prometheus on :9090.
6. A final printed summary with all URLs.

End-to-end target: **< 5 minutes from `make up` to a usable demo**.

## Step-by-step

### Step 1 — Orchestrate the assembly (45 min)
Write the Makefile with proper dependencies (`make up` depends on `make image`).
Use `set -euo pipefail` in any embedded shell.

### Step 2 — Cloud bootstrap integration (30 min)
Wrap your `cloud-onboard` CLI from ex-07. Add a `Makefile` target that runs it and sources the resulting `.env`.

### Step 3 — App test gating (15 min)
`make image` must depend on `make test`. Pushing untested code is a process bug.

### Step 4 — Cluster + ingress (45 min)
Use kind with extra port mappings (per mod-101 lab 03). Install NGINX Ingress:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/kind/deploy.yaml
kubectl wait --for=condition=ready pod -l app.kubernetes.io/component=controller -n ingress-nginx --timeout=2m
```

### Step 5 — App deployment (45 min)
Manifests as listed. Use the image tag from `git rev-parse --short HEAD` so each `make image` produces a unique tag.

### Step 6 — Observability (60 min)
Install kube-prometheus-stack via Helm (per mod-101 lab 05). Apply a ServiceMonitor for your app. Import a Grafana dashboard JSON (write your own or adapt the one from mod-101 lab 05).

### Step 7 — Load test (30 min)
Locustfile that exercises `/v1/predict` and `/v1/predict/batch` at controllable load. Print throughput and latency percentiles to the terminal.

### Step 8 — Demo flow (30 min)
Write the demo script in your README:
```text
1. make up                 # 4 min
2. open http://localhost:3000   # grafana dashboard
3. make load               # 30s of load
4. observe HPA scaling pods
5. make down               # 1 min
```

### Step 9 — Polish (45 min)
- `make help` lists targets with descriptions.
- Idempotent — re-running `make up` doesn't break things.
- Failures emit clear error messages with the next command to try.
- README has a screenshot of the Grafana dashboard with load applied.

## Deliverables

1. Single repo at the above layout, runnable on a fresh laptop after a 5-minute setup (Docker, kind, kubectl, helm, python3).
2. README.md with the demo flow + 3-5 screenshots.
3. CI workflow that runs `make test` on every PR.
4. A `RUNBOOK.md` covering: how to recover from common failures (cluster won't start, image pull fails, HPA not scaling).

## Validation

- [ ] On a fresh checkout, `make up` succeeds within 6 minutes (allowing 1 min slack vs target).
- [ ] After `make up`, `curl http://localhost:8080/v1/predict ...` returns a valid prediction.
- [ ] `make load` drives ≥ 200 req/s; Grafana shows the spike + HPA scales pods from 2 to ≥ 4.
- [ ] `make down` leaves no orphan resources (`docker ps -a`, `kubectl get all`, cloud account all clean).
- [ ] CI runs `make test` on PR.
- [ ] README screenshots are real (capture them during your own validation pass).

## Stretch goals

- **Replace kind with a real cloud cluster** (EKS / GKE / AKS) provisioned via Terraform.
- **Add a feature store** (Redis cache populated by a separate process) and demonstrate p95 latency improvement.
- **Add canary deployment** with Argo Rollouts (mod-106 lab 05) — `make canary` rolls a v2 image with auto-rollback on metric regression.
- **Add a synthetic correctness monitor** that hits `/v1/predict` every minute with a known input and alerts if the response changes unexpectedly (drift canary).

## Common pitfalls

- **Image not visible in kind** — Forgot `kind load docker-image`. Add to `make up` after `make image`.
- **HPA never scales** — metrics-server not installed, or resource requests missing on the Deployment.
- **`make down` doesn't destroy cloud resources** — Mistakes here cost real money. Always call `cloud-onboard destroy` and `terraform destroy`.
- **5-minute target slips** — kube-prometheus-stack is the slowest step. Pre-pull the images: `docker pull` them on the host, then `kind load` after cluster creation.
- **Demo works once, breaks the second time** — State left in cloud account from prior runs. Test the full `make down` → `make up` loop at least 3 times.

## Solutions

Reference implementation in the engineer-solutions repo. **Build this yourself before looking** — the integration work is the lesson.

---

## Where this fits

Completing exercise 10 means you've demonstrated, end-to-end, the core skills the rest of the curriculum builds on. Modules 102-110 add depth (cloud-native primitives, MLOps, GPU, monitoring, IaC, LLM-specific patterns). The capstone projects (Projects 101-103) take this to production scale.
