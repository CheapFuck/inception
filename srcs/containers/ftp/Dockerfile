# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Install Pure-FTPd and clean up APK cache
RUN apk update && \
    apk add --no-cache \
    pure-ftpd \
    shadow \
    && adduser -S ftpuser -D \
    && echo "ftpuser:ftppassword" | chpasswd \
    && rm -rf /var/cache/apk/*

# Configure Pure-FTPd
RUN mkdir -p /etc/ftp && \
    echo "yes" > /etc/ftp/pure-ftpd.conf && \
    echo "ChrootEveryone yes" >> /etc/ftp/pure-ftpd.conf && \
    echo "NoAnonymous yes" >> /etc/ftp/pure-ftpd.conf && \
    echo "MaxClientsNumber 10" >> /etc/ftp/pure-ftpd.conf && \
    echo "MaxClientsPerIP 5" >> /etc/ftp/pure-ftpd.conf && \
    echo "PassivePortRange 21100 21110" >> /etc/ftp/pure-ftpd.conf && \
    echo "CreateHomeDir yes" >> /etc/ftp/pure-ftpd.conf && \
    echo "TLS 1" >> /etc/ftp/pure-ftpd.conf && \
    echo "TLSCipherSuite HIGH:MEDIUM:+TLSv1.2" >> /etc/ftp/pure-ftpd.conf \
    echo "UnixAuthentication yes" >> /etc/ftp/pure-ftpd.conf \
    echo "DefaultRoot /var/www/html" >> /etc/ftp/pure-ftpd.conf \
    echo "NoAnonymous yes" >> /etc/ftp/pure-ftpd.conf
# Create a user for FTP access
# RUN mkdir -p /home/ftpuser/ftp && \
#     chown -R ftpuser:ftpuser /home/ftpuser
chown -R ftpuser:ftpuser /var/www/html
# Expose FTP port and passive FTP port range
EXPOSE 21 21100-21110

# Start Pure-FTPd on container start
# CMD ["pure-ftpd", "-B", "-d", "/var/www/html"]
CMD ["tail", "-f", "/dev/null"]
