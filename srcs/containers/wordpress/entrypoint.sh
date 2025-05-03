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
  cd /
  ./replace-env-vars.sh
  cd /var/www/html/wordpress
  wp core download --allow-root 
  cp /wp-config.php /var/www/html/wordpress/wp-config.php
  chown -R nobody:nobody *
  wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PW}" --admin_email="${WP_ADMIN_EMAIL}" --allow-root
  wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_USER_PASS}" --allow-root
  wp plugin activate hello --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root
else
  echo "WordPress already installed, skipping installation."
fi

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
composer require vlucas/phpdotenv
cp /index.html /var/www/html/index.html
cd /var/www/html/wordpress
chown -R nobody:nobody *
exec php-fpm83 -F -R
