FROM alpine:3.17

#install php-fpm
RUN apk update && apk add php81 php81-fpm php81-opcache
#install php modules
RUN apk add php81-gd php81-mysqli php81-zlib php81-curl

#install wordpress
RUN mkdir -p /var/www/html
RUN chown -R nobody:nobody /var/www/html

RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
	tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
	rm /tmp/wordpress.tar.gz

RUN ls -la /var/www/html

CMD ["php-fpm81", "-F"]
