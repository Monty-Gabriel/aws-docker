
FROM nginx:latest
RUN mkdir -p /var/www/html
ENV NGINX_CONF /etc/nginx/conf.d/default.conf
COPY ./nginx.conf $NGINX_CONFIG
ADD ./aplicacao/app /var/www/html/site
ADD ./aplicacao/app /usr/share/nginx/html
EXPOSE 80
LABEL description="VIA CEP DOCKER"

