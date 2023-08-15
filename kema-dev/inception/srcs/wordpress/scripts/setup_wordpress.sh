#!/bin/sh

while ! mariadb -h"mariadb" -P3306 -u"wordpress" -p"wordpress"; do sleep 10; echo "waiting for db ..."; done
wp config create --dbname="wordpress" --dbuser="wordpress" --dbpass="wordpress" --dbhost="mariadb" --allow-root;
wp core install --url="jjourdan.42.fr" --title="PIKA PIKA" --admin_user="kema" --admin_password="pwd" --admin_email="kema@mgc.com" --skip-email

wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all

# wp user create pikachu pikachu@pokemon.com --role=author --user_pass=pikachu
# wp post create --post_title="PIKA PIKA" --post_content="CHUUUUUU" --post_status=publish --post_author="pikachu"

php-fpm81 -F;
