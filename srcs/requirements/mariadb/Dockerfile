# Use Alpine Linux as the base image
FROM alpine:3.17

# Install MariaDB and other required packages
RUN apk update && apk add --no-cache mariadb mariadb-client

# Copy custom configuration files
COPY my.cnf /etc/mysql/my.cnf

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start MariaDB
ENTRYPOINT ["/entrypoint.sh"]

# By default, run the MySQL daemon in the foreground
CMD ["mysqld", "--user=mysql", "--console"]
