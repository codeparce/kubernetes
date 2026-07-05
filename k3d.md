# k3d

# Instalar k3d

```bash 
# INSTALAR  k3d (script oficial)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# verifica
k3d version
```

## Crear el cluster con loadbalancer

```bash 
k3d cluster create dev \
  --servers 1 --agents 1 \
  -p "80:80@loadbalancer" -p "8080:8080@loadbalancer"  -p "443:443@loadbalancer" \ 
  #-v /srv:/mnt@all
  #--servers-memory 3g --agents-memory 3g \
  #--servers-cpu 1 --agents-cpu 2 \
```

###  comandos pal cluster

```bash
k3d cluster stop <nombre-cluster>
# y para encenderlo otra vez:
k3d cluster start <nombre-cluster>
# obtener nodos
kubectl get nodes
# para eliminar el cluster
k3d cluster delete dev
```