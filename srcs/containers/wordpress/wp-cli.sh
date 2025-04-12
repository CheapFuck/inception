#!/bin/sh

# Wait for MariaDB to be ready
until mariadb -h mariadb -u my_user -pmy_password -e "SHOW DATABASES;" > /dev/null 2>&1; do
  echo "Waiting for MariaDB to be ready..."
  sleep 3
done

echo "MariaDB is ready. Continuing WordPress setup..."

# Install wp-cli if missing
if ! command -v wp > /dev/null 2>&1; then
  echo "Installing wp-cli..."
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

# Ensure /var/www/html/wordpress exists
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

# Download WordPress core
wp core download --allow-root --version=6.7.2 --locale=en_US

# Create wp-config
wp config create --allow-root \
  --dbname="my_database" \
  --dbuser="my_user" \
  --dbpass="my_password" \
  --dbhost="mariadb:3306"

# Install WordPress
wp core install --allow-root \
  --url="https://localhost/wordpress" \
  --title="My WordPress Site" \
  --admin_user="admin" \
  --admin_password="1d0ntkn0w!?" \
  --admin_email="thivan-d@student.codam.nl"

# Create additional WordPress user
wp user create "my_user" "thivan-d@student.codam.nl" \
  --user_pass="my_password" --role=author

# Start PHP-FPM
exec php-fpm83 -F -R
