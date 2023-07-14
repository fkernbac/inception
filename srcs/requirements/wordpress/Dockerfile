FROM alpine:3.17

#install php-fpm
RUN apk update && apk add php81 php81-fpm php81-opcache mariadb-client
#install php modules
RUN apk add php81-gd php81-mysqli php81-zlib php81-curl
# needed for wp-cli
RUN apk add php81-phar php81-mbstring

#install wordpress
RUN mkdir -p /var/www/html/wordpress
RUN chown -R nobody:nobody /var/www/html
RUN chown -R nobody:nobody /var/www/html/wordpress

# RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
# 	tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
# 	rm /tmp/wordpress.tar.gz

# Download wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Make it executable
RUN chmod +x wp-cli.phar
# Move it into /usr/local/bin/wp
RUN mv wp-cli.phar /usr/local/bin/wp
# Check whether the installation worked
RUN wp --info

COPY install-wp.sh /var/www/html/wordpress
RUN chmod +x /var/www/html/wordpress/install-wp.sh
RUN ls -l /var/www/html/wordpress

ENTRYPOINT ["sh", "/var/www/html/wordpress/install-wp.sh"]

CMD ["php-fpm81", "-F"]
