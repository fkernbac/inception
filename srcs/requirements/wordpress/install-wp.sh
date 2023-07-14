wp core download --allow-root;
wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root;
# wp core install --url=${DOMAIN_NAME}/wordpress --title=TEST --admin_user=fkernbac --admin_password=anuba --admin_email=fra-ker@hotmail.de --skip-email --allow-root;
# wp user create fkernbac fra-ker@hotmail.de --role=author --user_pass=anuba --allow-root;

php-fpm81 -F;