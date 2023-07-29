#!/bin/sh

while ! mariadb -h${DB_HOST} -p3306 -u${DB_USER} -p${DB_PASSWORD}; do sleep 10; echo "waiting for db ..."; done
echo "WordPress can access MariaDB successfully."

echo "Installing WordPress..."

wp core download --allow-root;
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root;
wp core install --url=${DOMAIN_NAME} --title="FKERNBAC" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email="fra-ker@hotmail.de" --skip-email;

wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all

wp user create ${WP_USER} fra-ker@hotmail.de --role=author --user_pass=${WP_PASSWORD} --allow-root;

echo "WordPress ready for connections."

php-fpm81 -F;
