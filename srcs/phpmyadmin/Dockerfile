FROM alpine:3.13

COPY ./srcs/ ./srcs/

RUN apk add --no-cache\
	nginx \
	openssl \
	telegraf \
	supervisor \
	php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql \
	php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 \
	php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc \
	php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu \
	php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session
 
# install nginx + php
RUN adduser -D -g 'www' www

RUN mkdir /www ;\
	chown -R www:www /var/lib/nginx ;\
	chown -R www:www /www

RUN mkdir -p /run/nginx ;\
	mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig ;\
	mv /srcs/nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/ssl ;\
	openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out \
	/etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj \
	"/C=FR/ST=Ile de France/L=Paris/O=42/OU=IT Department/CN=www.phpMyAdmin.com"

# install phpmyadmin
RUN mkdir -p /usr/share/webapps/ ;\
	cd /usr/share/webapps ;\
	wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.1.0-all-languages.tar.gz ;\
	tar zxvf phpMyAdmin-5.1.0-all-languages.tar.gz ;\
	rm phpMyAdmin-5.1.0-all-languages.tar.gz ;\
	mv phpMyAdmin-5.1.0-all-languages phpmyadmin ;\
	chmod -R 777 /usr/share/webapps/ ;\
	ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin ;\
	cp /srcs/config.sample.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

# install telegraf
RUN mkdir /etc/telegraf/ ;\
	mv /srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000

CMD ["sh", "srcs/start.sh"]