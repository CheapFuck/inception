FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

RUN apk update && \
    apk add --no-cache \
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
    && rm -rf /var/cache/apk/*
# Copy PHP-FPM configuration files (create them in your local context)
COPY containers/wordpress/php.ini /etc/php83/php.ini
# COPY containers/wordpress/default/php-fpm.conf /etc/php83/php-fpm.conf
# COPY containers/wordpress/default/www.conf /etc/php83/php-fpm.d/www.conf

# RUN chmod +x ./wp-cli.sh
# RUN chmod +x ./wait.sh
# Create necessary directories for WordPress and PHP-FPM
RUN mkdir -p /var/www/html /run/php83-fpm
RUN adduser -D -G www-data www-data
RUN chown -R root:root /var/www/html
RUN chown -R www-data:www-data /var/www/html
# Expose the PHP-FPM port (9000)
EXPOSE 9000
COPY containers/wordpress/entrypoint.sh /entrypoint.sh
COPY containers/wordpress/wp-config.php /wp-config.php
COPY html/index.html /index.html
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
