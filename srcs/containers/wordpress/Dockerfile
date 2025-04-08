FROM scratch
ADD alpine-minirootfs-3.21.2-x86_64.tar.gz /

# Add the PHP 8 repository from Alpine Community if it's not available
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories && \
#     apk update && \
#     apk add --no-cache \
#     php8 php8-fpm php8-mysqli php8-opcache php8-json php8-mbstring php8-xml php8-curl php8-iconv php8-session php8-zlib php8-soap php8-dom nginx curl bash && \
#     rm -rf /var/cache/apk/*

# # Configure PHP-FPM (adjust configuration as necessary)
# RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php8/php.ini \
#     && sed -i 's/user = nobody/user = www-data/' /etc/php8/php-fpm.d/www.conf \
#     && sed -i 's/group = nobody/group = www-data/' /etc/php8/php-fpm.d/www.conf

# # Install WordPress (example)
# RUN curl -o /tmp/latest.tar.gz -L https://wordpress.org/latest.tar.gz && \
#     tar -xvzf /tmp/latest.tar.gz -C /tmp && \
#     cp -R /tmp/wordpress/* /var/www/ && \
#     chown -R www-data:www-data /var/www && \
#     rm -rf /tmp/latest.tar.gz /tmp/wordpress

# # Expose HTTP and PHP-FPM ports
# EXPOSE 80 9000

# # Set the working directory for Nginx
# WORKDIR /var/www

# Copy custom Nginx configuration (if needed)
# COPY nginx.conf /etc/nginx/nginx.conf

# Start Nginx and PHP-FPM
CMD ["sh"]
# CMD sh -c "php-fpm8 && nginx -g 'daemon off;'"
