#!/bin/sh
FTP_USERNAME=ftpUser;
FTP_PASSWORD=pass;

echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser -h /mnt/ftps/$FTP_USERNAME $FTP_USERNAME
# echo "$FTP_USER" > /etc/vsftpd/user_list
vsftpd /etc/vsftpd/vsftpd.conf