#!/bin/sh

cd /share_wordpress/wordpress
if [ ! -e /wordpress_workdir/wordpress/wp-config.php ]; then
	wp config create --allow-root --dbname="wordpress" --dbuser="mjung" --dbpass="123456" --dbhost=${DB_IP}
	wp core install --allow-root --url="mjung.42.fr" --title="Admin Blog" --admin_user="mjung" --admin_password="123456" --admin_email="mjung@student.42seoul.kr"
	wp user create user user@student.42seoul.kr --allow-root --user_pass=1234
fi
/usr/sbin/php-fpm7.3 -F -R