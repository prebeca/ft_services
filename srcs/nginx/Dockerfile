FROM alpine:3.13

COPY ./srcs/ ./srcs/

RUN apk add --no-cache\
	nginx \
	openssl \
	telegraf \
	supervisor

RUN adduser -D -g 'www' www

RUN mkdir /www ;\
	chown -R www:www /var/lib/nginx ;\
	chown -R www:www /www

RUN mkdir -p /run/nginx ;\
	mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig ;\
	mv /srcs/nginx.conf /etc/nginx/nginx.conf ;\
	mv /srcs/index.html /www/index.html

RUN mkdir /etc/nginx/ssl ;\
	openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out \
	/etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj \
	"/C=FR/ST=Ile de France/L=Paris/O=42/OU=IT Department/CN=www.nginx.com"

RUN mkdir /etc/telegraf/ ;\
	mv /srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD sh /srcs/start.sh

EXPOSE 80
EXPOSE 443