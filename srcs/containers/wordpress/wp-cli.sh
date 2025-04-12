#!/bin/sh

# We will first check if the "/var/www/html" folder exist or not,
# if not we create it
if [ ! -d "/var/www/html" ]; then
  mkdir -p /var/www/html
fi

# We will cd into the folder
cd /var/www/html

# This downloads the WordPress core files, the option ( --allow-root ) will run the command as root
# and ( --version:5.8.1 ) specifies the version of WordPress that will get downloaded
# and ( --local=en_US ) sets the language of the installation to US English
wp core download --allow-root --version=6.7.2 --locale=en_US

# This will generate the WordPress configuration file, and the options ( --dbname, --dbuser, --dbpass, --dbhost )
# are just placeholders that will get replaced once the script runs
wp config create --allow-root --dbname="my_database" --dbuser="my_user" --dbpass="my_password" --dbhost="mariadb:3306"

# This will then install WordPress, and again, all the options are just placeholders that will get replaced
wp core install --allow-root --admin_user="root" --admin_password="root_password" --admin_email="thivan-d@student.codam.nl"

# This create a new WordPress user, and sets its role to author ( --role=author )
wp user create "my_user" "thivan-d@student.codam.nl" --user_pass="my_password" --role=author

# This is the command that will keep WordPress up and running
exec php-fpm83 -F -R