# Use the Alpine mini root filesystem as a base
FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Install required packages
RUN apk add --no-cache php php-session php-pdo php-mysqli php-pdo_mysql php-mbstring php-openssl php-json php-phar php-zlib curl tini
RUN mkdir -p /var/www/html/adminer
WORKDIR /var/www/html/adminer
EXPOSE 8080
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "mkdir -p /var/www/html/adminer && curl -L -o /var/www/html/adminer/index.php https://www.adminer.org/static/download/5.2.1/adminer-5.2.1.php && php -S 0.0.0.0:8080 -t /var/www/html"]
