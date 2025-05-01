# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
# Install Pure-FTPd and clean up APK cache
RUN apk update && \
    apk add --no-cache \
    pure-ftpd \
    && rm -rf /var/cache/apk/*
RUN adduser -D -h /var/www/html ftpuser
RUN mkdir -p /var/www/html && chown -R ftpuser:ftpuser /var/www/html
RUN chmod 755 /var/www/html


ARG FTP_USER
ARG FTP_PASS
ARG PASV_ADDRESS
ARG PASV_MIN_PORT
ARG PASV_MAX_PORT


# Expose FTP port and passive FTP port range
# RUN echo "ftpuser:ftppassword" | chpasswd
RUN echo "$FTP_USER:$FTP_PASS" | chpasswd
EXPOSE 21 21100-21110

# Start Pure-FTPd on container start
# CMD ["pure-ftpd", "-p", "${PASV_MIN_PORT}:${PASV_MAX_PORT}", "-P", "${PASV_ADDRESS}"]
# CMD pure-ftpd -p ${PASV_MIN_PORT}:${PASV_MAX_PORT} -P ${PASV_ADDRESS}
ENTRYPOINT ["pure-ftpd"]
CMD ["-p", "${PASV_MIN_PORT}:${PASV_MAX_PORT}", "-P", "${PASV_ADDRESS}"]
