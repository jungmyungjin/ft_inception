#!/bin/sh

cd /share_wordpress/wordpress
if [ ! -e /wordpress_workdir/wordpress/wp-config.php ]; then
	wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${DB_IP}
	wp core install --allow-root --url=${DOMAIN_NAME} --title="${BLOG_TITLE}" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWD} --admin_email=${ADMIN_EMAIL}
	wp user create ${GENERAL_USER} ${GENERAL_EMAIL} --allow-root --user_pass=${GENERAL_PASSWD}
fi
/usr/sbin/php-fpm7.3 -F -R