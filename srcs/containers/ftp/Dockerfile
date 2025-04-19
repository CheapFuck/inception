# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN /bin/sh -c "echo 'http://dl-cdn.alpinelinux.org/alpine/v3.21/main' > /etc/apk/repositories && apk update"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

# Install Pure-FTPd and clean up APK cache
RUN apk update && \
    apk add --no-cache \
    # shadow \
    pure-ftpd \
    && rm -rf /var/cache/apk/*

# Configure Pure-FTPd
# RUN echo "ChrootEveryone yes" >> /etc/pure-ftpd.conf && \
#     echo "NoAnonymous yes" >> /etc/pure-ftpd.conf && \
#     echo "MaxClientsNumber 10" >> /etc/pure-ftpd.conf && \
#     echo "MaxClientsPerIP 5" >> /etc/pure-ftpd.conf && \
#     echo "PassivePortRange 21100 21110" >> /etc/pure-ftpd.conf && \
#     # echo "CreateHomeDir yes" >> /etc/pure-ftpd.conf && \
#     # echo "TLS 1" >> /etc/pure-ftpd.conf && \
#     # echo "TLSCipherSuite HIGH:MEDIUM:+TLSv1.2" >> /etc/pure-ftpd.conf \
#     echo "DefaultRoot /var/www/html" >> /etc/pure-ftpd.conf \
#     echo "NoAnonymous yes" >> /etc/pure-ftpd.conf
# Create a user for FTP access
# RUN adduser -D ftpuser && \
#     mkdir -p /home/ftpuser/ftp && \
#     chown -R ftpuser:ftpuser /home/ftpuser
# RUN adduser -S -H ftpuser
# RUN addgroup ftpuser
# RUN adduser -S -G ftpuser ftpuser
RUN adduser -D -h /var/www/html ftpuser
RUN mkdir -p /var/www/html && chown -R ftpuser:ftpuser /var/www/html
RUN chmod 755 /var/www/html
# RUN chown -R ftpuser:ftpuser /var/www/html
# Expose FTP port and passive FTP port range
RUN echo "ftpuser:ftppassword" | chpasswd
EXPOSE 21 21100-21110

# Start Pure-FTPd on container start
# CMD ["pure-ftpd"]
# CMD pure-ftpd -A -j -lpuredb:/etc/pure-ftpd/pureftpd.pdb -P 127.0.0.1 -p 21100:21110
CMD pure-ftpd -A -j -lpuredb:/etc/pure-ftpd/pureftpd.pdb -P 127.0.0.1 -p 21100:21110 -4
# CMD ["tail", "-f"]



# OK: 8 MiB in 19 packages
# / # nano /etc/pure-ftpd.conf 
# / # mkdir -p /var/www/html
# / # chown ftpuser:ftpuser /var/www/html
# / # chmod 755 /var/www/html
# / # killall pure-ftpd
# / # pure-ftpd -B -A -j
# / # killall pure-ftpd
# / # pure-ftpd -B -p 21100:21110 -P 127.0.0.1
