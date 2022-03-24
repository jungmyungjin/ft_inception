FROM debian:buster

# Create working directory
RUN mkdir -p /myPhp/data
WORKDIR /myPhp

# Install necessary tools
RUN apt-get update && apt-get install -y \
	vim wget php-fpm=2:7.3+69 php-mysql openssl mariadb-client procps
RUN mkdir -p /run/php

# wordpress
RUN wget https://ko.wordpress.org/latest-ko_KR.tar.gz

RUN tar -xvf latest-ko_KR.tar.gz -C /myPhp/data
COPY conf/wp-config.php /myPhp/wordpress/wp-config.php
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# service start
ENTRYPOINT  [ "/usr/sbin/php-fpm7.3", "-F", "-R" ]
