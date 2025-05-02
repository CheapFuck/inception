# Use the Alpine mini root filesystem as a base
FROM scratch

# Add the Alpine mini rootfs to the image
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Install necessary runtime dependencies in one RUN step
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

# Create the necessary directory for Peercoin
RUN mkdir -p /peercoin

# Copy the Peercoin binaries and entrypoint script into the container
COPY containers/peercoin/peercoind /peercoin/peercoind
COPY containers/peercoin/peercoin-cli /peercoin/peercoin-cli
COPY containers/peercoin/entrypoint.sh /entrypoint.sh

# Set execute permissions for the binaries and entrypoint script
RUN chmod +x /peercoin/peercoind /peercoin/peercoin-cli /entrypoint.sh

# Expose the necessary ports (uncomment this line if needed)
# EXPOSE 9901 9902 9903 9904

# Use Tini to manage the process and start the entrypoint script
ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]

# Default CMD argument (you can override this when running the container)
CMD ["--datadir=/data/peercoin"]