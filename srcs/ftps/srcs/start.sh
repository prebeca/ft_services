#!/bin/sh

# telegraf &

FTP_USERNAME=user;
FTP_PASSWORD=user;

echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser -h /mnt/ftps/$FTP_USERNAME $FTP_USERNAME
# echo "$FTP_USER" > /etc/vsftpd/user_list
# vsftpd /etc/vsftpd/vsftpd.conf
exec supervisord -c /srcs/supervisord.conf
