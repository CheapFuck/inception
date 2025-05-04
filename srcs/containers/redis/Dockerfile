FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update && apk add --no-cache \
    redis \
    tini && \
    rm -rf /var/cache/apk/*
EXPOSE 6379
COPY containers/redis/redis.conf /usr/local/etc/redis/redis.conf
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]