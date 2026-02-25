# k3d

## Crear el cluster con loadbalancer

```bash 
k3d cluster create dev --servers 1 --agents 1  -p "80:80@loadbalancer" -p "8080:8080@loadbalancer"  -v /srv/gitlab:/mnt/gitlab@server:0 

kubectl get nodes
```

```bash 
# para eliminar el cluster
k3d cluster delete dev
```

# comandos pal cluster

```bash
k3d cluster stop <nombre-cluster>

# y para encenderlo otra vez:

k3d cluster start <nombre-cluster>
```

## para backups
```bash 
POD=$(kubectl get pods -n codeparce-devops -l app=gitlab -o jsonpath='{.items[0].metadata.name}')

kubectl exec -n codeparce-devops -it $POD -- bash

gitlab-backup create BACKUP=restore_gitlab_ee

kubectl get pvc -n codeparce-devops

kubectl cp gitlab/$POD:/var/opt/gitlab/backups ./backup/gitlab/config

kubectl cp gitlab/$POD:/var/opt/gitlab/backups ./backup/gitlab/data/backups

fecha=$(date +"%Y%m%d_%H%M%S")
megaName="gitlab_backup_$fecha.zip"
```