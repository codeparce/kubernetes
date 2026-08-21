# k3d

- [Documentacion clave si usas podman](https://k3d.io/v5.8.1/usage/advanced/podman/)

## Instalar k3d

```bash 
# INSTALAR  k3d (script oficial)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# verifica
k3d version
```

### Crear el cluster con loadbalancer

```bash 
k3d cluster create test --servers 1 --servers-memory 3g --agents 1 --agents-memory 4g -p "80:80@loadbalancer" -p "443:443@loadbalancer" --k3s-arg "--disable=traefik@server:0"
  # para desabilitar trafik

  #--servers-cpu 1 --agents-cpu 2 \
```

####  comandos pal cluster

```bash
## more commands : https://k3d.io/v5.9.0/usage/commands/k3d/

k3d cluster stop <nombre-cluster>
# y para encenderlo otra vez:
k3d cluster start <nombre-cluster>
# obtener nodos
kubectl get nodes
# para eliminar el cluster
k3d cluster delete dev
```