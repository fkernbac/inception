FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

RUN	mkdir -p /run/mysqld && mkdir -p /var/lib/mysql
RUN	chown -R root:root /run/mysqld && chown mysql:mysql /var/lib/mysql
RUN	mariadb-install-db --user=mysql --datadir='/var/lib/mysql'

COPY	./config/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN		chown -R root:root /etc/my.cnf.d

COPY	./tools /tmp/tools
RUN		chown -R root:root /tmp/tools

WORKDIR		/tmp/tools

ENTRYPOINT ["sh", "mariadb-entrypoint.sh"]

