# Ejemplo Manifiesto Kubernetes

- contiene ejemplos simples de recursos de Kubernetes 
  - pensados para aprender cómo se definen y despliegan objetos en un cluster. 
- Cada archivo YAML corresponde a un tipo de recurso que suele usarse en aplicaciones: 
  - namespace para aislar
  - ConfigMap para configuración
  - Deployment para desplegar pods
  - Service para exponerlos
  - ruta/ingress sencilla para tráfico HTTP

- `1_namespace.yml`: Define un `Namespace` donde se agrupan los recursos del ejemplo, útil para aislar entornos en el clúster.
- `config_maps.yml`: Contiene `ConfigMap`(s) que almacenan datos de configuración (variables, archivos pequeños) que los pods pueden consumir.
- `deployment.yml`: Declara un `Deployment` que gestiona réplicas de pods (la aplicación), incluye la imagen, réplicas y la estrategia de actualización.
- `service.yml`: Crea un `Service` para exponer los pods dentro del clúster (o hacia fuera si se ajusta el tipo), mapeando puertos y selección de labels.
- `igress_route.yml`: (nombrado como `igress_route.yml`) Ejemplo de ruta/ingress para enrutar tráfico HTTP externo hacia el `Service` del `Deployment`.

Usa estos YAMLs como referencia en tus pipelines de GitLab para aplicar (`kubectl apply -f`) y experimentar cómo cambian los recursos al actualizar la configuración o la imagen.
