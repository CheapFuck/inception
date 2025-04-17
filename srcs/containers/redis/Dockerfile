# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Install Pure-FTPd and clean up APK cache
RUN apk update && \
    apk add --no-cache \
    redis \
    && rm -rf /var/cache/apk/*

EXPOSE 6379
RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]