#!/bin/bash
set -e

source .env

# 1️⃣ Instalar el dashboard de Kubernetes
helm repo add headlamp $REPO_HELP
helm repo update

kubectl create namespace $NAME_SPACE
helm install $NAME_SPACE $PATH --namespace $NAME_SPACE

helm upgrade --install headlamp ./

#kubectl create token headlamp --namespace headlamp > admin.txt

#kubectl -n argocd get secret argocd-initial-admin-secret  -o jsonpath="{.data.password}" | base64 -d && echo

#kubectl get secret monitoring-grafana -n monitoring \ -o jsonpath="{.data.admin-password}" | base64 -d && echo