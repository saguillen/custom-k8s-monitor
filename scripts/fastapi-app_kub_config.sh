#!/usr/bin/env bash
set -e

# Ir al directorio raíz del proyecto (padre de scripts)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$PROJECT_ROOT"

kubectl apply -f my_app_k8s_config/
