FROM alpine:latest

COPY srcs /srcs

RUN apk update && apk add \
	mysql \
	mysql-client \
	openrc

# RUN mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf.orig ;\
# 	mv /srcs/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# RUN mv /srcs/my.cnf /etc/my.cnf

# RUN rmdir /var/lib/mysql/

# RUN chown mysql /var/lib/mysql
# RUN /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

# RUN openrc ;\
# 	mkdir /run/mysqld/

CMD ["sh", "/srcs/start.sh"]

EXPOSE 3306