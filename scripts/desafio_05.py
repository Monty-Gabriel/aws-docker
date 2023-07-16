import os, subprocess

print("Creando archivo Dockerfile...")
with open("Dockerfile", "w") as file:
    file.write("""FROM nginx:latest
RUN mkdir -p /var/www/html
ENV NGINX_CONF /etc/nginx/conf.d/default.conf
COPY ./nginx.conf $NGINX_CONFIG
ADD ./aplicacao/app /var/www/html/site
ADD ./aplicacao/app /usr/share/nginx/htm
POSE 80
LABEL description="VIA CEP DOCKER"
""")

print("Ejecutando docker build...")
subprocess.run(["docker", "build", "-t", "viacep-docker-image-py", "."])

print("Creando container con Docker...")
subprocess.run(["docker", "run", "-d", "--memory=512m", "-p", "80:80", "--name", "via-cep-script-py", "--network", "rede-redis", "viacep-docker-image-py"])

print("Script ejecutado correctamente")

# Pregunta al usuario si desea ejecutar el comando docker stats
ejecutar_stats = input("¿Deseas ejecutar 'docker stats via-cep-script-py'? (S/N): ")

if ejecutar_stats.lower() == "s":
    # Ejecuta el comando docker stats
    subprocess.run(["docker", "stats", "via-cep-script-py"])
