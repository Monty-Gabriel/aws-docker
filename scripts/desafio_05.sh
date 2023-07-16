#!/bin/bash

echo "Creando archivo Dockerfile..."
echo '
FROM nginx:latest
RUN mkdir -p /var/www/html
ENV NGINX_CONF /etc/nginx/conf.d/default.conf
COPY ./nginx.conf $NGINX_CONFIG
ADD ./aplicacao/app /var/www/html/site
ADD ./aplicacao/app /usr/share/nginx/html
EXPOSE 80
LABEL description="VIA CEP DOCKER"
' > Dockerfile

echo "Ejecutando docker build..."
docker build -t viacep-docker-image-script-sh .

echo "Creando container con Docker..."
docker run -d -m 512m -p 80:80 --name via-cep-script-sh --network rede-redis viacep-docker-image-script-sh

echo "Script ejecutado correctamente"

# Pregunta al usuario si desea ejecutar el comando docker stats
read -p "¿Deseas ejecutar 'docker stats via-cep-script-sh'? (S/N): " respuesta

if [ "$respuesta" == "S" ] || [ "$respuesta" == "s" ]; then
    # Ejecuta el comando docker stats
    docker stats via-cep-script-sh
fi
