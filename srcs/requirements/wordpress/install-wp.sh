until nc -z "mariadb" "3306"; do
	echo "Waiting for mariadb:3306..."
	sleep 10
done

echo "mariadb:3306 is available!"

echo "Installing wordpress..."

wp core download --allow-root;
wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root;
wp core install --url=${DOMAIN_NAME} --title=TEST --admin_user=fkernbac --admin_password=anuba --admin_email="fra-ker@hotmail.de" --skip-email --allow-root;

wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all

wp user create ${WORDPRESS_DB_USER} fra-ker@hotmail.de --role=author --user_pass=${WORDPRESS_DB_PASSWORD} --allow-root;

chown -R nginx:nginx /var/www/html;
wp config set WP_DEBUG true --raw;
wp config set WP_DEBUG_LOG true --raw;


echo "Wordpress ready for connections."

php-fpm81 -F;
