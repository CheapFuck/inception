#!/bin/sh

# Check if wp-cli is installed, if not, install it
if ! command -v wp > /dev/null 2>&1; then
  echo "wp-cli is not installed. Installing wp-cli..."
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  echo "wp-cli installed successfully."
fi

# Check if the "/var/www/html" folder exists, if not create it
if [ ! -d "/var/www/html/wordpress" ]; then
  mkdir -p /var/www/html/wordpress
fi

# Change to the WordPress directory
cd /var/www/html/wordpress


# This downloads the WordPress core files, the option ( --allow-root ) will run the command as root
# and ( --version:5.8.1 ) specifies the version of WordPress that will get downloaded
# and ( --local=en_US ) sets the language of the installation to US English
wp core download --allow-root --version=6.7.2 --locale=en_US

# This will generate the WordPress configuration file, and the options ( --dbname, --dbuser, --dbpass, --dbhost )
# are just placeholders that will get replaced once the script runs
wp config create --allow-root --dbname="my_database" --dbuser="my_user" --dbpass="my_password" --dbhost="mariadb:3306"

# This will then install WordPress, and again, all the options are just placeholders that will get replaced
wp core install --allow-root --admin_user="root" --admin_password="1d0ntkn0w!?" --admin_email="thivan-d@student.codam.nl"

# This create a new WordPress user, and sets its role to author ( --role=author )
wp user create "my_user" "thivan-d@student.codam.nl" --user_pass="my_password" --role=author

# This is the command that will keep WordPress up and running
./wait.sh
exec php-fpm83 -F -R