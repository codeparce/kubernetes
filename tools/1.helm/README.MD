
# Helm

```bash
## Instalar con tu gestor de paquetes
apt install helm
brew install helm

# comandos utiles
helm repo list
helm search repo prometheus
```

```bash 
## APPS utiles
# https://kubernetes-sigs.github.io/headlamp/

# https://argoproj.github.io/argo-helm

# https://prometheus-community.github.io/helm-charts
```


## Instalar repos o aplicaciones

```bash
helm repo add prometheus https://prometheus-community.github.io/helm-charts

helm repo update

helm search repo prometheus

helm install prometheus prometheus/kube-prometheus-stack  --namespace prometheus --create-namespace
```

```bash
## SE OBTIENE EL NOMBRE DEL SERIVICIO
kubectl get service --namespace prometheus | grep prometheus
```

```bash
## SE ACTAULIZA EL .ENV
set -a && source .env.phu && set +a
# remeplezar variables
envsubst < ingress.template > ingress.yaml
# Verfiicar el ingress
cat ingress.yaml 
#Plantilla para exponer el servicio por loadbalancer 80 con traefik
kubectl apply -f ./ingress.yaml
```

## Comandos para obtener las keys

```bash
kubectl create token headlamp --namespace devops 

kubectl --namespace prometheus get secrets prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo

kubectl --namespace prometheus get secrets monitoring-grafana -o jsonpath="{.data}" | base64 -d ; echo
```

### Vault 

Entrar al pod y ejecutar los comandos para inizialziar 

```bash
# validate
vault status
# init
vault operator init
# enviar tres claves del output
vault operator unseal
```