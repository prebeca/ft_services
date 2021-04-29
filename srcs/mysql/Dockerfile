FROM alpine:3.13

COPY srcs /srcs

RUN apk add --no-cache\
	mysql \
	telegraf \
	supervisor \
	mysql-client \
	openrc

# RUN mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf.orig ;\
# 	mv /srcs/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# RUN mv /srcs/my.cnf /etc/my.cnf

RUN rmdir /var/lib/mysql/ ;\
	rmdir /etc/mysql

# RUN chown mysql /var/lib/mysql
# RUN /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

# RUN openrc ;\
# 	mkdir /run/mysqld/

RUN mkdir /etc/telegraf/ ;\
	mv /srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD ["sh", "/srcs/start.sh"]

EXPOSE 3306