FROM	alpine:3.17

RUN		apk update && apk upgrade && apk add --no-cache openssl nginx

# RUN		rm -f /etc/nginx/nginx.conf
COPY	./config/nginx.conf /etc/nginx/nginx.conf

# RUN		mkdir -p /run/nginx
# RUN		chown nobody:nobody /run/nginx

COPY	tools/nginx-entrypoint.sh /nginx-entrypoint.sh
RUN		chmod -R +x /nginx-entrypoint.sh

EXPOSE	443

ENTRYPOINT	["sh", "nginx-entrypoint.sh"]

