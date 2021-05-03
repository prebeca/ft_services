#!/bin/sh

FTP_USERNAME=user;
FTP_PASSWORD=user;

echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser -h /mnt/ftps/$FTP_USERNAME $FTP_USERNAME

exec supervisord -c /srcs/supervisord.conf
