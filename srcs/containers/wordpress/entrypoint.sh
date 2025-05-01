#!/bin/bash

# If the WordPress directory is empty, download and extract WordPress
if [ ! `find /var/www/html/wordpress -name wp-config.php` ]; then
  echo "WordPress is not installed, installing..."
  cp /index.html /var/www/html/index.html
  mkdir -p /var/www/html/wordpress
  
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar 
  mv wp-cli.phar /usr/local/bin/wp
  # wp --info --allow-root
  cd /var/www/html/wordpress
  wp core download --allow-root
  cp /wp-config.php /var/www/html/wordpress/wp-config.php
  chown -R nobody:nobody *
  wp core install --url="http://thivan-d.42.nl/wordpress" --title="sitymcsiteface" --admin_user="bawse" --admin_password="wafwaf" --admin_email="thivan-d@student.codam.nl" --allow-root
  wp user create "miauw" "thssivan-d@student.codam.nl" --user_pass="waf" --allow-root
  wp plugin activate hello --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root
else
  echo "WordPress already installed, skipping installation."
fi

cd /var/www/html/wordpress
chown -R nobody:nobody *
exec php-fpm83 -F -R
