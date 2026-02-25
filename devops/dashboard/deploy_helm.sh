#!/bin/bash
set -e

pwd

source .env

# 1️⃣ Instalar el dashboard de Kubernetes
helm repo add $NAME_SPACE $REPO_HELP

helm repo update

kubectl create namespace $NAME_SPACE

helm install $NAME_SPACE $PATH_HELP --namespace $NAME_SPACE

kubectl apply -f ./igress.yaml

#helm upgrade --install $NAME_SPACE ./chart

#kubectl create token headlamp --namespace headlamp 

#kubectl -n argocd get secret argocd-initial-admin-secret  -o jsonpath="{.data.password}" | base64 -d && echo

# kubectl --namespace monitoring get secrets monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo