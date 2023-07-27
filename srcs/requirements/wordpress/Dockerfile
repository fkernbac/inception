FROM alpine:3.17

#install php-fpm
RUN apk update && apk add php php-fpm php-opcache mariadb-client
#install php modules
RUN apk add php-gd php-mysqli php-zlib php-curl php-tokenizer
RUN apk add php-common php-cgi php-zip php-mbstring php-xml php-json php-openssl php-ctype php-bcmath openrc
RUN apk add php-iconv
# needed for wp-cli
RUN apk add php-phar php-mbstring

#install wordpress
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# Download wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Make it executable
RUN chmod +x wp-cli.phar
# Move it into /usr/local/bin/wp
RUN mv wp-cli.phar /usr/local/bin/wp
# Check whether the installation worked
RUN wp --info

RUN			adduser -S nginx &&	\
			addgroup -S nginx
RUN chown -R nginx:nginx /var/www/

COPY install-wp.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install-wp.sh
ENTRYPOINT ["sh", "/usr/local/bin/install-wp.sh"]

CMD ["php-fpm81", "-F"]
