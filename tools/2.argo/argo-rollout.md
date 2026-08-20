# Instalar Argo Rollouts 


## Instalacion con kubectl

```bash
kubectl create namespace argo-rollouts

kubectl apply -n argo-rollouts \
-f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
## Verificate
kubectl get pods -n argo-rollouts
```

### Instalar el plugin de kubectl

```bash
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64

chmod +x kubectl-argo-rollouts-linux-amd64

sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

# Verificate 

kubectl argo rollouts version
```

### Ver RollOut

```bash
kubectl argo rollouts get rollout mi-banca-app -n sis-main-front --watch
```


## Instalacion con Helm 

```bash
helm repo add argo https://argoproj.github.io/argo-helm

helm install argo argo/argo-rollouts --set dashboard.enabled=true -n argo-rollouts --create-namespace
# Y crear el ingress de traefik para poder aceder al dashboard
```
