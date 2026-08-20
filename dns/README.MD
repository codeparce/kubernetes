# DNS local 

Para no estar creando dns en el etc/hosts , recomendable hacer este paso si estas en linux


## Crear y correr el mini servidor DNS

```bash
podman build -t my-dnsmasq .

podman rm -f coredns

podman run -d --name coredns --restart unless-stopped --net=host my-dnsmasq
```

## Agregar el server DNS al archivo de configuracion

```bash
sudo mkdir -p /etc/systemd/resolved.conf.d/
sudo nano /etc/systemd/resolved.conf.d/lab.conf

[Resolve]
DNS=127.0.0.1:5353
Domains=~lab

sudo systemctl restart systemd-resolved
```