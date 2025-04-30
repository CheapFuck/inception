# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Run apk update to ensure we have the latest package repository
RUN apk update

# Install only the necessary runtime dependencies
RUN apk --no-cache add \
    openssl \
    zlib \
    bash \
    libevent \
    libsodium \
    zeromq \
    db

# RUN apk update
# RUN apk --no-cache add build-base
# RUN apk --no-cache add zlib-dev
# RUN apk --no-cache add openssl-dev
# RUN apk --no-cache add python3-dev
# RUN apk --no-cache add autoconf
# RUN apk --no-cache add automake
# RUN apk --no-cache add build-base
# RUN apk --no-cache add openssl 
# RUN apk --no-cache add autoconf automake libtool
# RUN apk --no-cache add build-base linux-headers musl-dev
# RUN apk --no-cache add libc6-compat
# RUN apk --no-cache add git boost-dev libevent-dev libsodium-dev
# RUN apk --no-cache add zeromq zeromq-dev
# RUN apk --no-cache add db db-dev db-c++
# RUN apk --no-cache add bash su-exec
RUN mkdir -p /peercoin 
COPY containers/peercoin/peercoind /peercoin/peercoind
COPY containers/peercoin/peercoin-cli /peercoin/peercoin-cli
RUN chmod +x /peercoin/peercoind
RUN chmod +x /peercoin/peercoin-cli
ENV PPC_DATA=/data/peercoin
# ENV PEERCOIN_PREFIX=/opt/peercoin
# ENV PATH=${PEERCOIN_PREFIX}/bin:$PATH
ENV RPC_PASSWORD=ppcpass
ENV RPC_USER=ppcuser
COPY containers/peercoin/entrypoint.sh /entrypoint.sh
# EXPOSE 9901 9902 9903 9904
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--datadir=/data/peercoin"]

# ohnee toch niet
# misschien dit wallet
# https://blog.backendhelpers.co/en/2019/docker-alpine-bitcoin/