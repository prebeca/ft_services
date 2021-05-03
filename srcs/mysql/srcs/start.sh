openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart

if [ ! -d /var/lib/mysql/wordpress ]
then
mysql --user=root << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'user';
GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'user' WITH GRANT OPTION;
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
mysql --user=root wordpress < /srcs/wordpress.sql
fi


service mariadb stop

exec supervisord -c /srcs/supervisord.conf
