#!/bin/bash

# If the WordPress directory is empty, download and extract WordPress
if [ ! "$(ls -A /var/www/html)" ]; then
  echo "WordPress is not installed, installing..."
  curl -O https://wordpress.org/latest.tar.gz && \
  tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
  rm latest.tar.gz
else
  echo "WordPress already installed, skipping installation."
fi

# Start PHP-FPM
exec php-fpm83 -F -R