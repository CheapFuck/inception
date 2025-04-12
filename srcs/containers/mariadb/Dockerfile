FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /


# expose port
EXPOSE 3306

# ENV ROOT_PASSWORD=123

# update apk repositories
RUN apk update

# upgrade all
RUN apk upgrade

# add tini https://github.com/krallin/tini/issues/8
RUN apk add tini

# install console tools
RUN apk add \
    inotify-tools

# install zsh
# RUN apk add \
#     zsh \
#     zsh-vcs

# configure zsh
# ADD --chown=root:root include/zshrc /etc/zsh/zshrc

# install mariadb
RUN apk add \
    mariadb \
    mariadb-client

# install timezone data
RUN apk add \
    tzdata

# delete apk cache
RUN rm -rf /var/cache/apk/*

# enable remote connections to mariadb from any IP
RUN sed -i 's|skip-networking|#skip-networking|g' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i 's|#bind-address=0.0.0.0|bind-address=0.0.0.0|g' /etc/my.cnf.d/mariadb-server.cnf

# set server timezone to UTC
RUN sed -i "/^\[mysqld\]$/a default_time_zone='+00:00'" /etc/my.cnf.d/mariadb-server.cnf

# change mariadb log file
RUN touch /var/log/mysqld.log
RUN chown mysql:mysql /var/log/mysqld.log
RUN sed -i '/^\[server\]$/a log-error=\/var\/log\/mysqld.log' /etc/my.cnf.d/mariadb-server.cnf

# add entry point script
ADD --chown=root:root start.sh /tmp/start.sh

# make entry point script executable
RUN chmod +x /tmp/start.sh

# set working dir
WORKDIR /var/lib/mysql/

# set entrypoint
ENTRYPOINT ["tini", "-vw"]

# run script
CMD ["/tmp/start.sh"]

# # Copy the main shell script to image
# COPY ["main.sh", "/usr/local/bin/"]

# RUN \
#     # Add MariaDB packages
#     apk add --no-cache \
#         mariadb \
#         mariadb-client; \
#     # Give execute permission to main.sh
#     chmod +x /usr/local/bin/main.sh

# # Specify the start point of our image
# ENTRYPOINT ["main.sh"]

# RUN apk update && \
#     apk add --no-cache \
#     mariadb mariadb-client \
#     bash \
#     && rm -rf /var/cache/apk/* \
#     && mkdir /maria \
#     && cd /maria \
#     && mkdir -p data logs socket dump/import dump/export config/my.cnf.daemon



# # Set up environment variables for MariaDB
# ENV MYSQL_ROOT_PASSWORD=root_password \
#     MYSQL_DATABASE=my_database \
#     MYSQL_USER=my_user \
#     MYSQL_PASSWORD=my_password
# # Create a directory for the database
# RUN mkdir -p /var/lib/mysql && \
#     chown -R mysql:mysql /var/lib/mysql
# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
# RUN chown -R mysql:mysql /var/lib/mysql
# COPY containers/mariadb/init.sql /init.sql
# COPY containers/mariadb/my.cnf /etc/mysql/my.cnf
# # Initialize MariaDB
# RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# # Expose the MariaDB default port
# EXPOSE 3306
# # Initialize MariaDB (create database, users) on container start
# # CMD ["sh", "-c", "mysqld --user=mysql --init-file=/init.sql"]
# # CMD ["mysqld", "--user=mysql"]
# # CMD ["mariadbd", "--user=mysql"]
# CMD ["sh", "-c", "mariadbd --user=mysql --init-file=/init.sql"]