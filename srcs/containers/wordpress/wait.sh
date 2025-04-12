#!/bin/bash

# wait for the database to be available
until mysqladmin ping -h"mariadb" -u"my_user" -p"my_password" --silent; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 5
done

# continue with your wp-cli commands
