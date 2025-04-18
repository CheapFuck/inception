# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

RUN apk --no-cache add autoconf
RUN apk --no-cache add automake
RUN apk --no-cache add build-base
RUN apk --no-cache add openssl
RUN apk add build-base linux-headers
# Define variables
# ARG BERKELEYDB_VERSION=db-4.8.30.NC
# ARG BERKELEYDB_PREFIX=/opt/berkeleydb

# ENV BERKELEYDB_VERSION=${BERKELEYDB_VERSION}
# ENV BERKELEYDB_PREFIX=${BERKELEYDB_PREFIX}

# # Download and extract
# RUN wget -q https://download.oracle.com/berkeley-db/${BERKELEYDB_VERSION}.tar.gz && \
#     tar -xzf ${BERKELEYDB_VERSION}.tar.gz && \
#     rm ${BERKELEYDB_VERSION}.tar.gz

# # Patch atomic.h
# RUN sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' ${BERKELEYDB_VERSION}/dbinc/atomic.h

# # Create prefix directory
# RUN mkdir -p ${BERKELEYDB_PREFIX}

# # Build Berkeley DB
# WORKDIR /${BERKELEYDB_VERSION}/build_unix

# RUN ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=${BERKELEYDB_PREFIX} && \
#     make -j$(nproc) && \
#     make install && \
#     rm -rf ${BERKELEYDB_PREFIX}/docs


# Build stage for Peercoind
# FROM alpine:3.16 as peercoin-build

# COPY --from=berkeleydb /opt/ /opt/

# RUN apk --no-cache add autoconf \
#     automake \
#     boost-dev \
#     build-base \
#     chrpath \
#     file \
#     libevent-dev \
#     openssl \
#     openssl-dev \
#     libtool \
#     linux-headers \
#     zeromq-dev \
#     protobuf-dev

# ENV PEERCOIN_VERSION=0.15.0ppc \
#     PEERCOIN_SHA=df6553485139aa0dfbd868c59d576c11c3d60e7b609fc76e0a98c4958cb1a3dd \
#     PEERCOIN_PREFIX=/opt/peercoin

# RUN wget -q -O peercoin.tar.gz https://github.com/peercoin/peercoin/archive/refs/tags/v${PEERCOIN_VERSION}.tar.gz \
#     && echo "${PEERCOIN_SHA}  peercoin.tar.gz" | sha256sum -c -

# RUN tar -xzf peercoin.tar.gz

# WORKDIR /peercoin-${PEERCOIN_VERSION}

# # ./configure can't find berkley db unless we do this
# RUN ln -s /opt/berkleydb /usr/include/db4.8 \
#     && ln -s /opt/berkleydb/include/* /usr/include  \
#     && ln -s /opt/berkleydb/lib/* /usr/lib

# RUN ./autogen.sh
# RUN ./configure \
#     --prefix=${PEERCOIN_PREFIX} \
#     --mandir=/usr/share/man \
#     --disable-tests \
#     --disable-bench \
#     --disable-ccache \
#     --with-gui=no \
#     --with-utils \
#     --with-libs \
#     --with-daemon
# RUN make -j20
# RUN make install
# RUN strip ${PEERCOIN_PREFIX}/bin/peercoin-cli
# RUN strip ${PEERCOIN_PREFIX}/bin/peercoin-tx
# RUN strip ${PEERCOIN_PREFIX}/bin/peercoind
# RUN strip ${PEERCOIN_PREFIX}/lib/libpeercoinconsensus.a
# RUN strip ${PEERCOIN_PREFIX}/lib/libpeercoinconsensus.so.0.0.0

# # Build stage for compiled artifacts
# # FROM alpine:3.16

# RUN adduser -S peercoin && \
#   apk --no-cache add \
#     boost \
#     boost-program_options \
#     libevent \
#     openssl \
#     libzmq \
#     su-exec \
#     bash

# ENV PPC_DATA=/data
# ENV PEERCOIN_PREFIX=/opt/peercoin
# ENV PATH=${PEERCOIN_PREFIX}/bin:$PATH
# ENV RPC_PASSWORD=ppcpass
# ENV RPC_USER=ppcuser

# # COPY --from=peercoin-build /opt /opt
# # COPY docker-entrypoint.sh /entrypoint.sh

# VOLUME ["${PPC_DATA}"]

# EXPOSE 9901 9902 9903 9904

# ENTRYPOINT ["/entrypoint.sh"]

# # CMD ["peercoind"]
CMD ["tail", "-f", "/dev/null"]
