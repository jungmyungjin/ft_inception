FROM debian:buster

# Create working directory & data
RUN mkdir -p /myNginx/data
WORKDIR /myNginx

# Install necessary tools
RUN apt-get update && apt-get install -y \
vim nginx openssl procps

# nginx
COPY conf/localhost.dev.crt /etc/ssl/certs/localhost.dev.crt
COPY conf/localhost.dev.key /etc/ssl/private/localhost.dev.key
RUN chmod 600 /etc/ssl/certs/localhost.dev.crt /etc/ssl/private/localhost.dev.key
COPY conf/default.conf /etc/nginx/sites-available/default

EXPOSE 80 443

# service start
ENTRYPOINT ["nginx", "-g", "daemon off;"]

