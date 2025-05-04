FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update && \
    apk add --no-cache \
    pure-ftpd \
    tini \
    && rm -rf /var/cache/apk/*
RUN adduser -D -h /var/www/html ftpuser
RUN mkdir -p /var/www/html && chown -R ftpuser:ftpuser /var/www/html
RUN chmod 755 /var/www/html
ARG FTP_USER
ARG FTP_PASS
RUN echo "$FTP_USER:$FTP_PASS" | chpasswd
EXPOSE 21 21100-21110
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "pure-ftpd -p $PASV_MIN_PORT:$PASV_MAX_PORT -P $PASV_ADDRESS"]
