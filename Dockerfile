FROM node:13.6.0-alpine

ARG IMAGE_CREATE_DATE
ARG IMAGE_VERSION
ARG IMAGE_SOURCE_REVISION

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="Hello Kubernetes!" \
      org.opencontainers.image.description="Proporciona una imagen de demostración para implementar en un clúster de Kubernetes. Muestra un mensaje, el nombre del pod y los detalles del nodo en el que se implementa." \
      org.opencontainers.image.created=$IMAGE_CREATE_DATE \
      org.opencontainers.image.version=$IMAGE_VERSION \
      org.opencontainers.image.authors="Yonder Perez" \
      org.opencontainers.image.url="https://registry-devsecops.intelix.biz/" \
      org.opencontainers.image.documentation="https://git.intelix.biz/devsecops/hello-intelix/-/blob/master/README.md" \
      org.opencontainers.image.vendor="Yonder Perez" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://registry-devsecops.intelix.biz/" \
      org.opencontainers.image.revision=$IMAGE_SOURCE_REVISION 

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

USER node
CMD [ "npm", "start" ]
