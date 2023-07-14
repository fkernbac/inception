FROM alpine:3.17

#install php-fpm
RUN apk update && apk add php81 php81-fpm php81-opcache mariadb-client
#install php modules
RUN apk add php81-gd php81-mysqli php81-zlib php81-curl php81-phar

#install wordpress
RUN mkdir -p /var/www/html
RUN chown -R nobody:nobody /var/www/html


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

WORKDIR /var/www/html/wordpress
COPY install-wp.sh .
RUN chmod +x install-wp.sh

ENTRYPOINT ["sh", "/var/www/html/wordpress/install-wp.sh"]

CMD ["php-fpm81", "-F"]
