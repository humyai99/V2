# Exercise 09: API Integration & Contract Testing

**Duration:** 3 hours
**Difficulty:** Beginner+
**Prerequisites:** Exercises 06, 08 complete

## Objective

Build a layered test suite for the model-serve API from exercise 08: unit tests (pure functions), contract tests (in-process FastAPI client), integration tests (containerized service), and consumer-driven contract tests (mock client → real server contract enforcement). By the end you'll know which test type catches which class of bug and have a CI workflow that runs all four.

## Why this matters

A model-serving service has at least four interfaces: input schema, output schema, observability shape (metrics + logs), and operational endpoints (health/ready/admin). Each needs a different test strategy. Conflating them — or only writing the "easy" ones — is the most common source of production regressions.

## Requirements

### 1. Unit tests
Pure-function tests for everything that doesn't need an HTTP server: feature validation, schema serialization, batch splitting, prediction post-processing.

### 2. Contract tests (in-process)
FastAPI's `TestClient` against your `app` instance. These should cover every request/response shape exhaustively but never touch a real model file — use a tiny `MagicMock` or in-test trained scikit-learn model.

### 3. Integration tests (real container)
Spin up the actual Docker image (via `testcontainers` or `docker compose`), drive real HTTP traffic, verify end-to-end including metrics scraping. Slower but catches Dockerfile, network, and signal-handling bugs.

### 4. Consumer-driven contract tests
Use **Pact** (or a hand-rolled equivalent): a fake client publishes a contract (expected requests + expected response shapes), the server's CI verifies it can satisfy that contract. Prevents the server from changing its API in a way that breaks downstream consumers.

## Step-by-step

### Step 1 — Set up testing infra (20 min)
```toml
# pyproject.toml
[tool.pytest.ini_options]
addopts = "-ra -q --strict-markers"
markers = [
    "unit: fast, no IO",
    "contract: in-process HTTP",
    "integration: containerized",
    "consumer_contract: pact-style",
]
testpaths = ["tests"]
```

Run tagged subsets with `pytest -m unit`, etc.

### Step 2 — Unit tests (30 min)
```python
# tests/unit/test_schemas.py
import pytest
from model_serve.ml.schemas import PredictRequest

def test_rejects_wrong_feature_count():
    with pytest.raises(ValueError):
        PredictRequest(features=[1.0, 2.0])    # only 2, expected 4

def test_normalize_idempotent():
    raw = PredictRequest(features=[1.0]*4)
    assert raw == PredictRequest.parse_obj(raw.model_dump())
```

Target: ≥30 unit tests covering schemas, validation, normalizers, error formatting.

### Step 3 — Contract tests (60 min)
```python
# tests/contract/conftest.py
import pytest
from fastapi.testclient import TestClient
from model_serve.app import create_app

@pytest.fixture
def client(tmp_path, monkeypatch):
    # train a tiny in-test model, save to tmp_path
    monkeypatch.setenv("MODEL_PATH", str(tmp_path / "m.joblib"))
    monkeypatch.setenv("RATE_LIMIT_PER_MIN", "10000")    # disable for tests
    return TestClient(create_app())

# tests/contract/test_predict.py
def test_predict_returns_expected_shape(client):
    r = client.post("/v1/predict", json={"features":[1.0]*4})
    assert r.status_code == 200
    body = r.json()
    assert set(body.keys()) == {"prediction", "latency_ms", "model_version"}
```

Cover all responses you've documented in OPERATIONS.md.

### Step 4 — Integration tests (60 min)
```python
# tests/integration/conftest.py
import pytest
from testcontainers.compose import DockerCompose

@pytest.fixture(scope="session")
def stack():
    with DockerCompose("./", compose_file_name="docker-compose.yml") as c:
        c.wait_for("http://localhost:8000/health")
        yield c

# tests/integration/test_observability.py
import requests
def test_metrics_exposed(stack):
    r = requests.get("http://localhost:8000/metrics")
    assert r.status_code == 200
    for metric in ("predictions_total", "predict_latency_seconds", "model_info"):
        assert metric in r.text
```

### Step 5 — Consumer-driven contracts with Pact (40 min)
```python
# tests/consumer_contract/test_consumer.py
from pact import Consumer, Provider

pact = Consumer("dashboard").has_pact_with(Provider("model-serve"))

def test_predict_contract():
    expected = {"prediction": float, "latency_ms": float, "model_version": str}
    (pact
        .given("model is loaded")
        .upon_receiving("a valid predict request")
        .with_request("POST", "/v1/predict", body={"features":[1.0]*4})
        .will_respond_with(200, body=expected))
    with pact:
        # consumer code calls pact.uri
        ...
```

Server verifies contracts via `pact-verifier` in CI.

### Step 6 — CI wiring (20 min)
```yaml
# .github/workflows/test.yml
jobs:
  unit:        runs-on: ubuntu-latest    # pytest -m unit
  contract:    runs-on: ubuntu-latest    # pytest -m contract
  integration: runs-on: ubuntu-latest    # needs Docker; pytest -m integration
  pact-verify: runs-on: ubuntu-latest    # pact-verifier against contract files
```

Fastest jobs first; integration only on PRs to main.

## Deliverables

1. Tests in 4 directories (`unit/`, `contract/`, `integration/`, `consumer_contract/`).
2. A `TESTING.md` describing what each tier catches and when to add tests in each.
3. A coverage report (`pytest --cov`) showing ≥80% line coverage from unit + contract tests alone (integration tests are about end-to-end behavior, not coverage).
4. CI workflow file demonstrating the four tiers as separate jobs.

## Validation

- [ ] `pytest -m unit` runs in < 5 seconds.
- [ ] `pytest -m contract` runs in < 30 seconds.
- [ ] `pytest -m integration` runs in < 5 minutes; requires Docker.
- [ ] `pact-verifier` against the consumer's contract file passes.
- [ ] CI workflow has the four jobs.
- [ ] Coverage from unit + contract ≥ 80%.

## Stretch goals

- Add **mutation testing** with `mutmut` to verify your tests actually catch regressions.
- Add **fuzz testing** of `/v1/predict` with `hypothesis` — generate random valid + invalid payloads and assert no 5xx, no crashes, predictable response shapes.
- Add a **performance regression test**: integration job measures p95 latency on a fixed synthetic load and fails CI if it regresses > 30%.

## Common pitfalls

- **Mocking the model at the wrong layer** — Mock at `joblib.load` or `Model.predict`, not at the request handler. Tests should exercise as much of your code as possible.
- **Flaky integration tests** — Always wait on a health endpoint, never `time.sleep(5)`.
- **Pact contracts that just mirror the OpenAPI** — Contracts should encode consumer expectations, not duplicate spec.
- **Coverage targets driving behavior** — A test that runs every line but asserts nothing is worse than no test. Tests must assert observable behavior.
- **Rate-limit middleware enabled in tests** — Test parallelism trips rate limits; disable via env var override.

## Solutions

Reference implementation in the engineer-solutions repo.
