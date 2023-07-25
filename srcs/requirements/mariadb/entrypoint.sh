#!/bin/sh



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

echo "Installing MariaDB..."

sed -i 's/^.*auth_pam_tool_dir.*$/#auth_pam_tool_dir not exists/' /usr/bin/mysql_install_db
mysql_install_db --user=mysql --datadir="$DATA_DIR"


# Start the MySQL server
mysqld --user=mysql --datadir="$DATA_DIR" &
MYSQL_PID=$!

# Wait for the MySQL server to start up
while ! mysqladmin ping --silent; do
    sleep 1
done

# mysqladmin password "anuba"

echo "Setting up database..."

# Perform initial setup for MariaDB, create the database, user, and grant privileges
# whoami
# echo "CREATE DATABASE:"
# mysql -p -e "CREATE DATABASE IF NOT EXISTS wordpress;"
# echo "ALTER USER:"
# mysql -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'anuba';"
# echo "CREATE USER"
# mysql -panuba -e "CREATE USER 'fkernbac'@'%' IDENTIFIED by 'anuba';"
# echo "GRANT ALL"
# mysql -panuba -e "GRANT ALL ON wordpress.* TO 'fkernbac'@'%';"
# echo "FLUSH"
# mysql -u root -panuba -e "FLUSH PRIVILEGES;"
# echo "database set up."

# Stop the MySQL server and wait for it to exit cleanly
mysqladmin -panuba shutdown

# Wait for the process to finish
wait $MYSQL_PID

echo "Creating database users..."
cat init.sql
# /usr/bin/mysqld --user=mysql --bootstrap < "init.sql"
# mysql --user=mysql < "init.sql"
mysqld < init.sql

echo "Starting MariaDB..."

# Finally, start MySQL in the foreground
exec mysqld --defaults-file=/etc/mysql/my.cnf --user=mysql --console