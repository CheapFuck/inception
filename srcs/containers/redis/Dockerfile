# Use the Alpine mini root filesystem as a base
FROM scratch
# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
# RUN /bin/sh -c "echo 'http://dl-cdn.alpinelinux.org/alpine/v3.21/main' > /etc/apk/repositories && apk update"
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
# Install Pure-FTPd and clean up APK cache
RUN apk update && \
    apk add --no-cache \
    redis \
    tini \
    && rm -rf /var/cache/apk/*
EXPOSE 6379
COPY containers/redis/redis.conf /usr/local/etc/redis/redis.conf
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["redis-server", "usr/local/etc/redis/redis.conf"]

