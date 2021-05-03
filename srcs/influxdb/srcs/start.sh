influx << EOF
create database if not exist telegraf_db
create user telegraf with password 'password'
grant all on telegraf_db to telegraf
EOF

exec supervisord -c /srcs/supervisord.conf
