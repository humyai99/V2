# Lab 02: Build, Run, and Inspect Your First Docker Container

**Duration:** 60 minutes
**Difficulty:** Beginner
**Prerequisites:** Lab 01 complete; Docker Desktop or Docker Engine installed

## Objective

Containerize a small Python web service with a multi-stage Dockerfile, run it locally, inspect its file system and processes from the host, and stop/remove cleanly. By the end you'll understand the image-vs-container distinction concretely (not just abstractly).

## Why this matters

Every project later in this curriculum will assume you can read a Dockerfile, build an image, run a container, and debug from `docker logs` + `docker exec`. Time spent here pays back in every subsequent module.

## Prerequisites

Verify:

```bash
docker --version           # expect Docker version 24.x or newer
docker info                # should succeed without errors
```

If `docker info` errors with "Cannot connect to the Docker daemon", start Docker Desktop.

## Steps

### 1. Create a tiny Flask service

```bash
mkdir -p ~/ai-infra-labs/lab-02-docker && cd ~/ai-infra-labs/lab-02-docker

cat > app.py <<'EOF'
from flask import Flask, jsonify
import os, platform

app = Flask(__name__)

@app.get("/health")
def health():
    return jsonify(status="ok", host=platform.node(), python=platform.python_version())
EOF

cat > requirements.txt <<'EOF'
flask>=3.0
gunicorn>=22.0
EOF
```

### 2. Write a multi-stage Dockerfile

```bash
cat > Dockerfile <<'EOF'
# ---- builder stage: install Python deps into a wheelhouse
FROM python:3.11-slim AS builder
WORKDIR /build
COPY requirements.txt .
RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# ---- runtime stage: only what's needed to run
FROM python:3.11-slim AS runtime
RUN groupadd -r app && useradd -r -g app -u 1000 app
WORKDIR /app
COPY --from=builder /wheels /wheels
COPY requirements.txt .
RUN pip install --no-index --find-links=/wheels -r requirements.txt && rm -rf /wheels

COPY app.py .
USER 1000
EXPOSE 8000
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app:app"]
EOF
```

### 3. Build the image

```bash
docker build -t hello-flask:0.1 .
```

You should see two stages — first the builder, then the runtime layer-by-layer.

```bash
docker images hello-flask
# Expect something like:
# REPOSITORY    TAG    IMAGE ID       CREATED          SIZE
# hello-flask   0.1    <hash>         5 seconds ago    ~150MB
```

### 4. Run the container

```bash
docker run -d --name hello --rm -p 8000:8000 hello-flask:0.1
sleep 2
curl -s http://localhost:8000/health
```

Expected: `{"host":"<container-id>","python":"3.11.x","status":"ok"}`

### 5. Inspect from the host

```bash
docker ps
docker logs hello                         # gunicorn boot output
docker stats hello --no-stream            # current CPU / memory / IO
docker exec -it hello sh -c 'whoami; ps aux; ls -la /app'
```

Confirm `whoami` returns `app`, not `root`. That's your non-root user.

### 6. Stop and remove

```bash
docker stop hello                         # SIGTERM with grace period
docker ps -a | grep hello || echo "no hello container — removed by --rm"
```

## Validation

- [ ] `docker images hello-flask` shows your image at < 200MB.
- [ ] `curl http://localhost:8000/health` returns status ok.
- [ ] `docker exec hello whoami` returns `app`, not `root`.
- [ ] `docker exec hello ls -la /app` shows only `app.py` (and pip-installed deps), no `requirements.txt` or `wheels/`.
- [ ] After `docker stop hello`, `docker ps -a` shows no `hello` container.

## Cleanup

```bash
docker rmi hello-flask:0.1
docker system prune -f      # optional: cleans dangling layers
cd ~ && rm -rf ~/ai-infra-labs/lab-02-docker
```

## Troubleshooting

- **`Cannot connect to the Docker daemon`** — Start Docker Desktop or `sudo systemctl start docker` on Linux.
- **Build fails on `pip wheel`** — Check `requirements.txt` syntax; one package per line, no extra whitespace.
- **Container exits immediately** — `docker logs hello` will show the error. Common cause: typo in the CMD or app.py.
- **Port 8000 already in use** — Either change the host port (`-p 8001:8000`) or stop the conflicting process: `lsof -i :8000`.
- **`docker exec` reports "executable file not found in $PATH"** — The runtime stage uses `python:3.11-slim` which doesn't include `bash`. Use `sh` instead.
