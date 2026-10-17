# Lab 03: Stand Up a Local Kubernetes Cluster with kind

**Duration:** 60 minutes
**Difficulty:** Beginner+
**Prerequisites:** Lab 02 complete; Docker installed and running

## Objective

Create a local Kubernetes cluster using **kind** (Kubernetes-in-Docker), deploy the Flask service from Lab 02 to it, expose it via a Service, and access it from your laptop. By the end you'll be able to start, use, and tear down a real Kubernetes cluster in minutes.

## Why this matters

Module 104 (Kubernetes Fundamentals) assumes you've already done this at least once. Cloud Kubernetes (EKS, GKE, AKS) is the same API behind a different control plane; mastering kind locally makes cloud K8s much cheaper to learn.

## Prerequisites

```bash
# kind: install per https://kind.sigs.k8s.io/
brew install kind kubectl    # macOS via Homebrew
# Linux: see kind's release page for binary download

kind version                  # expect kind 0.23.x or newer
kubectl version --client      # any 1.28+ works
```

## Steps

### 1. Create a kind cluster with a port mapping

```bash
mkdir -p ~/ai-infra-labs/lab-03-kind && cd ~/ai-infra-labs/lab-03-kind

cat > kind-config.yaml <<'EOF'
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: lab-03
nodes:
  - role: control-plane
    extraPortMappings:
      - containerPort: 30080
        hostPort: 8080
        protocol: TCP
EOF

kind create cluster --config kind-config.yaml
```

This takes ~30 seconds. When done:

```bash
kubectl cluster-info --context kind-lab-03
kubectl get nodes
# Expect one node: lab-03-control-plane, status Ready
```

### 2. Load the Lab 02 image into the cluster

The Flask image you built in Lab 02 isn't in any registry — kind needs it imported explicitly.

```bash
docker tag hello-flask:0.1 hello-flask:0.1     # ensure it's still there
kind load docker-image hello-flask:0.1 --name lab-03
```

If you cleaned up Lab 02's image, rebuild it first.

### 3. Write the Kubernetes manifests

```bash
cat > deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-flask
  labels: { app: hello-flask }
spec:
  replicas: 2
  selector:
    matchLabels: { app: hello-flask }
  template:
    metadata:
      labels: { app: hello-flask }
    spec:
      containers:
        - name: app
          image: hello-flask:0.1
          imagePullPolicy: Never           # use local image only
          ports:
            - containerPort: 8000
          readinessProbe:
            httpGet: { path: /health, port: 8000 }
            initialDelaySeconds: 2
          resources:
            requests: { cpu: 100m, memory: 128Mi }
            limits:   { cpu: 500m, memory: 256Mi }
EOF

cat > service.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: hello-flask
spec:
  type: NodePort
  selector: { app: hello-flask }
  ports:
    - port: 80
      targetPort: 8000
      nodePort: 30080
EOF
```

### 4. Apply and observe

```bash
kubectl apply -f deployment.yaml -f service.yaml
kubectl get pods -w                       # Ctrl-C once both pods are Running and Ready 2/2
```

### 5. Reach the service from your laptop

```bash
curl -s http://localhost:8080/health
# Expect: {"host":"hello-flask-...","python":"3.11.x","status":"ok"}

# Repeat several times — the host changes as you hit different pods (load balancing).
for i in $(seq 1 10); do curl -s http://localhost:8080/health | jq -r .host; done | sort -u
# Expect 2 unique pod names.
```

### 6. Scale and roll

```bash
kubectl scale deployment/hello-flask --replicas=4
kubectl rollout status deployment/hello-flask

# Bump image tag → no real change but triggers a rollout
kubectl set image deployment/hello-flask app=hello-flask:0.1 --record
kubectl rollout history deployment/hello-flask
```

## Validation

- [ ] `kubectl get nodes` shows one Ready node.
- [ ] `kubectl get pods` shows 4 hello-flask pods in Running, 1/1 Ready after the scale.
- [ ] `curl http://localhost:8080/health` returns 200 OK every time.
- [ ] Round-robin across 4 distinct pod hostnames over 10+ requests.
- [ ] `kubectl rollout history deployment/hello-flask` shows at least 2 revisions.

## Cleanup

```bash
kind delete cluster --name lab-03
docker images hello-flask                  # still available locally if you want
cd ~ && rm -rf ~/ai-infra-labs/lab-03-kind
```

## Troubleshooting

- **`ErrImagePull` / `ImagePullBackOff`** — You forgot `kind load docker-image`. Run it, then `kubectl rollout restart deployment/hello-flask`.
- **Pods stuck in `Pending`** — Node has insufficient resources. Lower the resource requests.
- **`curl localhost:8080` connection refused** — Service NodePort or kind port mapping wrong. Check `kubectl get svc hello-flask` and the `nodePort: 30080` matches `containerPort: 30080` in kind-config.yaml.
- **All requests hit the same pod** — `kube-proxy` uses iptables and is not strict round-robin; expect variation, not perfect distribution.
- **kind cluster doesn't appear** — Docker isn't running, or you're using `--name foo` inconsistently. Always pass `--name lab-03` to kind commands.
