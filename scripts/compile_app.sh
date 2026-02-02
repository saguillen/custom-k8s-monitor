#!/usr/bin/env bash
set -e

# Ruta del script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Usar el Docker de minikube
eval "$(minikube docker-env)"

# Build usando el Dockerfile en /docker
docker build \
  -t fastapi-image-local:latest \
  -f "$PROJECT_ROOT/docker/Dockerfile" \
  "$PROJECT_ROOT"

