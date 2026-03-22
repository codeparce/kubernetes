
# Helm

```bash
# comandos utiles
helm repo list
helm search repo prometheus
```


**APPS utiles**

```bash

https://kubernetes-sigs.github.io/headlamp/

https://argoproj.github.io/argo-helm

https://prometheus-community.github.io/helm-charts

```

## Instalar repos o aplicaciones

```bash
helm repo add monitoring https://prometheus-community.github.io/helm-charts

helm repo update

helm search repo monitoring

kubectl create namespace monitoring

helm install monitoring monitoring/kube-prometheus-stack  --namespace monitoring

## SE OBTIENE EL NOMBRE DEL SERIVICIO
kubectl get service --namespace monitoring | grep grafana
## SE ACTAULIZA EL .ENV

envsubst < igress.template > igress.yaml

#Plantilla para exponer el servicio por loadbalancer 80 con traefik
kubectl apply -f ./igress.yaml
```

## Comandos para obtener las keys

```bash
kubectl create token headlamp --namespace headlamp 

kubectl -n argocd get secret argocd-initial-admin-secret  -o jsonpath="{.data.password}" | base64 -d && echo

kubectl --namespace monitoring get secrets monitoring-grafana -o jsonpath="{.data}" | base64 -d ; echo
```