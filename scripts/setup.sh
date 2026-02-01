#!/bin/bash
# Script para instalar Helm en Debian/Ubuntu

set -e  # Detener la ejecución si algún comando falla

echo "Instalando Helm..."
sudo apt-get update
sudo apt-get install curl gpg apt-transport-https --yes
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm --yes
echo "OK"

echo "Instalando Minikube..."
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
echo "OK"

echo "Lanzando minikube..."
minikube start
echo "OK"

echo "Añadiendo el repositorio de Prometheus Community..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts/
echo "OK"

echo "Instalando el stack de monitoreo de Prometheus..."
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --version 45.7.1 --namespace monitoring --create-namespace -f ./alertmanager/prometheus-values.yaml
echo "OK"

echo "Fin"
