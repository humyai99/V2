# Exercise 08: Production-Grade Model Serving

**Duration:** 4 hours
**Difficulty:** Beginner+
**Prerequisites:** Exercises 06 (FastAPI), 07 (cloud onboarding)

## Objective

Take the toy FastAPI model server from earlier exercises and harden it into a production-shape service: graceful startup/shutdown, request validation, observability, batching, async, structured errors, contract tests, and Dockerized deployment. The deliverable is a service you'd be comfortable handing off to ops.

## Why this matters

The gap between "FastAPI returns predictions" and "a service ops can run unattended" is the entire job. This exercise walks every brick you'd otherwise discover painfully via 2am pages.

## Requirements

Build `model-serve`, a FastAPI service that:

### Functional

1. **`POST /v1/predict`** — single-row prediction.
2. **`POST /v1/predict/batch`** — up to 128 rows in one call; per-row results returned in input order.
3. **`GET /v1/models`** — lists the currently-loaded model name and version.
4. **`POST /v1/admin/reload`** — reload model from disk; gated by an `X-Admin-Token` header.

### Non-functional

5. **Liveness** at `/health`; **readiness** at `/ready` (returns 503 until model is loaded).
6. **Prometheus** metrics at `/metrics`: request count, latency histogram, in-flight gauge, per-class prediction counter, model-version info gauge.
7. **Structured JSON logs** to stdout, including a `request_id` taken from the `X-Request-Id` header (auto-generated if absent).
8. **Graceful shutdown:** drain in-flight requests for up to 25 seconds before exit; refuse new requests after SIGTERM.
9. **Request validation** via Pydantic; predictable 422 on bad input with field-level errors.
10. **Sized request body limit** (1 MB default) returning 413.
11. **Rate limit** (60 req/min per IP) returning 429 with `Retry-After`.

### Operational

12. **Runs as non-root** in the container.
13. **Read-only root filesystem** in the container (writes only to `/tmp`).
14. **Healthcheck in Dockerfile** that probes `/health` every 15s.
15. **Image size < 400 MB**.

## Suggested structure

```
model-serve/
├── pyproject.toml
├── Dockerfile
├── docker-compose.yml          # api + prometheus
├── prometheus.yml
├── src/model_serve/
│   ├── __init__.py
│   ├── app.py                  # FastAPI factory
│   ├── config.py               # Settings via pydantic-settings
│   ├── lifespan.py             # startup/shutdown
│   ├── routes/
│   │   ├── predict.py
│   │   ├── admin.py
│   │   └── health.py
│   ├── middleware/
│   │   ├── request_id.py
│   │   ├── rate_limit.py       # slowapi or hand-rolled
│   │   └── body_size.py
│   ├── instrumentation/
│   │   └── prom.py
│   └── ml/
│       ├── loader.py
│       └── schemas.py          # Pydantic in/out
└── tests/
    ├── contract/               # API contract tests
    ├── unit/
    └── conftest.py             # spins up the app on a random port
```

## Step-by-step

### Step 1 — Project skeleton (15 min)
Initialize the project. Pin `fastapi`, `uvicorn[standard]`, `pydantic>=2`, `prometheus-fastapi-instrumentator`, `slowapi`, `python-json-logger`.

### Step 2 — Lifespan-managed model load (30 min)
```python
@asynccontextmanager
async def lifespan(app: FastAPI):
    model = await asyncio.to_thread(joblib.load, settings.MODEL_PATH)
    app.state.model = model
    app.state.model_version = settings.MODEL_VERSION
    yield
    # graceful drain handled by uvicorn's shutdown signal
```

### Step 3 — Request validation + batching (45 min)
- Single: `PredictRequest` with feature vector + validation bounds.
- Batch: `BatchRequest` with `items: list[PredictRequest]` and `len ≤ 128`.
- Return per-row latency in the response.

### Step 4 — Middleware (45 min)
- `request_id`: ensure `X-Request-Id` exists; store in request state and log context.
- `body_size`: 413 on payloads > 1 MB.
- `rate_limit`: `slowapi.Limiter` keyed by client IP; configurable via env.

### Step 5 — Observability (45 min)
- Custom metrics: `predictions_total{class}`, `predict_latency_seconds`, `inflight_requests`, `model_info{version}`.
- Configure Instrumentator to expose `/metrics` and the auto FastAPI request histograms.
- Structured logging: `python-json-logger` formatter; every log line includes `request_id`.

### Step 6 — Graceful shutdown (30 min)
- Set `--timeout-graceful-shutdown 25` on uvicorn.
- In `lifespan` shutdown, wait on the in-flight gauge to hit zero (with deadline).

### Step 7 — Dockerize (30 min)
Multi-stage build (per Module 103 lab 02 pattern). Non-root user, read-only FS, healthcheck.

### Step 8 — Contract tests (45 min)
```python
@pytest.fixture
def client(tmp_path, monkeypatch):
    # spawn the model artifact, override settings, create app
    ...

def test_predict_happy_path(client): ...
def test_predict_bad_input_returns_422_with_field_errors(client): ...
def test_batch_over_128_returns_400(client): ...
def test_rate_limit_returns_429_after_60_calls(client): ...
def test_metrics_endpoint_exposes_expected_metrics(client): ...
def test_health_always_200(client): ...
def test_ready_returns_503_until_lifespan_loads_model(client): ...
```

## Deliverables

1. Code that satisfies all 15 numbered requirements.
2. Contract test suite that exercises all of them.
3. Dockerfile and `docker-compose.yml` that brings up the service + a Prometheus instance scraping it.
4. A short `OPERATIONS.md` describing how an ops engineer would deploy, scale, troubleshoot, and rotate the model.

## Validation

- [ ] `docker compose up` brings up api + prometheus.
- [ ] `curl localhost:8000/health` → 200; `/ready` → 503 then 200 after warmup.
- [ ] `curl /v1/predict` with a valid body returns prediction + latency.
- [ ] Sending 65 requests in 60s from one IP yields a 429 with `Retry-After` header on the last few.
- [ ] Sending 130 batch items returns 400 with explanatory message.
- [ ] `curl /metrics` shows all 5 custom metrics with sensible values after load.
- [ ] Killing the container with SIGTERM during a 10s synthetic-latency request waits for it to complete before exit.
- [ ] `pytest tests/contract` is green.
- [ ] `docker image inspect` shows the image < 400 MB and user 1000.

## Stretch goals

- Add a **shadow deployment** mode: route 1% of traffic to a v2 model and log shadow predictions alongside primary for offline comparison.
- Add **A/B routing** via a header (`X-Variant: v2`).
- Implement a Kubernetes deployment + HPA + ServiceMonitor manifest, with the same contract tests run against the cluster.

## Common pitfalls

- **Loading the model inside the request handler** — kills first-request latency. Always load in `lifespan`.
- **`@app.middleware("http")` not async-safe** — Use BaseHTTPMiddleware classes; some libs interact badly.
- **Rate limit applied before the metrics endpoint** — protect `/metrics` from rate limiting or your scraper gets locked out.
- **Healthcheck same as readiness** — Liveness = "process is alive". Readiness = "I can serve traffic." Conflating them causes restart loops during transient downstream outages.
- **JSON logger swallows tracebacks** — Use `exc_info=True` and ensure your formatter handles `exc_text`.

## Solutions

Reference implementation in the engineer-solutions repo.
