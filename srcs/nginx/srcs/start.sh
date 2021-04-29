#!/bin/sh

exec supervisord -c /srcs/supervisord.conf
# exec nginx -c /etc/nginx/nginx.conf &
# exec telegraf &

# wait

# exit 1
# tail -F /dev/null

# telegraf &
# nginx -c /etc/nginx/nginx.conf