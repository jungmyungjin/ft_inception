#!/bin/sh

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create --allow-root --dbname="wordpress" --dbuser="mjung" --dbpass="123456" --dbhost="mydb"
wp core install --allow-root --url="localhost" --title="Blog Title" --admin_user="mjung" --admin_password="123456" --admin_email="mjung@student.42seoul.kr"
# chmod 777 -R ./*
/usr/sbin/php-fpm7.3 -F -R