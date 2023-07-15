echo "Waiting for mariadb:3306..."
until nc -z "mariadb" "3306"; do
	timeout=timeout - 15;
	if ["timeout" -eq 0]; then
		echo >&2 "Timeout occured while waiting for mariadb"
		exit 1
	fi
	sleep 1
done

echo "mariadb:3306 is available!"

echo "Installing wordpress..."

wp core download --allow-root;
wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root;
wp core install --url=${DOMAIN_NAME}/wordpress --title=TEST --admin_user=fkernbac --admin_password=anuba --admin_email=fra-ker@hotmail.de --skip-email --allow-root;
wp user create fkernbac fra-ker@hotmail.de --role=author --user_pass=anuba --allow-root;

echo "Wordpress ready for connections."

php-fpm81 -F;
