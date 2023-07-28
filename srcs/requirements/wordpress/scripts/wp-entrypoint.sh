#!/bin/sh

while ! mariadb -h"mariadb" -p3306 -u"wordpress" -p"anuba"; do sleep 10; echo "waiting for db ..."; done
echo "mariadb:3306 is available!"

echo "Installing wordpress..."

wp core download --allow-root;
echo "~~~~~~~~ $DATABASE ~~~~~~~~~~"
wp config create --dbname="wordpress" --dbuser="wordpress" --dbpass="anuba" --dbhost="mariadb" --allow-root;
wp core install --url=${DOMAIN_NAME} --title=TEST --admin_user="fkernbac" --admin_password="anuba" --admin_email="fra-ker@hotmail.de" --skip-email;

# wp core update --version=6.2 --force;

wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all

# wp user create ${WORDPRESS_DB_USER} fra-ker@hotmail.de --role=author --user_pass=${WORDPRESS_DB_PASSWORD} --allow-root;

# chown -R nginx:nginx /var/www/html;

echo "Wordpress ready for connections."

php-fpm81 -F;
