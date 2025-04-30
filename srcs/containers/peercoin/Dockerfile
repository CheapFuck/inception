# Use the Alpine mini root filesystem as a base
FROM scratch
# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update
# Install only the necessary runtime dependencies
RUN apk --no-cache add \
    openssl \
    zlib \
    bash \
    libevent \
    libsodium \
    zeromq \
    db \
    db-c++ \
    su-exec
RUN mkdir -p /peercoin 
COPY containers/peercoin/peercoind /peercoin/peercoind
COPY containers/peercoin/peercoin-cli /peercoin/peercoin-cli
RUN chmod +x /peercoin/peercoind
RUN chmod +x /peercoin/peercoin-cli
ENV PPC_DATA=/data/peercoin
ENV RPC_PASSWORD=ppcpass
ENV RPC_USER=ppcuser
COPY containers/peercoin/entrypoint.sh /entrypoint.sh
# EXPOSE 9901 9902 9903 9904
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--datadir=/data/peercoin"]


# DIT WERKT
# ./configure --disable-tests --disable-bench --without-miniupnpc --with-incompatible-bdb --without-gui

# ohnee toch niet
# misschien dit wallet
# https://blog.backendhelpers.co/en/2019/docker-alpine-bitcoin/