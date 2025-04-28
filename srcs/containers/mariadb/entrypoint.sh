#!/bin/bash
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mariadbd --user=mysql --bind-address=0.0.0.0 --port=3306 --init-file=/init.sql
