FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache nginx

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]