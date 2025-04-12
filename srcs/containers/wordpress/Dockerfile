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
    bash \
    curl \
    && rm -rf /var/cache/apk/*

    # # Copy PHP-FPM configuration files (create them in your local context)
COPY containers/wordpress/php.ini /etc/php83/php.ini
COPY containers/wordpress/default/php-fpm.conf /etc/php83/php-fpm.conf
COPY containers/wordpress/default/www.conf /etc/php83/php-fpm.d/www.conf
COPY containers/wordpress/wp-cli.sh /
RUN chmod +x wp-cli.sh
# # Create necessary directories for WordPress and PHP-FPM
RUN mkdir -p /var/www/html/wordpress /run/php83-fpm

# Download and configure WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz -C /var/www/html/wordpress && \
    rm latest.tar.gz && \
    chown -R root:root /var/www/html

# COPY containers/wordpress/www.conf /etc/php83/php-fpm.d/www.conf
# RUN cat /etc/php83/php-fpm.d/www.conf
# RUN sed -i 's/^listen = 127\.0\.0\.1:9000/listen = 0.0.0.0:9000/' /etc/php83/php-fpm.d/www.conf

# Expose the PHP-FPM port (9000)
EXPOSE 9000

# # Run PHP-FPM in the foreground
CMD ["php-fpm83", "-F"]