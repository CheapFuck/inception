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
COPY php.ini /etc/php/php.ini
COPY php-fpm.conf /etc/php/php-fpm.conf
COPY www.conf /etc/php/php-fpm.d/www.conf

# # Create necessary directories for WordPress and PHP-FPM
RUN mkdir -p /var/www/html /run/php-fpm

# Download and configure WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz -C /var/www/html && \
    rm latest.tar.gz && \
    chown -R root:root /var/www/html

# Expose the PHP-FPM port (9000)
EXPOSE 9000

# # Run PHP-FPM in the foreground
CMD ["php-fpm83"]