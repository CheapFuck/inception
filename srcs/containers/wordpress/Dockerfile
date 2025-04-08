# Start with the minimal Alpine image and add the necessary packages
FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Install necessary packages for PHP-FPM and WordPress
RUN apk update && \
    apk add --no-cache
    # php7 \
    # php7-fpm \
    # php7-mysqli \
    # php7-json \
    # php7-opcache \
    # php7-session \
    # php7-curl \
    # php7-zlib \
    # php7-mbstring \
    # php7-xml \
    # php7-gd \
    # php7-intl \
    # bash \
    # curl \
    # && rm -rf /var/cache/apk/*

# Copy PHP-FPM configuration files (create them in your local context)
# COPY php.ini /etc/php7/php.ini
# COPY php-fpm.conf /etc/php7/php-fpm.conf
# COPY www.conf /etc/php7/php-fpm.d/www.conf

# Create necessary directories for WordPress and PHP-FPM
RUN mkdir -p /var/www/html /run/php-fpm

# Download and configure WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz -C /var/www/html && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/html

# Expose the PHP-FPM port (9000)
EXPOSE 9000

# Run PHP-FPM in the foreground
CMD ["/usr/sbin/php-fpm7", "-F"]
