# Docker Cheat Sheet

Quick reference for common Docker commands and best practices.

---

## 🐳 Basic Commands

### Images
```bash
# Build image from Dockerfile
docker build -t myimage:tag .

# Build with build args
docker build --build-arg VERSION=1.0 -t myimage:tag .

# List images
docker images

# Remove image
docker rmi myimage:tag

# Remove unused images
docker image prune -a

# Pull image from registry
docker pull nginx:latest

# Push image to registry
docker push myregistry.com/myimage:tag

# Tag image
docker tag myimage:tag myregistry.com/myimage:tag

# Inspect image
docker inspect myimage:tag

# View image history
docker history myimage:tag
```

### Containers
```bash
# Run container
docker run -d --name mycontainer myimage:tag

# Run with port mapping
docker run -d -p 8080:80 --name mycontainer myimage:tag

# Run with environment variables
docker run -d -e KEY=value --name mycontainer myimage:tag

# Run with volume mount
docker run -d -v /host/path:/container/path myimage:tag

# Run interactively
docker run -it myimage:tag /bin/bash

# List running containers
docker ps

# List all containers (including stopped)
docker ps -a

# Stop container
docker stop mycontainer

# Start stopped container
docker start mycontainer

# Restart container
docker restart mycontainer

# Remove container
docker rm mycontainer

# Remove running container (force)
docker rm -f mycontainer

# View container logs
docker logs mycontainer

# Follow logs in real-time
docker logs -f mycontainer

# Execute command in running container
docker exec -it mycontainer /bin/bash

# Copy files from container
docker cp mycontainer:/path/to/file /host/path

# Copy files to container
docker cp /host/path mycontainer:/path/to/file

# View container stats
docker stats mycontainer

# Inspect container
docker inspect mycontainer
```

### Cleanup
```bash
# Remove all stopped containers
docker container prune

# Remove all unused images
docker image prune -a

# Remove all unused volumes
docker volume prune

# Remove all unused networks
docker network prune

# Remove everything (containers, images, volumes, networks)
docker system prune -a --volumes
```

---

## 📝 Dockerfile Best Practices

### Multi-stage Build Example
```dockerfile
# Stage 1: Build
FROM python:3.11-slim as builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

COPY . .

# Stage 2: Runtime
FROM python:3.11-slim

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app .

# Make sure scripts are in PATH
ENV PATH=/root/.local/bin:$PATH

# Run as non-root user
RUN useradd -m appuser && chown -R appuser /app
USER appuser

EXPOSE 8000

CMD ["python", "main.py"]
```

### Best Practices
```dockerfile
# ✅ Use specific version tags (not 'latest')
FROM python:3.11-slim

# ✅ Combine RUN commands to reduce layers
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ✅ Copy requirements first (better layer caching)
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

# ✅ Use .dockerignore to exclude unnecessary files
# Create .dockerignore with: __pycache__, *.pyc, .git, etc.

# ✅ Run as non-root user
USER appuser

# ✅ Use EXPOSE to document ports
EXPOSE 8000

# ✅ Use ENTRYPOINT for main command, CMD for default args
ENTRYPOINT ["python"]
CMD ["app.py"]
```

---

## 🔗 Docker Compose

### Basic docker-compose.yml
```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://db:5432/mydb
    depends_on:
      - db
    volumes:
      - ./app:/app
    networks:
      - mynetwork

  db:
    image: postgres:15
    environment:
      POSTGRES_DB: mydb
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - mynetwork

volumes:
  postgres_data:

networks:
  mynetwork:
```

### Docker Compose Commands
```bash
# Start services
docker-compose up

# Start in detached mode
docker-compose up -d

# Build and start
docker-compose up --build

# Stop services
docker-compose down

# Stop and remove volumes
docker-compose down -v

# View logs
docker-compose logs

# Follow logs
docker-compose logs -f web

# Execute command in service
docker-compose exec web bash

# List services
docker-compose ps

# Scale service
docker-compose up --scale web=3
```

---

## 🌐 Networking

```bash
# List networks
docker network ls

# Create network
docker network create mynetwork

# Connect container to network
docker network connect mynetwork mycontainer

# Disconnect container from network
docker network disconnect mynetwork mycontainer

# Inspect network
docker network inspect mynetwork

# Remove network
docker network rm mynetwork
```

---

## 💾 Volumes

```bash
# List volumes
docker volume ls

# Create volume
docker volume create myvolume

# Inspect volume
docker volume inspect myvolume

# Remove volume
docker volume rm myvolume

# Use volume in container
docker run -v myvolume:/app/data myimage:tag

# Use bind mount
docker run -v /host/path:/container/path myimage:tag

# Read-only mount
docker run -v /host/path:/container/path:ro myimage:tag
```

---

## 🔍 Debugging

```bash
# View container logs
docker logs mycontainer

# Stream logs
docker logs -f mycontainer

# Show last 100 lines
docker logs --tail 100 mycontainer

# Show logs with timestamps
docker logs -t mycontainer

# Inspect container (full JSON)
docker inspect mycontainer

# View processes in container
docker top mycontainer

# View container resource usage
docker stats mycontainer

# Execute shell in running container
docker exec -it mycontainer /bin/bash

# View container filesystem changes
docker diff mycontainer

# Export container filesystem
docker export mycontainer > container.tar
```

---

## 🏷️ Registry Operations

```bash
# Login to registry
docker login myregistry.com

# Logout
docker logout myregistry.com

# Tag for registry
docker tag myimage:tag myregistry.com/myimage:tag

# Push to registry
docker push myregistry.com/myimage:tag

# Pull from registry
docker pull myregistry.com/myimage:tag
```

---

## 🔒 Security

```bash
# Run container with limited resources
docker run --memory="512m" --cpus="1.0" myimage:tag

# Run with read-only filesystem
docker run --read-only myimage:tag

# Scan image for vulnerabilities
docker scan myimage:tag

# Run with security options
docker run --security-opt no-new-privileges myimage:tag

# Drop capabilities
docker run --cap-drop ALL --cap-add NET_BIND_SERVICE myimage:tag
```

---

## 📊 Useful One-Liners

```bash
# Stop all running containers
docker stop $(docker ps -q)

# Remove all stopped containers
docker rm $(docker ps -a -q)

# Remove all images
docker rmi $(docker images -q)

# Get container IP address
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mycontainer

# Follow logs of multiple containers
docker-compose logs -f web db

# Remove dangling images
docker images -f "dangling=true" -q | xargs docker rmi

# Container stats for all running containers
docker stats --all --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
```

---

## 💡 Pro Tips

1. **Use .dockerignore** - Exclude unnecessary files (like .git, __pycache__)
2. **Multi-stage builds** - Reduce final image size
3. **Layer caching** - Order Dockerfile commands from least to most frequently changing
4. **Specific tags** - Never use :latest in production
5. **Health checks** - Add HEALTHCHECK to Dockerfile
6. **Non-root user** - Always run as non-root in production
7. **Resource limits** - Set memory and CPU limits
8. **Logging** - Use json-file or journald log driver
9. **Secrets** - Use Docker secrets or environment variables (never hardcode)
10. **Scan images** - Regularly scan for vulnerabilities

---

**See also:**
- [Kubernetes Cheat Sheet](./kubernetes-cheat-sheet.md)
- [Git Cheat Sheet](./git-cheat-sheet.md)
- [Linux Commands Cheat Sheet](./linux-cheat-sheet.md)
