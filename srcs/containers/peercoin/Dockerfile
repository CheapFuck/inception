FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update && apk --no-cache add \
    openssl \
    zlib \
    bash \
    libevent \
    libsodium \
    zeromq \
    db \
    db-c++ \
    su-exec \
    tini && \
    rm -rf /var/cache/apk/*
RUN mkdir -p /peercoin
COPY containers/peercoin/peercoind /peercoin/peercoind
COPY containers/peercoin/peercoin-cli /peercoin/peercoin-cli
COPY containers/peercoin/entrypoint.sh /entrypoint.sh
RUN chmod +x /peercoin/peercoind /peercoin/peercoin-cli /entrypoint.sh
ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
CMD ["--datadir=/data/peercoin"]