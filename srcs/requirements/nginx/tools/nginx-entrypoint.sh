#!/bin/sh

# Generate SSL certificate
echo "Creating SSL certificate..."
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out ${CERT} -keyout ${KEY} -subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/OU=${ADMIN_USER}/CN=${DOMAIN_NAME}/" 2>/dev/null

# Wait for WordPress container to start
echo "Waiting for WordPress container to start..."
until nc -z -v -w5 wordpress 9000; do
	sleep 5
done

echo "Nginx can access WordPress successfully."

nginx -g "daemon off;"
