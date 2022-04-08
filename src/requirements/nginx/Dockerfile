FROM debian:buster

# Create working directory & data
RUN mkdir /nginx_workdir
RUN mkdir /share_wordpress
WORKDIR /nginx_workdir

# Install necessary tools
RUN apt-get update && apt-get install -y \
vim nginx openssl procps gettext-base wget

# nginx
COPY conf/server.crt /etc/ssl/certs/server.crt
COPY conf/server.key /etc/ssl/private/server.key
RUN chmod 600 /etc/ssl/certs/server.crt /etc/ssl/private/server.key
COPY tools/defualt.conf.template /nginx_workdir/defualt.conf.template

EXPOSE 443

# DOCKERIZE
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz


# service start
COPY tools/entrypoint.sh /nginx_workdir/entrypoint.sh
RUN chmod 755 /nginx_workdir/entrypoint.sh

ENTRYPOINT ["/nginx_workdir/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
