FROM debian:buster

# Create working directory
RUN mkdir -p /wordpress_workdir/data
RUN mkdir /share_wordpress

WORKDIR /wordpress_workdir

# Install necessary tools
RUN apt-get update && apt-get install -y \
	vim wget curl php-fpm=2:7.3+69 php-mysql openssl mariadb-client procps \
	php-cgi php-common php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext
RUN mkdir -p /run/php

# wordpress
RUN wget https://ko.wordpress.org/latest-ko_KR.tar.gz
RUN tar -xvf latest-ko_KR.tar.gz -C /share_wordpress
COPY conf/wp-config.php /share_wordpress/wordpress/wp-config.php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf


# wordpress 자동설치
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --allow-root
# RUN wp config create --allow-root --dbname="wordpress" --dbuser="mjung" --dbpass="123456" --dbhost="mydb"
# RUN wp core install --allow-root --url="localhost" --title="Blog Title" --admin_user="mjung" --admin_password="123456" --admin_email="mjung@student.42seoul.kr"

# service start
COPY ./conf/entrypoint.sh /wordpress_workdir/.
RUN chmod +x /wordpress_workdir/entrypoint.sh 
ENTRYPOINT /wordpress_workdir/entrypoint.sh
