# Primeros pasos kubernetes en ubunto

**! Pasos previio** se debe instalar openssh, docker y realizar el control de logs 

- Instalacion de openSSH
```bash
sudo apt update
sudo apt install openssh-server
sudo systemctl status ssh
```

- [Instalar docker](https://docs.docker.com/engine/install/ubuntu/)
- [Configurar grupo para docker](https://docs.docker.com/engine/install/linux-postinstall/)
- [Control de logs](https://docs.docker.com/engine/logging/configure/) 


## Instalar kbctl

- [Link de la documentacion kbctl ](https://k8s-docs.netlify.app/es/docs/tasks/tools/install-kubectl/) 

## Instalar Minikube

- [Link de la documentacion minikube ] https://k8s-docs.netlify.app/es/docs/tasks/tools/install-minikube/


### Pasos despues de la instalacion 

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


