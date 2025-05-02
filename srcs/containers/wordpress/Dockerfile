FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
# Install dependencies and PHP
RUN apk update && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-json \
    php-opcache \
    php-session \
    php-curl \
    php-zlib \
    php-mbstring \
    php-xml \
    php-gd \
    php-intl \
    php-redis \
    php-ctype \
    php-phar \
    bash \
    curl \
    mariadb-client \
    tini && \
    rm -rf /var/cache/apk/*

# Copy configuration files
COPY containers/wordpress/php.ini /etc/php/8.3/php.ini
COPY containers/wordpress/default/php-fpm.conf /etc/php/8.3/php-fpm.conf
COPY containers/wordpress/default/www.conf /etc/php/8.3/php-fpm.d/www.conf

# Set up necessary directories and permissions
RUN mkdir -p /var/www/html /run/php83-fpm && \
    adduser -D -G www-data www-data && \
    chown -R root:root /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Expose PHP-FPM port
EXPOSE 9000

# Copy application files
COPY containers/wordpress/entrypoint.sh /entrypoint.sh
COPY containers/wordpress/wp-config.php /wp-config.php
COPY html/index.html /index.html

# Set correct permissions
RUN chmod +x /entrypoint.sh

# Use Tini to manage the process
ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]