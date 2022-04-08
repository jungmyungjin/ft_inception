FROM debian:buster

# Create working directory
RUN mkdir -p /wordpress_workdir/data
RUN mkdir -p /share_wordpress

WORKDIR /wordpress_workdir

# Install necessary tools
RUN apt-get update && apt-get install -y \
	vim wget curl php-fpm=2:7.3+69 php-mysql openssl mariadb-client procps \
	php-cgi php-common php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext
RUN mkdir -p /run/php

# wordpress
RUN wget https://ko.wordpress.org/latest-ko_KR.tar.gz
RUN tar -xvf latest-ko_KR.tar.gz -C /share_wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# DOCKERIZE
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# wordpress 자동설치
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# service start
COPY tools/entrypoint.sh /nginx_workdir/entrypoint.sh
RUN chmod 755 /nginx_workdir/entrypoint.sh
ENTRYPOINT ["/wordpress_workdir/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F", "-R"]
