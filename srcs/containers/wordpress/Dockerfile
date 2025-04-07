# Start from scratch and add the Alpine root filesystem
FROM scratch
ADD alpine-minirootfs-3.21.2-x86_64.tar.gz /

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    php7-fpm \
    php7-mysqli \
    php7-opcache \
    php7-json \
    php7-mbstring \
    php7-xml \
    php7-curl \
    php7-iconv \
    php7-session \
    php7-zlib \
    php7-soap \
    php7-dom \
    nginx \
    curl \
    bash \
    && rm -rf /var/cache/apk/*

# Configure PHP-FPM (optional customization)
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php7/php.ini \
    && sed -i 's/user = nobody/user = www-data/' /etc/php7/php-fpm.d/www.conf \
    && sed -i 's/group = nobody/group = www-data/' /etc/php7/php-fpm.d/www.conf

# Install WordPress
RUN curl -o /tmp/latest.tar.gz -L https://wordpress.org/latest.tar.gz && \
    tar -xvzf /tmp/latest.tar.gz -C /tmp && \
    cp -R /tmp/wordpress/* /var/www/ && \
    chown -R www-data:www-data /var/www && \
    rm -rf /tmp/latest.tar.gz /tmp/wordpress

# Expose HTTP and PHP-FPM ports
EXPOSE 80 9000

# Set the working directory for Nginx
WORKDIR /var/www

# Configure Nginx to serve WordPress (Optional: you'll need to set up Nginx config)
# COPY nginx.conf /etc/nginx/nginx.conf

# Start both Nginx and PHP-FPM
# CMD sh -c "php-fpm7 && nginx -g 'daemon off;'"
CMD sh -c "php-fpm7"
