#!/bin/sh

# Only copy if it doesn't already exist
if [ ! -f /var/www/html/wp-config.php ]; then
  cp /tmp/wp-config.php /var/www/html/wp-config.php
fi
until nc -z mariadb 3306; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done
echo "MariaDB is ready. Starting WordPress..."
# Then run PHP-FPM or whatever your CMD is
exec php-fpm83 -F
