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
  
  # wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  # chmod +x wp-cli.phar 
  # mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/wordpress
  wp core download --allow-root
  wp core config --dbhost="mariadb":"3306" --dbname="my_database" --dbuser="my_user" --dbpass="my_password" --allow-root
  wp core install --title="sitymcsiteface" --admin_user="bawse" --admin_password="wafwaf" --admin_email="thivan-d@student.codam.nl" --allow-root
  until wp db check --allow-root --path=/var/www/html/wordpress; do
    echo "Waiting for database..."
    sleep 2
  done
  wp user create "miauw" "thivan-d@student.codam.nl" --user_pass="waf" --allow-root
else
  echo "WordPress already installed, skipping installation."
fi
cp /wp-config.php /var/www/html/wordpress/wp-config.php
# Create user "miauw" if it doesn't exist
# echo "Checking if 'miauw' exists..."
# if ! wp user get miauw --allow-root --path=/var/www/html/wordpress > /dev/null 2>&1; then
#   echo "'miauw' not found. Creating user..."
#   wp user create "miauw" "thiiiiivan-d@student.codam.nl" --user_pass="waf" --role=subscriber --allow-root --path=/var/www/html/wordpress
# else
#   echo "User 'miauw' already exists."
# fi
chown -R nobody:nobody *
# Start PHP-FPM
exec php-fpm83 -F -R


# --url="localhost/wordpress/"