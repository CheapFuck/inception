#!/bin/bash

# If the WordPress directory is empty, download and extract WordPress
# if [ ! "$(ls -A /var/www/html/wordpress)" ]; then
if [ ! `find /var/www/html/wordpress -name wp-config.php` ]; then
  echo "WordPress is not installed, installing..."
  cp /index.html /var/www/html/index.html
  mkdir -p /var/www/html/wordpress
#   curl -O https://wordpress.org/latest.tar.gz && \
#   tar -xzf latest.tar.gz -C /var/www/html/wordpress --strip-components=1 && \
#   rm latest.tar.gz
  
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar 
  mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/wordpress
  wp core download --allow-root
  wp core config --dbhost="mariadb":"3306" --dbname="my_database" --dbuser="my_user" --dbpass="my_password" --allow-root
  wp core install --url="thivan-d.42.fr" --title="sitymcsiteface" --admin_user="bawse" --admin_password="wafwaf" --admin_email="thivan-d@student.codam.nl" --allow-root
  wp user create "miauw" "thivan-d@student.codam.nl" --user_pass="waf" --allow-root
else
  echo "WordPress already installed, skipping installation."
fi
# cp /wp-config.php /var/www/html/wordpress/wp-config.php
chown -R nobody:nobody *
# Start PHP-FPM
exec php-fpm83 -F -R