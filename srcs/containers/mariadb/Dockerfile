FROM scratch
ADD alpine-minirootfs-3.21.2-x86_64.tar.gz /

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

# Expose the MariaDB default port
EXPOSE 3306

COPY srcs/containers/mariadb/init.sql /init.sql

# Initialize MariaDB (create database, users) on container start
CMD ["sh", "-c", "mysqld --user=mysql --init-file=/init.sql"]


# apk add --no-cache \


    #     nginx \
#     openssl \
#     ca-certificates && \
#     # Clean up after installation to reduce image size
#     rm -rf /var/cache/apk/* && \
#     mkdir -p /run/nginx && \
#     mkdir -p /var/www/html
# # RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365
# # RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365 -config openssl.cnf -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com" -nodes

# COPY containers/nginx/nginx.conf /etc/nginx/nginx.conf
# COPY html/index.html /var/www/html/index.html
# COPY containers/nginx/openssl.cnf /

# # COPY containers/nginx/index.html /usr/share/nginx/html/index.html

# RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365 -config openssl.cnf -subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=IT/CN=codam.nl" -nodes
# RUN chmod 600 /etc/ssl/private/my_key.key
# RUN chmod 644 /etc/ssl/certs/cert.pem

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

