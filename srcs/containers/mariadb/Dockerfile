FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
RUN apk update && \
    apk add --no-cache \
    mariadb mariadb-client \
    bash \
    tini \
    && rm -rf /var/cache/apk/* 
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
COPY containers/mariadb/init.sql /init.sql
COPY containers/mariadb/my.cnf /etc/mysql/my.cnf
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
EXPOSE 3306
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "mariadbd --user=mysql --bind-address=0.0.0.0 --port=3306 --init-file=/init.sql"]

