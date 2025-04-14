FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update && \
    apk add --no-cache \
    vsftpd \
    openrc \
    bash \
    shadow \
    netcat-openbsd \
    && rm -rf /var/cache/apk/*

# Create FTP user
RUN useradd -m -d /var/www/html -s /bin/false ftpuser && \
    echo "ftpuser:ftppassword" | chpasswd

# Copy a custom config (we’ll write this below)
COPY containers/ftp/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY containers/ftp/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Expose FTP ports
EXPOSE 20 21 21100-21110

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD nc -z localhost 21 || exit 1

CMD ["/entrypoint.sh"]
# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

