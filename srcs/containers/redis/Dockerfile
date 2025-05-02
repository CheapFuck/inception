# Use the Alpine mini root filesystem as a base
FROM scratch
# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Install Redis and tini, then clean up APK cache
RUN apk update && apk add --no-cache \
    redis \
    tini && \
    rm -rf /var/cache/apk/*

# Expose Redis port (6379)
EXPOSE 6379

# Copy Redis configuration file into the container
COPY containers/redis/redis.conf /usr/local/etc/redis/redis.conf

# Use Tini to manage processes and start Redis with the custom config
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]