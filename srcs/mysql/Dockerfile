FROM alpine:3.13

COPY srcs /srcs

RUN apk add --no-cache\
	mysql \
	telegraf \
	supervisor \
	mysql-client \
	openrc

RUN rmdir /var/lib/mysql/ ;\
	rmdir /etc/mysql

RUN mkdir /etc/telegraf/ ;\
	mv /srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD ["sh", "/srcs/start.sh"]

EXPOSE 3306