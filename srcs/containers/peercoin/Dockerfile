# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

RUN apk update
RUN apk --no-cache add build-base
RUN apk --no-cache add zlib-dev
RUN apk --no-cache add openssl-dev
RUN apk --no-cache add python3-dev
RUN apk --no-cache add autoconf
RUN apk --no-cache add automake
RUN apk --no-cache add build-base
RUN apk --no-cache add openssl 
RUN apk --no-cache add autoconf automake libtool
RUN apk --no-cache add build-base linux-headers musl-dev
RUN apk --no-cache add libc6-compat
RUN apk --no-cache add git boost-dev libevent-dev libsodium-dev
RUN apk --no-cache add zeromq zeromq-dev
RUN apk --no-cache add db db-dev db-c++
# ARG BERKELEYDB_VERSION=db-4.8.30.NC
# ARG BERKELEYDB_PREFIX=/opt/berkeleydb

# ENV BERKELEYDB_VERSION=${BERKELEYDB_VERSION}
# ENV BERKELEYDB_PREFIX=${BERKELEYDB_PREFIX}
# RUN mkdir -p ${BERKELEYDB_PREFIX}
# WORKDIR /${BERKELEYDB_VERSION}/build_unix



# RUN cd ..
# RUN cd dist
# RUN sh s_config
# RUN ln -s /opt/berkleydb /usr/include/db4.8 \
#     && ln -s /opt/berkleydb/include/* /usr/include  \
#     && ln -s /opt/berkleydb/lib/* /usr/lib

# RUN ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=${BERKELEYDB_PREFIX} && \
#     make -j$(nproc) && \
#     make install && \
#     rm -rf ${BERKELEYDB_PREFIX}/docs
# apk add build-base bash linux-headers musl-dev
# ../dist/configure --prefix=/usr/local \
#   --enable-cxx \
#   --disable-shared \
#   --with-mutex=UNIX/fcntl
# # RUN wget https://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
# # RUN tar -xzf db-4.8.30.NC.tar.gz
# # RUN cd db-4.8.30.NC/build_unix
# # RUN ../dist/configure --prefix=/opt/berkeleydb --enable-cxx --disable-shared
# # RUN make -j$(nproc)
# # RUN make install


# # Define variables


# # # Download and extract
# # RUN wget -q https://download.oracle.com/berkeley-db/${BERKELEYDB_VERSION}.tar.gz && \
# #     tar -xzf ${BERKELEYDB_VERSION}.tar.gz && \
# #     rm ${BERKELEYDB_VERSION}.tar.gz

# # # Patch atomic.h
# # RUN sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' ${BERKELEYDB_VERSION}/dbinc/atomic.h

# # # Create prefix directory
# # RUN mkdir -p ${BERKELEYDB_PREFIX}

# # # Build Berkeley DB
# # WORKDIR /${BERKELEYDB_VERSION}/build_unix

# # RUN ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=${BERKELEYDB_PREFIX} && \
# #     make -j$(nproc) && \
# #     make install && \
# #     rm -rf ${BERKELEYDB_PREFIX}/docs


# # # Build stage for Peercoind
# # # FROM alpine:3.16 as peercoin-build

# # COPY --from=berkeleydb /opt/ /opt/

# # RUN apk --no-cache add autoconf \
# #     automake \
# #     boost-dev \
# #     build-base \
# #     chrpath \
# #     file \
# #     libevent-dev \
# #     openssl \
# #     openssl-dev \
# #     libtool \
# #     linux-headers \
# #     zeromq-dev \
# #     protobuf-dev

# # ENV PEERCOIN_VERSION=0.15.0ppc \
# #     PEERCOIN_SHA=df6553485139aa0dfbd868c59d576c11c3d60e7b609fc76e0a98c4958cb1a3dd \
# #     PEERCOIN_PREFIX=/opt/peercoin

# # RUN wget -q -O peercoin.tar.gz https://github.com/peercoin/peercoin/archive/refs/tags/v${PEERCOIN_VERSION}.tar.gz \
# #     && echo "${PEERCOIN_SHA}  peercoin.tar.gz" | sha256sum -c -

# # RUN tar -xzf peercoin.tar.gz

# # WORKDIR /peercoin-${PEERCOIN_VERSION}+
RUN mkdir -p /peercoin 
COPY peercoind /peercoin/peercoind
COPY peercoin-cli /peercoin/peercoin-cli

RUN chmod +x /peercoin/peercoind
RUN chmod +x /peercoin/peercoin-cli


# # # ./configure can't find berkley db unless we do this
# RUN ln -s /opt/berkleydb /usr/include/db4.8 \
#     && ln -s /opt/berkleydb/include/* /usr/include  \
#     && ln -s /opt/berkleydb/lib/* /usr/lib

# # RUN ./autogen.sh
# # RUN ./configure \
# #     --prefix=${PEERCOIN_PREFIX} \
# #     --mandir=/usr/share/man \
# #     # --disable-tests \
# #     # --disable-bench \
# #     # --disable-ccache \
# #     # --with-gui=no \
# #     # --with-utils \
# #     # --with-libs \
# #     # --with-daemon \
# #     # --enable-hardening \
# #     # --disable-wallet \
# #     # --enable-wallet \ 
# #     # --without-sqlite \
# #     # --disable-upnp-default \
# #     --without-miniupnpc
# # RUN make clean
# # RUN make -j$(nproc)
# # RUN make install
# # # RUN strip ${PEERCOIN_PREFIX}/bin/peercoin-cli
# # # RUN strip ${PEERCOIN_PREFIX}/bin/peercoin-tx
# # RUN strip ${PEERCOIN_PREFIX}/bin/peercoind
# # RUN strip ${PEERCOIN_PREFIX}/lib/libpeercoinconsensus.a
# # RUN strip ${PEERCOIN_PREFIX}/lib/libpeercoinconsensus.so.0.0.0

# # # Build stage for compiled artifacts
# # # FROM alpine:3.16

# RUN adduser -S peercoin && \
#   apk --no-cache add \
#     boost \
#     boost-program_options \
#     libevent \
#     openssl \
#     libzmq \
#     su-exec \
#     bash

ENV PPC_DATA=/data/peercoin
# ENV PEERCOIN_PREFIX=/opt/peercoin
# ENV PATH=${PEERCOIN_PREFIX}/bin:$PATH
ENV RPC_PASSWORD=ppcpass
ENV RPC_USER=ppcuser

# # # COPY --from=peercoin-build /opt /opt
COPY containers/peercoin/entrypoint.sh /entrypoint.sh

# # VOLUME ["${PPC_DATA}"]

# EXPOSE 9901 9902 9903 9904
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["peercoind", "--daemon", "--datadir=/data/peercoin"]
# CMD ["tail", "-f", "/dev/null"]




# ./configure \
#   --prefix=${PEERCOIN_PREFIX} \
#   --enable-wallet \
#   --with-incompatible-bdb \
#   --with-bdb=/usr/local/BerkeleyDB.4.8 \
#   --disable-upnp-default \
#   --without-miniupnpc \
#   CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include" \
#   LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"

# \\wsl.localhost\Ubuntu\home\ppeer

# DIT WERKT
# ./configure --disable-tests --disable-bench --without-miniupnpc --with-incompatible-bdb --without-gui

# ohnee toch niet
# misschien dit wallet
# https://blog.backendhelpers.co/en/2019/docker-alpine-bitcoin/