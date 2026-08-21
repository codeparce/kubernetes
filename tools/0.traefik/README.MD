# Instalar Traefik en el cluster

Esta practica replica bien como se debe crear este servicio en la nube

- Nota: esto normalmente se hace cuando el cluster esta recien creado
  - En k3d lo crea automaticamente, pero para hacer la practica de instalar el servicio se debe crear el cluster con la etiqueta `--k3s-arg "--disable=traefik@server:0"`
    - [Documentacion clave del traefik](https://doc.traefik.io/traefik/setup/kubernetes/)

- [Artifacs Helm Traefik](https://artifacthub.io/packages/helm/traefik/traefik)



### Paso importante

```bash
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.5.1/standard-install.yaml
```

### Descargas el repo y creas el name space

```bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
kubectl create namespace traefik
```

## Instalas el traefik con el values de ejemplo
``` bash
# Install the chart into the 'traefik' namespace
helm install traefik traefik/traefik \
  --namespace traefik \
  --values values.yaml
```


# PLUS + Instalar Certmanager (Solo en la nube)

- [Artifacts helm chart](https://artifacthub.io/packages/helm/cert-manager/cert-manager)

- [Configurar el Issuer](https://cert-manager.io/docs/configuration/acme/) 

```bash
helm install \
  cert-manager oci://quay.io/jetstack/charts/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.21.1 \
  --set crds.enabled=true \
  --set config.enableGatewayAPI=true
```


# Gateway API

https://gateway-api.sigs.k8s.io/guides/getting-started/introduction/
https://artifacthub.io/packages/helm/nicklasfrahm-gateway-api/gateway-api

```bash
kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.6.1/standard-install.yaml

```