# Kubernetes Learning

## Crear un pod

```bash
kubectl run <name_pod> --image=<name_images> --port=80 80
# ver detalle del pod 
kubectl describe pod <name_pod>
```

## Crear un service 

```bash
kubectl expose pod <name_pod> --type=LoadBalancer --port=8080 --target-port=80
# ver listar servicios 
kubectl get services
# ver detalle del pod 
kubectl describe service <name_service>

#get service url 
minikube service --url <name_service>
```


## Crear y eliminar soluciones

dentro de la carpeta donde tienes tus archivoz .yml realizar estos comandos 

```bash
kubectl apply -f ./ OR ./name_file
kubectl delete -f ./ OR ./name_file
```

## Establecer el name space por defecto para no usar flag -n
Es muy recomendable si se trabaja en un name space en especifico

```bash 
kubectl config set-context --current --namespace=mi-namespace
```

## Entrar por linea de comando a un pod

Si tiene establecido un name space por defecto no se coloca el flag -n
```bash 
kubectl exec -it gitlab-deployment-77f476f7d8-8g545 -n codeparce-devops -- bash
```



# Cluester info

## mostrar nodos 
```bash
kubectl get nodes
```

## Detalle del nodo
```bash
kubectl describe node node1
```

## Ver dónde están tus aplicaciones (pods)
```bash
kubectl get pods -o wide -n default
```

## Ver dónde están tus aplicaciones (pods)
```bash
kubectl describe deployment "deplyment-name" -n default
```
