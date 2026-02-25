
# Helm

**APPS utiles**

```bash

https://kubernetes-sigs.github.io/headlamp/

https://argoproj.github.io/argo-helm

https://prometheus-community.github.io/helm-charts
```

## Instalar repos o aplicaciones

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

kubectl create namespace example

helm install example prometheus-community/kube-prometheus-stack--namespace example

#Plantilla para exponer el servicio por loadbalancer 80 con traefik
kubectl apply -f ./igress.yaml

# comandos utiles
helm repo list
helm search repo prometheus
```


# Instalar el dashborad de kubernetes Nativo

```bash 
kube_dashboard_nativo.sh

## cambiar de propiedad
sudo chown -R vagrant:vagrant ./kubernetes ./.kube
sudo chmod -R 777 kube_dashboard.sh

## para el puerto ocupado
sudo lsof -i :10443
sudo kill -9 27329

kubectl delete all --all -n kubernetes-dashboard 

sudo ss -tulnp
```

