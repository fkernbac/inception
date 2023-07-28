CREATE USER wordpress@'%' IDENTIFIED by 'wordpress';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON "wordpress.*" TO "wordpress"@'%';
FLUSH PRIVILEGES;
