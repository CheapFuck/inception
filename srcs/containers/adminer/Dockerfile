# Use the Alpine mini root filesystem as a base
FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

# Add the Alpine mini rootfs to the image
# ADD alpin6 "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

# Install required packages
RUN apk add --no-cache php php-session php-pdo php-mysqli php-pdo_mysql php-mbstring php-openssl php-json php-phar php-zlib curl
# RUN apk add curl
# Create a directory for Adminer
RUN mkdir -p /var/www/html/adminer
WORKDIR /var/www/html/adminer

# Download the latest Adminer version
# RUN curl -o index.php https://www.adminer.org/latest.php
# RUN curl -L -o index.php https://www.adminer.org/latest.php
# RUN curl -L -o index.php https://www.adminer.org/static/download/5.2.1/adminer-5.2.1.php
# Expose port
EXPOSE 8080

# Start built-in PHP server
CMD ["php", "-S", "0.0.0.0:8080"]
