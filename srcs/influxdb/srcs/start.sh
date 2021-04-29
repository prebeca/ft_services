# telegraf -sample-config --input-filter cpu:mem:disk:diskio:net:processes:system --output-filter influxdb > telegraf.conf

# influxd &

influx << EOF
create database if not exist telegraf_db
create user telegraf with password 'password'
grant all on telegraf_db to telegraf
EOF

# telegraf &

exec supervisord -c /srcs/supervisord.conf
