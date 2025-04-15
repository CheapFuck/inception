FROM scratch
ADD alpine-minirootfs-3.21.2-x86_64.tar.gz /
RUN /bin/sh -c "echo 'http://dl-cdn.alpinelinux.org/alpine/v3.21/main' > /etc/apk/repositories && apk update"
RUN apk add --no-cache \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-opcache \
    php7-session \
    php7-curl \
    php7-xml \
    php7-gd \
    php7-mbstring \
    php7-soap \
    php7-ctype \
    php7-zip \
    php7-intl \
    bash \
    curl

RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xvzf /tmp/wordpress.tar.gz -C /var/www/ && \
    rm /tmp/wordpress.tar.gz

# Set proper ownership for WordPress files (PHP-FPM user/group)
RUN chown -R www-data:www-data /var/www/wordpress

# Configure PHP-FPM to run in the foreground (required for Docker containers)
RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php7/php-fpm.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the default command to run PHP-FPM in the foreground
CMD ["php-fpm7", "-F"]
# RUN apk update && \
#     apk add --no-cache \
#     php \
#     php-fpm \
#     php-mysqli \
#     php-json \
#     php-opcache \
#     php-session \
#     php-curl \
#     php-zlib \
#     php-mbstring \
#     php-xml \
#     php-gd \
#     php-intl \
#     bash \
#     curl \
#     mariadb-client \
#     && rm -rf /var/cache/apk/*
# # Copy PHP-FPM configuration files (create them in your local context)
# COPY containers/wordpress/php.ini /etc/php83/php.ini
# COPY containers/wordpress/default/php-fpm.conf /etc/php83/php-fpm.conf
# COPY containers/wordpress/default/www.conf /etc/php83/php-fpm.d/www.conf
# COPY containers/wordpress/wp-cli.sh /
# COPY containers/wordpress/wait.sh /
# RUN chmod +x ./wp-cli.sh
# RUN chmod +x ./wait.sh
# # Create necessary directories for WordPress and PHP-FPM
# RUN mkdir -p /var/www/html /run/php83-fpm
# RUN adduser -D -G www-data www-data
# RUN chown -R root:root /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# RUN mkdir /var/www/html/DOEIKDIT
# Download and configure WordPress
# RUN curl -O https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz -C /var/www/html && \
#     rm latest.tar.gz && \
#     chown -R root:root /var/www/html
# RUN curl -O https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz --strip-components=1 -C /var/www/html && \
#     rm latest.tar.gz && \
#     adduser -D -G www-data www-data &&\
#     chown -R www-data:www-data /var/www/html
# Expose the PHP-FPM port (9000)
# EXPOSE 9000
# # Run PHP-FPM in the foreground
# CMD ["php-fpm83", "-F", "-R"]
# CMD ["tail", "-f", "/dev/null"]

