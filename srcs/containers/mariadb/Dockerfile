FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

RUN apk update && \
    apk add --no-cache \
    mariadb mariadb-client \
    bash \
    && rm -rf /var/cache/apk/*
# Set up environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=root_password \
    MYSQL_DATABASE=my_database \
    MYSQL_USER=my_user \
    MYSQL_PASSWORD=my_password
# Create a directory for the database
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
COPY containers/mariadb/init.sql /init.sql
COPY containers/mariadb/my.cnf /etc/mysql/my.cnf
# Initialize MariaDB
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# Expose the MariaDB default port
EXPOSE 3306
# Initialize MariaDB (create database, users) on container start
# CMD ["sh", "-c", "mysqld --user=mysql --init-file=/init.sql"]
# CMD ["mysqld", "--user=mysql"]
# CMD ["mariadbd", "--user=mysql"]
CMD ["sh", "-c", "mariadbd --user=mysql --init-file=/init.sql"]