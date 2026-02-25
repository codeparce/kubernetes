# Primeros pasos kubernetes en linux

**! Pasos previio** docker y realizar el control de logs 

- [Instalar docker](https://docs.docker.com/engine/install/ubuntu/)
- [Configurar grupo para docker](https://docs.docker.com/engine/install/linux-postinstall/)
- [Control de logs](https://docs.docker.com/engine/logging/configure/) 

## Instalar kbctl

### Instalar actualizaciones 
```bash 
sudo apt update
sudo apt install -y curl ca-certificates gnupg lsb-release apt-transport-https
```

- [Link de la documentacion kbctl ](https://k8s-docs.netlify.app/es/docs/tasks/tools/install-kubectl/) 

## Instalar k3d

```bash 
# instala k3d (script oficial)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# verifica
k3d version
```

### Crear el cluster


```bash 
k3d cluster create dev --servers 1 --agents 1  -p "80:80@loadbalancer" -p "8080:8080@loadbalancer"  -v /srv/gitlab:/mnt/gitlab@server:0 
kubectl get nodes
```

```bash 
# para eliminar el cluster
k3d cluster delete dev
```

### Instalar el dashborad de kubernetes 
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


kubectl -n kubernetes-dashboard create token admin-user 

#> admin.txt



kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard 10443:443 --address 0.0.0.0 --insecure-skip-tls-verify=true


kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard 10443:443
```

# comandos pal cluster

```bash
k3d cluster stop <nombre-cluster>

# y para encenderlo otra vez:

k3d cluster start <nombre-cluster>
```