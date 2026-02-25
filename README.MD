# Primeros pasos kubernetes en linux

**! Pasos previio** docker y realizar el control de logs 

- [Instalar docker](https://docs.docker.com/engine/install/ubuntu/)
- [Configurar grupo para docker](https://docs.docker.com/engine/install/linux-postinstall/)
- [Control de logs](https://docs.docker.com/engine/logging/configure/) 

### Instalar actualizaciones y deps
```bash 
sudo apt update
sudo apt install -y curl ca-certificates gnupg lsb-release apt-transport-https openssh-server
sudo systemctl status ssh
```

## Instalar kbctl

- [Link de la documentacion kbctl ](https://k8s-docs.netlify.app/es/docs/tasks/tools/install-kubectl/) 

## Instalar k3d O  Minikube

```bash 
# instala k3d (script oficial)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# verifica
k3d version
```

- [Link de la documentacion minikube ] https://k8s-docs.netlify.app/es/docs/tasks/tools/install-minikube/

### Pasos despues de la instalacion con Minikube

```bash 
# Inicializar un closter type dev

minikube start -p dev

# Listar clusters en el server
minikube profile list

# Seleccionar el perfilr
minikube profile dev

# Validar estado del closther
minikube status 

# mirar dashboard
minikube dashboard --url

```


