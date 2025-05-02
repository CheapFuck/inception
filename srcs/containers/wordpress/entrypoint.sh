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
  chown -R www-data:www-data *

  # cp /wp-config.php /var/www/html/wordpress/wp-config.php
  wp config create --dbname="${WORDPRESS_DB_NAME}" \
                 --dbuser="${WORDPRESS_DB_USER}" \
                 --dbpass="${WORDPRESS_DB_PASSWORD}" \
                 --dbhost="${WORDPRESS_DB_HOST}" \
                 --dbcharset=utf8mb4 \
                 --dbcollate="" \
                 --auth-key="${AUTH_KEY}" \
                 --secure-auth-key="${SECURE_AUTH_KEY}" \
                 --logged-in-key="${LOGGED_IN_KEY}" \
                 --nonce-key="${NONCE_KEY}" \
                 --auth-salt="${AUTH_SALT}" \
                 --secure-auth-salt="${SECURE_AUTH_SALT}" \
                 --logged-in-salt="${LOGGED_IN_SALT}" \
                 --nonce-salt="${NONCE_SALT}" \
                 --table-prefix=wp_ \
                 --debug=false \
                 --wp-redis-host=redis \
                 --wp-redis-port=6379 \
                 --wp-content-dir="/var/www/html/wordpress/wp-content" \
                 --fs-method=direct

  # chown -R www-data:www-data *
  wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PW}" --admin_email="${WP_ADMIN_EMAIL}" --allow-root
  wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_USER_PASS}" --allow-root
  wp plugin activate hello --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root
else
  echo "WordPress already installed, skipping installation."
fi

cp /index.html /var/www/html/index.html
cd /var/www/html/wordpress
chown -R www-data:www-data *
exec php-fpm83 -F -R
