
# Helm

```bash
# comandos utiles
helm repo list
helm search repo prometheus
```

**APPS utiles**

https://kubernetes-sigs.github.io/headlamp/

https://argoproj.github.io/argo-helm

https://prometheus-community.github.io/helm-charts


## Instalar repos o aplicaciones

```bash
helm repo add prometheus https://prometheus-community.github.io/helm-charts

helm repo update

helm search repo prometheus

kubectl create namespace prometheus

helm install prometheus prometheus/kube-prometheus-stack  --namespace prometheus --create-namespace

## SE OBTIENE EL NOMBRE DEL SERIVICIO
kubectl get service --namespace prometheus | grep prometheus

## SE ACTAULIZA EL .ENV

set -a && source .env.phu && set +a

envsubst < ingress.template > ingress.yaml

#Plantilla para exponer el servicio por loadbalancer 80 con traefik
kubectl apply -f ./igress.yaml
```

## Comandos para obtener las keys

```bash
kubectl create token headlamp --namespace devops 

kubectl --namespace prometheus get secrets prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo

kubectl --namespace monitoring get secrets monitoring-grafana -o jsonpath="{.data}" | base64 -d ; echo
```