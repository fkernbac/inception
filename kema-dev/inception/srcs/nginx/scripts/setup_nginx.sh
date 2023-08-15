#!/bin/sh

# mkdir -p /etc/openssl
# openssl req -newkey rsa:4096				\
# 	-x509									\
# 	-nodes									\
# 	-out "/etc/ssl/jjourdan.42.fr.cert"		\
# 	-keyout "/etc/ssl/jjourdan.42.fr.key"	\
# 	-subj "/C=FR/CN=jjourdan.42.fr"
	# -out ${CERT_PATH}		\
	# -keyout ${KEY_PATH}	\
	# -subj "/C=FR/CN=${DOMAIN_NAME}"
# sed -i "s~CERT_TEMPLATE~/etc/ssl/jjourdan.42.fr.cert~g" /etc/nginx/nginx.conf
# sed -i "s~CERT_TEMPLATE~${CERT_PATH}~g" /etc/nginx/nginx.conf
# sed -i "s~KEY_TEMPLATE~/etc/ssl/jjourdan.42.fr.key~g" /etc/nginx/nginx.conf
# sed -i "s~KEY_TEMPLATE~${KEY_PATH}~g" /etc/nginx/nginx.conf
# sed -i "s/TLS_VERSION_TEMPLATE/1.3/g" /etc/nginx/nginx.conf
# sed -i "s/TLS_VERSION_TEMPLATE/${TLS_VERSION}/g" /etc/nginx/nginx.conf
# sed -i "s/SERVER_NAME_TEMPLATE/jjourdan.42.fr/g" /etc/nginx/nginx.conf
# sed -i "s/SERVER_NAME_TEMPLATE/${DOMAIN_NAME}/g" /etc/nginx/nginx.conf
# sed -i "s/PHP_FPM_HOST_TEMPLATE/wordpress/g" /etc/nginx/nginx.conf
# sed -i "s/PHP_FPM_HOST_TEMPLATE/${PHP_FPM_HOST}/g" /etc/nginx/nginx.conf
# sed -i "s/PHP_FPM_PORT_TEMPLATE/9000/g" /etc/nginx/nginx.conf
# sed -i "s/PHP_FPM_PORT_TEMPLATE/${PHP_FPM_PORT}/g" /etc/nginx/nginx.conf


nginx -g "daemon off;"
