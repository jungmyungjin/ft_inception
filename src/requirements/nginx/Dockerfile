FROM debian:buster

# Create working directory & data
RUN mkdir /nginx_workdir
RUN mkdir /share_wordpress
WORKDIR /nginx_workdir

# Install necessary tools
RUN apt-get update && apt-get install -y \
vim nginx openssl procps

# nginx
COPY conf/server.crt /etc/ssl/certs/server.crt
COPY conf/server.key /etc/ssl/private/server.key
RUN chmod 600 /etc/ssl/certs/server.crt /etc/ssl/private/server.key
COPY conf/default.conf /etc/nginx/sites-available/default

EXPOSE 443

# service start
ENTRYPOINT ["nginx", "-g", "daemon off;"]

