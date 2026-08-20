## ISTIO 

- [Documentacion para empezar](https://istio.io/latest/docs/setup/getting-started/#download)


## Instalacion "Manual"

```bash
curl -L https://istio.io/downloadIstio | sh -
# moverte a la carpeta 
cd istio-*
# y exporta el binaryio
export PATH=$PWD/bin:$PATH
## perfil por defecto
istioctl install --set profile=default -y
```

```bash
kubectl apply -f samples/addons/jaeger.yaml
kubectl apply -f samples/addons/kiali.yaml
```

### Vincular con prometeus y grafan ya instalado

Dentro del name space donde esta tu istio tienes que buscar el config-Maps de kali 

Y agregar estas lineas al config, despues reinicias el pod y listo

```yml
external_services:
  prometheus:
    url: http://prometheus-kube-prometheus-prometheus.prometheus:9090

  grafana:
    enabled: true
    in_cluster_url: http://prometheus-grafana.prometheus
```

## Instalacion con helm

```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

helm install istio-base istio/base \
  -n istio-system \
  --create-namespace

helm install istiod istio/istiod \
  -n istio-system

helm install istio-ingress istio/gateway \
  -n istio-ingress \
  --create-namespace

kubectl apply -f samples/addons/jaeger.yaml
kubectl apply -f samples/addons/kiali.yaml
kubectl apply -f samples/addons/grafana.yaml
kubectl apply -f samples/addons/prometheus.yaml
kubectl apply -f samples/addons/loki.yaml
```

### Exponer svc con ingress

Usar las plantillas de este mismo directorio para levantar los ingress que exponen la interface de kiali y grafana

```bash
./ingress.grafana.yaml
./ingress.kiali.yaml
```