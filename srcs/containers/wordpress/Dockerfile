FROM scratch
ADD alpine-minirootfs-3.21.2-x86_64.tar.gz /


# # Set up Alpine repository for package installation
RUN /bin/sh -c "echo 'http://dl-cdn.alpinelinux.org/alpine/v3.21/main' > /etc/apk/repositories && apk update"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

# # Install PHP 8 and necessary PHP extensions for WordPress
# RUN apk add --no-cache \
#     php \
#     php-fpm \
#     php-mysqli \
#     php-json \
#     php-opcache \
#     php-session \
#     php-curl \
#     php-xml \
#     php-gd \
#     php-mbstring \
#     php-soap \
#     php-ctype \
#     php-zip \
#     php-intl \
#     bash \
#     curl


# # Ensure the www-data user/group exists and is used
# RUN if ! getent group www-data; then addgroup -g 82 -S www-data; fi && \
#     if ! getent passwd www-data; then adduser -S -G www-data -u 82 www-data; fi && \
#     mkdir -p /var/www && \
#     chown -R www-data:www-data /var/www

#     # Download and extract WordPress
# # RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
# #     tar -xvzf /tmp/wordpress.tar.gz -C /var/www/ && \
# #     rm /tmp/wordpress.tar.gz

# # Set proper ownership for WordPress files (PHP-FPM user/group)
# # RUN chown -R www-data:www-data /var/www/wordpress

# # COPY containers/wordpress/www.conf /etc/php/php-fpm.d/www.conf

# # Configure PHP-FPM to run in the foreground (required for Docker containers)
# # RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php83/php-fpm.d/www.conf

# # Expose port 9000 for PHP-FPM
# EXPOSE 9000

# Set the default command to run PHP-FPM in the foreground
# CMD ["php-fpm8", "-F"]

# Download and extract WordPress
# RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xvzf /tmp/wordpress.tar.gz -C /var/www/ && \
#     rm /tmp/wordpress.tar.gz

# Set proper ownership for WordPress files (PHP-FPM user/group)
# RUN chown -R www-data:www-data /var/www/wordpress

# Configure PHP-FPM to run in the foreground (required for Docker containers)
# RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php8/php-fpm.d/www.conf

# Expose port 9000 for PHP-FPM
# EXPOSE 9000

# Set the default command to run PHP-FPM in the foreground
# CMD ["php-fpm83", "-F"]
# CMD ["./wp-cli.sh"]


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
    bash \
    curl \
    mariadb-client \
    && rm -rf /var/cache/apk/*
# Copy PHP-FPM configuration files (create them in your local context)
COPY containers/wordpress/php.ini /etc/php83/php.ini
COPY containers/wordpress/default/php-fpm.conf /etc/php83/php-fpm.conf
COPY containers/wordpress/default/www.conf /etc/php83/php-fpm.d/www.conf
COPY containers/wordpress/wp-cli.sh /
COPY containers/wordpress/wait.sh /
RUN chmod +x ./wp-cli.sh
RUN chmod +x ./wait.sh
# Create necessary directories for WordPress and PHP-FPM
RUN mkdir -p /var/www/html /run/php83-fpm
RUN adduser -D -G www-data www-data
RUN chown -R root:root /var/www/html
RUN chown -R www-data:www-data /var/www/html
# RUN mkdir /var/www/html/DOEIKDIT
RUN pwd
# Download and configure WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz
# RUN curl -O https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz -C /var/www/html && \
#     rm latest.tar.gz && \
# RUN chown -R root:root /var/www/html
# RUN curl -O https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz --strip-components=1 -C /var/www/html && \
#     rm latest.tar.gz
    # adduser -D -G www-data www-data &&\
# RUN chown -R www-data:www-data /var/www/html
# Expose the PHP-FPM port (9000)
EXPOSE 9000
# Run PHP-FPM in the foreground
CMD ["php-fpm83", "-F", "-R"]
# CMD ["tail", "-f", "/dev/null"]

