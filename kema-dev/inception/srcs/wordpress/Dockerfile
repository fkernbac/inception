FROM alpine:3.17

RUN			apk update && apk upgrade && apk add --no-cache		\
											php				\
											php-fpm			\
											php-phar			\
											php-json			\
											php-mysqli			\
											php-curl			\
											php-iconv			\
											# php-pecl-mailparse	\
											curl				\
											mariadb-client		\
											bash				\
											wget				\
											curl

RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
			chmod +x wp-cli.phar &&	\
			cp wp-cli.phar /usr/bin/wp

WORKDIR		/var/www/wordpress

RUN			wp core download

RUN			adduser -S nginx &&	\
			addgroup -S nginx

RUN			mkdir /var/log/php-fpm
COPY		./config/php-fpm.conf /etc/php81/php-fpm.conf
COPY		./config/www.conf /etc/php81/php-fpm.d/www.conf

COPY		./scripts /tmp/scripts
RUN			chmod -R +x /tmp/scripts

ENTRYPOINT ["bash", "/tmp/scripts/setup_wordpress.sh"]
