# Instalar el dashborad de kubernetes 

```bash 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

kubectl get pods -n kubernetes-dashboard
```

#### Creacion de usuario para el dashboard

```bash
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

## Crear token
kubectl -n kubernetes-dashboard create token admin-user 

## Exponer servicio
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard 10443:443 --address 0.0.0.0 --insecure-skip-tls-verify=true

```