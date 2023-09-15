#!/bin/sh

echo "Waiting for MariaDB container to start..."
sleep 10
while ! mariadb -h${DB_HOST} -p3306 -u${DB_USER} -p${DB_PASSWORD}; do sleep 10; done
echo "WordPress can access MariaDB successfully."

if wp core is-installed 2>/dev/null; then
	echo "WordPress installation found."
else
	echo "Installing WordPress..."

	wp core download > /dev/null
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST}
	wp core install --url=${DOMAIN_NAME} --title="INCEPTION" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email="admin@email.de" --skip-email

	wp theme install twentyseventeen --activate
	wp plugin update --all > /dev/null

	wp user create ${WP_USER} user@email.de --role=author --user_pass=${WP_PASSWORD}
fi

echo "WordPress ready for connections."

php-fpm81 -F
