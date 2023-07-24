#!/bin/sh

chown -R /auth_pam_tool_dir/auth_pam_tool: No such file or directory

DATA_DIR="/run/mysqld"
if [ ! -d "$DATA_DIR" ]; then
	mkdir -p $DATA_DIR
fi
chown -R mysql:mysql "$DATA_DIR"

DATA_DIR="/var/lib/mysql"
if [ ! -d "$DATA_DIR/mariadb" ]; then
  mkdir -p "$DATA_DIR"
fi
chown -R mysql:mysql "$DATA_DIR"

mysql_install_db --user=mysql --datadir="$DATA_DIR"

# Perform initial setup for MariaDB, create the database, user, and grant privileges
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "CREATE USER ${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "Starting MariaDB service..."

# Finally, start MySQL in the foreground
exec mysqld --defaults-file=/etc/mysql/my.cnf --user=mysql --console