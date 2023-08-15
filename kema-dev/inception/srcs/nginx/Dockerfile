FROM		alpine:3.17

RUN			apk update && apk upgrade && apk add --no-cache openssl nginx

RUN			rm -f /etc/nginx/nginx.conf
COPY		./config/nginx.conf /etc/nginx/nginx.conf

RUN			mkdir -p /run/nginx
RUN			chown nginx:nginx /run/nginx

COPY		scripts/setup_nginx.sh /setup_nginx.sh
RUN			chmod -R +x /setup_nginx.sh

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -nodes -out "/etc/ssl/jjourdan.42.fr.cert" -keyout "/etc/ssl/jjourdan.42.fr.key" -subj "/C=FR/CN=jjourdan.42.fr"

EXPOSE		443

ENTRYPOINT	["sh", "setup_nginx.sh"]
