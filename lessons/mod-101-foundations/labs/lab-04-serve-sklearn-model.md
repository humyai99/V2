# Lab 04: Serve a Scikit-Learn Model Behind a FastAPI Endpoint

**Duration:** 75 minutes
**Difficulty:** Beginner+
**Prerequisites:** Labs 01-03 complete

## Objective

Train a small scikit-learn classifier locally, persist it with joblib, and serve predictions through a FastAPI `/predict` endpoint with Pydantic-validated input. Containerize the result and deploy to the kind cluster from Lab 03.

## Why this matters

This is the smallest realistic representation of a production model-serving service. Every project from here on is an elaboration of this pattern (add monitoring, scale, batch, optimize) — getting the basic shape right matters.

## Prerequisites

- Kind cluster from Lab 03 still running, OR willingness to recreate it (`kind create cluster --config kind-config.yaml`).

## Steps

### 1. Create the project

```bash
mkdir -p ~/ai-infra-labs/lab-04-serve && cd ~/ai-infra-labs/lab-04-serve
python3 -m venv venv && source venv/bin/activate

cat > requirements.txt <<'EOF'
scikit-learn>=1.4
joblib>=1.3
fastapi>=0.111
uvicorn[standard]>=0.30
pydantic>=2.7
gunicorn>=22.0
EOF

pip install --upgrade pip
pip install -r requirements.txt
```

### 2. Train and save a tiny model

```bash
cat > train.py <<'EOF'
"""Train a small classifier on the iris dataset and save it."""
import joblib
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

X, y = load_iris(return_X_y=True)
X_tr, X_te, y_tr, y_te = train_test_split(X, y, test_size=0.2, random_state=42)

model = RandomForestClassifier(n_estimators=50, random_state=42).fit(X_tr, y_tr)
print(f"test accuracy: {accuracy_score(y_te, model.predict(X_te)):.3f}")

joblib.dump(model, "model.joblib")
print("saved -> model.joblib")
EOF

python train.py
ls -lh model.joblib
```

### 3. Build the FastAPI service

```bash
cat > app.py <<'EOF'
"""Serve the iris classifier behind FastAPI."""
import logging, time
from contextlib import asynccontextmanager
from typing import Annotated

import joblib
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field, ValidationError

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s %(message)s")
log = logging.getLogger("iris-api")

MODEL_PATH = "model.joblib"
CLASS_NAMES = ["setosa", "versicolor", "virginica"]


class PredictIn(BaseModel):
    sepal_length: Annotated[float, Field(ge=0, le=20)]
    sepal_width:  Annotated[float, Field(ge=0, le=20)]
    petal_length: Annotated[float, Field(ge=0, le=20)]
    petal_width:  Annotated[float, Field(ge=0, le=20)]

    def as_row(self) -> list[float]:
        return [self.sepal_length, self.sepal_width, self.petal_length, self.petal_width]


class PredictOut(BaseModel):
    class_name: str
    class_id: int
    latency_ms: float


@asynccontextmanager
async def lifespan(app: FastAPI):
    log.info("loading model from %s", MODEL_PATH)
    app.state.model = joblib.load(MODEL_PATH)
    yield
    log.info("shutting down")


app = FastAPI(title="iris-api", version="0.1.0", lifespan=lifespan)


@app.get("/health")
def health() -> dict:
    return {"status": "ok"}


@app.get("/ready")
def ready(request) -> dict:
    if getattr(request.app.state, "model", None) is None:
        raise HTTPException(503, "model not loaded")
    return {"status": "ready"}


@app.post("/predict", response_model=PredictOut)
def predict(req: PredictIn, request) -> PredictOut:
    t0 = time.perf_counter()
    class_id = int(request.app.state.model.predict([req.as_row()])[0])
    elapsed = (time.perf_counter() - t0) * 1000
    return PredictOut(class_name=CLASS_NAMES[class_id], class_id=class_id, latency_ms=round(elapsed, 3))
EOF
```

Note: the `request` parameter type annotation is omitted in this skeleton for brevity; for production you'd use `from fastapi import Request` and `request: Request`.

### 4. Run locally and smoke-test

```bash
uvicorn app:app --host 0.0.0.0 --port 8000 &
sleep 1

curl -s http://localhost:8000/health
curl -s -X POST http://localhost:8000/predict -H 'content-type: application/json' \
  -d '{"sepal_length":5.1,"sepal_width":3.5,"petal_length":1.4,"petal_width":0.2}'

# Stop the dev server
kill %1
```

Expected: `{"class_name":"setosa","class_id":0,"latency_ms":...}`.

### 5. Containerize

```bash
cat > Dockerfile <<'EOF'
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py model.joblib ./
EXPOSE 8000
CMD ["gunicorn", "-w", "2", "-k", "uvicorn.workers.UvicornWorker", "-b", "0.0.0.0:8000", "app:app"]
EOF

docker build -t iris-api:0.1 .
```

### 6. Deploy to kind

```bash
kind load docker-image iris-api:0.1 --name lab-03

cat > k8s.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata: { name: iris-api }
spec:
  replicas: 2
  selector: { matchLabels: { app: iris-api } }
  template:
    metadata: { labels: { app: iris-api } }
    spec:
      containers:
        - name: api
          image: iris-api:0.1
          imagePullPolicy: Never
          ports: [{ containerPort: 8000 }]
          readinessProbe:
            httpGet: { path: /ready, port: 8000 }
            initialDelaySeconds: 3
---
apiVersion: v1
kind: Service
metadata: { name: iris-api }
spec:
  type: NodePort
  selector: { app: iris-api }
  ports:
    - port: 80
      targetPort: 8000
      nodePort: 30080
EOF

kubectl delete -f ../lab-03-kind/service.yaml --ignore-not-found
kubectl delete -f ../lab-03-kind/deployment.yaml --ignore-not-found
kubectl apply -f k8s.yaml
kubectl rollout status deployment/iris-api
```

### 7. Exercise from the host

```bash
for _ in {1..5}; do
  curl -s -X POST http://localhost:8080/predict \
    -H 'content-type: application/json' \
    -d '{"sepal_length":6.0,"sepal_width":3.0,"petal_length":5.0,"petal_width":1.5}'
done
```

## Validation

- [ ] `/health` returns `{"status":"ok"}`.
- [ ] `/ready` returns 200 only after the model is loaded.
- [ ] `/predict` returns a JSON body with `class_name`, `class_id`, `latency_ms`.
- [ ] Sending bad input (e.g., `"sepal_length": "not a number"`) returns HTTP 422 with field-level error details.
- [ ] Two pods are Ready in `kubectl get pods`.

## Cleanup

```bash
kubectl delete -f k8s.yaml
docker rmi iris-api:0.1
cd ~ && rm -rf ~/ai-infra-labs/lab-04-serve
```

## Troubleshooting

- **422 Unprocessable Entity** — Pydantic validation rejected the input. The error body tells you which field; usually a missing key or wrong type.
- **Model loads on every request** — You skipped the `lifespan` context manager. Confirm `app.state.model` is set once at startup, not inside `predict`.
- **Pod CrashLoopBackOff** — `kubectl logs pod/<name>`. Common cause: `model.joblib` not copied into the image. Check `COPY app.py model.joblib ./`.
- **`Address already in use`** — Previous `uvicorn` still running. `pkill -f uvicorn` or `lsof -i :8000`.
