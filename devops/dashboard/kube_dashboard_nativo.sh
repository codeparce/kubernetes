#!/bin/bash
set -e

# 1️⃣ Instalar el dashboard de Kubernetes
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# Esperar un poco a que los pods se creen
echo "Esperando que los pods del dashboard estén listos..."
kubectl wait --for=condition=Ready pod -l k8s-app=kubernetes-dashboard -n kubernetes-dashboard --timeout=120s

# Mostrar estado de los pods
kubectl get pods -n kubernetes-dashboard

# 2️⃣ Crear usuario admin para el dashboard
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# 3️⃣ Obtener el token y guardarlo
kubectl -n kubernetes-dashboard create token admin-user > admin.txt
echo "Token guardado en admin.txt"

# 4️⃣ Levantar el port-forward en segundo plano
# nohup kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard 10443:443 \
#   --address 0.0.0.0 --insecure-skip-tls-verify=true > dashboard.log 2>&1 &

nohup kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard 10443:443 > dashboard.log 2>&1 &

echo "Dashboard corriendo en https://localhost:10443 (port-forward en segundo plano)" 
echo "Logs del port-forward en dashboard.log" 