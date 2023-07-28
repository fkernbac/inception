CREATE USER wordpress@'%' IDENTIFIED by 'anuba';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON "wordpress.*" TO "wordpress"@'%';
FLUSH PRIVILEGES;
