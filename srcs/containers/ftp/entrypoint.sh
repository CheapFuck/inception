#!/bin/sh

# Default values
FTP_USER=${FTP_USER:-ftpuser}
FTP_PASS=${FTP_PASS:-ftppassword}


# Make sure the user doesn’t already exist
if ! id "$FTP_USER" >/dev/null 2>&1; then
    useradd -m -d /var/www/html -s /bin/false "$FTP_USER"
    echo "$FTP_USER:$FTP_PASS" | chpasswd
fi

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
