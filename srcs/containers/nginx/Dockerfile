FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl \
    ca-certificates && \
    # Clean up after installation to reduce image size
    rm -rf /var/cache/apk/* && \
    mkdir -p /run/nginx && \
    mkdir -p /var/www/html
COPY containers/nginx/nginx.conf /etc/nginx/nginx.conf
COPY html/index.html /var/www/html/index.html
COPY containers/nginx/openssl.cnf /
# COPY containers/nginx/wait.sh /
RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365 -config openssl.cnf -subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=IT/CN=codam.nl" -nodes
RUN chmod 600 /etc/ssl/private/my_key.key
RUN chmod 644 /etc/ssl/certs/cert.pem
# RUN chmod a+x wait.sh
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]