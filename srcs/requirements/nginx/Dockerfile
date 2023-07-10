FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/fkernbac.crt -keyout /etc/nginx/fkernbac.key -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42Heilbronn/OU=fkernbac/CN=fkernbac.42.fr/"

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]