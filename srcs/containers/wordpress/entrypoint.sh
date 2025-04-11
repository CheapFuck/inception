#!/bin/sh

# Only copy if it doesn't already exist
if [ ! -f /var/www/html/wp-config.php ]; then
  cp /tmp/wp-config.php /var/www/html/wp-config.php
fi

# Then run PHP-FPM or whatever your CMD is
exec php-fpm83 -F
