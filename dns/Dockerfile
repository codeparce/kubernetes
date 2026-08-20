FROM alpine:latest

# Instalar dnsmasq
RUN apk add --no-cache dnsmasq

# Copiar la configuración
COPY dnsmasq.conf /etc/dnsmasq.conf

# Exponer el puerto DNS (UDP y TCP)
EXPOSE 53/udp
EXPOSE 53/tcp

# Ejecutar dnsmasq
CMD ["dnsmasq"]
