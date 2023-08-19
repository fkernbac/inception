#!/bin/sh

echo "Installing MariaDB..."

# Start the MySQL server
mariadbd -uroot & MYSQL_PID=$!

# Wait for the MySQL server to start up
while ! mysqladmin ping --silent; do
	sleep 1
done

# Perform initial setup for MariaDB, create the database, user, and grant privileges
echo "Setting up database..."
mariadb -e "$(eval "echo \"$(cat init.sql)\"")"

# Stop the MySQL server and wait for it to exit cleanly
mysqladmin -p$ADMIN_PASSWORD shutdown
wait $MYSQL_PID

# Finally, start MySQL in the foreground
echo "MariaDB initialized successuflly."
mariadbd -uroot
