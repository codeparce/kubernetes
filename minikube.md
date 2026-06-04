# minikube 

- [Link de la documentacion minikube](https://k8s-docs.netlify.app/es/docs/tasks/tools/install-minikube/) 


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