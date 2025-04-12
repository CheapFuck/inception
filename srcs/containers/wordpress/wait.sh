#!/bin/bash

# wait for the database to be available
until mariadb -h mariadb -u wp_user -p$WORDPRESS_DB_PASSWORD -e ""; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 5
done

>&2 echo "MariaDB is up - executing WordPress setup"
# continue with your wp-cli commands
