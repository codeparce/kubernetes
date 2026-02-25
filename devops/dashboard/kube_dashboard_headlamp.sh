#!/bin/bash
set -e

# 1️⃣ Instalar el dashboard de Kubernetes
helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
helm repo update

kubectl create namespace headlamp
helm install headlamp headlamp/headlamp --namespace headlamp

kubectl apply -f headlamp-ingress.yaml

kubectl create token headlamp --namespace headlamp > admin.txt