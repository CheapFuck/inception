# FROM scratch
# ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
# RUN apk update && \
#     apk add --no-cache \
#     nginx \
#     openssl \
#     ca-certificates && \
#     # Clean up after installation to reduce image size
#     rm -rf /var/cache/apk/* && \
#     mkdir -p /run/nginx && \
#     mkdir -p /var/www/html
# COPY containers/nginx/nginx.conf /etc/nginx/nginx.conf
# COPY html/index.html /var/www/html/index.html
# COPY containers/nginx/openssl.cnf /
# RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365 -config openssl.cnf -subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=IT/CN=codam.nl" -nodes
# RUN chmod 600 /etc/ssl/private/my_key.key
# RUN chmod 644 /etc/ssl/certs/cert.pem
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# Start with the minimal Alpine image and add the necessary packages
FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# # Install necessary packages for PHP-FPM and WordPress
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
# RUN mkdir /var/run/php

# RUN apk update && apk add --no-cache bash curl  \
#     php84-fpm php84-json php84-zlib php84-xml php84-xmlwriter php84-simplexml php84-pdo php84-phar php84-openssl \
#     php84-pdo_mysql php84-mysqli php84-session \
#     php84-gd php84-iconv php84-gmp php84-zip \
#     php84-curl php84-opcache php84-ctype php84-apcu \
#     php84-intl php84-bcmath php84-dom php84-mbstring php84-xmlreader && apk add -u musl && \
#     rm -rf /var/cache/apk/*


# # Copy PHP-FPM configuration files (create them in your local context)
# # COPY php.ini /etc/php/php.ini
# # COPY php-fpm.conf /etc/php/php-fpm.conf
# # COPY www.conf /etc/php/php-fpm.d/www.conf

# # Create necessary directories for WordPress and PHP-FPM
RUN mkdir -p /var/www/html /run/php-fpm

# # Download and configure WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz -C /var/www/html && \
    rm latest.tar.gz && \
    chown -R root:root /var/www/html

# # Expose the PHP-FPM port (9000)
EXPOSE 9000

# # Run PHP-FPM in the foreground
CMD ["php"]