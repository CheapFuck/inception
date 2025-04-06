#!/bin/bash
apk update && \
apk add --no-cache \
nginx \
openssl \
ca-certificates && \
# Clean up after installation to reduce image size
rm -rf /var/cache/apk/* && \
# mkdir -p /run/nginx && \ 
exec "$@"
