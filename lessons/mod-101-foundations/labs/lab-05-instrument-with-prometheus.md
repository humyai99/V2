# Lab 05: Add Prometheus Instrumentation to the FastAPI Service

**Duration:** 60 minutes
**Difficulty:** Beginner+
**Prerequisites:** Lab 04 complete; `iris-api` service running on kind cluster

## Objective

Add Prometheus metrics to the FastAPI service from Lab 04, deploy a local Prometheus to scrape it, and query a few representative PromQL expressions. By the end you'll have a working metrics → scrape → query loop end-to-end on your laptop.

## Why this matters

Every production service emits metrics. Module 108 (Monitoring & Observability) drills deep; here we establish the simple shape — "expose `/metrics`, point Prometheus at it, query results" — that all later modules build on.

## Prerequisites

- Lab 04 deployed and serving (`curl http://localhost:8080/health` returns 200).
- Helm 3 installed (`helm version`).

## Steps

### 1. Add instrumentation to the FastAPI app

```bash
cd ~/ai-infra-labs/lab-04-serve
source venv/bin/activate
pip install prometheus-fastapi-instrumentator>=7.0
```

Edit `app.py` to add 3 lines:

```python
# After: app = FastAPI(...)
from prometheus_fastapi_instrumentator import Instrumentator
Instrumentator().instrument(app).expose(app)
```

You also want a custom counter for predictions per class:

```python
# Near the top, after `log = logging.getLogger(...)`:
from prometheus_client import Counter
PREDICTIONS = Counter(
    "iris_predictions_total",
    "Total predictions by class",
    ["class_name"],
)

# Inside predict(), before returning:
PREDICTIONS.labels(class_name=CLASS_NAMES[class_id]).inc()
```

### 2. Rebuild and reload the image

```bash
docker build -t iris-api:0.2 .
kind load docker-image iris-api:0.2 --name lab-03

kubectl set image deployment/iris-api api=iris-api:0.2
kubectl rollout status deployment/iris-api
```

### 3. Verify /metrics is exposed

```bash
curl -s http://localhost:8080/metrics | head -40
```

Expected: a long list of `# HELP` / `# TYPE` blocks plus your `iris_predictions_total{class_name="..."} 0` rows.

### 4. Install kube-prometheus-stack via Helm

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
    --namespace monitoring --create-namespace \
    --set grafana.enabled=true \
    --set grafana.adminPassword=admin \
    --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
    --wait
```

This installs Prometheus, Alertmanager, and Grafana. Wait ~2-3 min for all pods to be Ready.

```bash
kubectl get pods -n monitoring
```

### 5. Tell Prometheus to scrape our app

```bash
cat > servicemonitor.yaml <<'EOF'
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: iris-api
  labels:
    release: monitoring     # required by the kube-prometheus-stack default selector
spec:
  selector:
    matchLabels: { app: iris-api }
  endpoints:
    - port: web
      path: /metrics
      interval: 15s
EOF
```

But our Service doesn't have a named port. Patch it:

```bash
kubectl patch svc iris-api --type=merge -p '{"spec":{"ports":[{"name":"web","port":80,"targetPort":8000,"nodePort":30080}]}}'
kubectl apply -f servicemonitor.yaml
```

### 6. Drive some traffic, then query Prometheus

```bash
# Drive traffic
for _ in {1..50}; do
  curl -s -X POST http://localhost:8080/predict -H 'content-type: application/json' \
    -d '{"sepal_length":5.1,"sepal_width":3.5,"petal_length":1.4,"petal_width":0.2}' >/dev/null
  curl -s -X POST http://localhost:8080/predict -H 'content-type: application/json' \
    -d '{"sepal_length":6.0,"sepal_width":3.0,"petal_length":5.0,"petal_width":1.5}' >/dev/null
done

# Port-forward Prometheus
kubectl port-forward -n monitoring svc/monitoring-kube-prometheus-prometheus 9090:9090 &
sleep 2

# Open http://localhost:9090 in browser and run these queries:
#   iris_predictions_total
#   sum by (class_name) (rate(iris_predictions_total[1m]))
#   histogram_quantile(0.95, sum by (le) (rate(http_request_duration_seconds_bucket[1m])))
```

### 7. (Optional) Grafana dashboard

```bash
kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80 &
# Open http://localhost:3000  user=admin  pass=admin
# Add panels for the three queries above.
```

## Validation

- [ ] `curl /metrics` lists `iris_predictions_total` and `http_request_duration_seconds_bucket`.
- [ ] Prometheus `Status -> Targets` page shows `iris-api` target as UP.
- [ ] PromQL `iris_predictions_total` returns one row per class with non-zero values after step 6.
- [ ] PromQL `rate(iris_predictions_total[1m])` returns a per-second rate.

## Cleanup

```bash
# Stop port-forwards
kill %1 %2 2>/dev/null

# Optional: remove monitoring stack
helm uninstall monitoring -n monitoring
kubectl delete ns monitoring

# Lab artifacts
kubectl delete -f servicemonitor.yaml k8s.yaml
docker rmi iris-api:0.2 iris-api:0.1
kind delete cluster --name lab-03
cd ~ && rm -rf ~/ai-infra-labs/lab-04-serve
```

## Troubleshooting

- **Target shows DOWN in Prometheus** — Most often the ServiceMonitor's `release: monitoring` label doesn't match the operator's selector. Verify with `kubectl get prometheus -n monitoring -o yaml | grep serviceMonitorSelector -A 5`.
- **`iris_predictions_total` returns no data** — You haven't driven traffic yet, or scrape hasn't completed. Wait 30s and refresh.
- **histogram_quantile returns NaN** — Not enough samples in the window. Increase the window to `[5m]` or drive more traffic.
- **Helm install hangs** — Cluster doesn't have enough CPU. Reduce the stack's resource requests: `--set prometheus.prometheusSpec.resources.requests.memory=300Mi`.
- **Grafana login fails** — Default password may differ in newer chart versions. `kubectl get secret -n monitoring monitoring-grafana -o jsonpath='{.data.admin-password}' | base64 -d`.
