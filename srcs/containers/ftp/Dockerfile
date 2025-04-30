FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
# Install Pure-FTPd and clean up APK cache
RUN apk update && \
    apk add --no-cache \
    pure-ftpd \
    && rm -rf /var/cache/apk/*
RUN adduser -D -h /var/www/html ftpuser
RUN mkdir -p /var/www/html && chown -R ftpuser:ftpuser /var/www/html
RUN chmod 755 /var/www/html
# Expose FTP port and passive FTP port range
RUN echo "ftpuser:ftppassword" | chpasswd
EXPOSE 21 21100-21110
# Start Pure-FTPd on container start
# CMD pure-ftpd -p 21100:21110 -P 127.0.0.1
CMD ["pure-ftpd", "-p", "21100:21110", "-P", "127.0.0.1"]
