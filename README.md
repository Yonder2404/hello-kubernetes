# Hello Kubernetes!
Esta imagen de contenedor se puede implementar en un clúster de Kubernetes. Cuando se accede a través de un navegador web en el puerto `8080`, se mostrará:
- un mensaje predeterminado ** ¡Hola mundo! **
- el nombre del pod
- información del sistema operativo del nodo

![¡Hola Mundo! de la imagen de hello-kubernetes] (hello-kubernetes.png)

El predeterminado "¡Hola mundo!" El mensaje que se muestra se puede anular usando la variable de entorno `MESSAGE`. El puerto predeterminado de 8080 se puede anular utilizando la variable de entorno `PORT`.

## Deploy

### Standard Configuration

Deploy to your Kubernetes cluster using the hello-kubernetes.yaml, which contains definitions for the service and deployment objects:

```bash
$ kubectl apply -f yaml/hello-kubernetes-ns.yaml
```
```bash
$ kubectl apply -f yaml/hello-kubernetes.yaml
```

Esto mostrará un ¡Hola mundo! mensaje cuando llega al punto final del servicio en un navegador. Puede obtener la dirección IP del punto final del servicio ejecutando el siguiente comando y tomando el valor de la dirección IP externa devuelta:

```bash
$ kubectl get service hello-kubernetes
```

### Customise Message

Puede personalizar el mensaje que muestra el contenedor hello-kubernetes. Implementar usando hello-kubernetes.custom-message.yaml, que contiene definiciones para el servicio y los objetos de implementación.

En la definición de la implementación, agregue una variable env con el nombre MESSAGE. El valor que proporcione se mostrará como mensaje personalizado.

```bash
$ kubectl apply -f yaml/hello-kubernetes.custom-message.yaml
```

### Specify Custom Port

De forma predeterminada, la aplicación hello-kubernetes escucha en el puerto 8080. Si tiene un requisito para que la aplicación escuche en otro puerto, puede especificar el puerto a través de una variable env con el nombre de PORT. Recuerde también actualizar el valor de containers.ports.containerPort para que coincida.


## Build Container Image

Si desea crear la imagen usted mismo, puede hacerlo de la siguiente manera. Los parámetros build-arg proporcionan metadatos tal como se definen en las anotaciones de especificaciones de imagen OCI
Bash
```bash
$ docker build --no-cache --build-arg IMAGE_VERSION="1.8" --build-arg IMAGE_CREATE_DATE="`date -u +"%Y-%m-%dT%H:%M:%SZ"`" --build-arg IMAGE_SOURCE_REVISION="`git rev-parse HEAD`" -f Dockerfile -t "nombre de la imagen" app
```

