# sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# sed -i "s|.*skip-networking.*|skip-networking|g" /etc/mysql/my.cnf
# sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

# mysql_install_db --user=root
# /usr/bin/mysql_install_db --user=mysql --datadir="/mnt/mysql"
# /usr/bin/mysqld_safe --datadir="/mnt/mysql"
# mysqld
# touch /run/openrc/softlevel
# /etc/init.d/mariadb setup

# mysqld --user=root &
# rc-update add mysqld default
# rc-update add mariadb default

# echo > /tmp/tmpsql \
# "CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS root IDENTIFIED BY 'password';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%';
# FLUSH PRIVILEGES;
# GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
# GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
# GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'password';
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
# GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
# FLUSH PRIVILEGES;"

# mysql -e /tmp/tmpsql

# /usr/share/mariadb/mysql.server stop
# /usr/share/mariadb/mysql.server start

# exec /usr/bin/mysqld --user=root --console &
# mariadb &
# mysqld --default-authentication-plugin=mysql_native_password
# sh

# mkdir -p /run/mysqld
# mysql_install_db --user=root
# echo "CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS 'wp_admin' IDENTIFIED BY 'admin';
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'wp_admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
# FLUSH PRIVILEGES;" | mysqld -u root --bootstrap
# mysqld -u root

# /usr/bin/mysql_install_db --user=mysql
# /etc/init.d/mariadb start && rc-update add mariadb default
# /usr/bin/mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"
# echo "CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS 'root' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
# FLUSH PRIVILEGES;" | mysql -u root -p
# mysql -u root

# telegraf &

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
# mariadbd --basedir=/usr --datadir=/var/lib/mysql
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
