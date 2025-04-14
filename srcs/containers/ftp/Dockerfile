FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

RUN apk update && \
    apk add --no-cache \
    vsftpd \
    openrc \
    bash \
    shadow \
    netcat-openbsd \
    && rm -rf /var/cache/apk/*

# Create FTP user and ensure the directory exists with proper ownership
RUN useradd -m -d /var/www/html -s /bin/false ftpuser && \
    mkdir -p /var/www/html && \
    chown ftpuser:ftpuser /var/www/html

RUN mkdir -p /var/run/vsftpd/empty
RUN chmod 755 /var/run/vsftpd/empty

RUN mkdir -p /home/ftpuser && \
    chown root:root /home/ftpuser && \
    chmod 755 /home/ftpuser && \
    mkdir -p /home/ftpuser/files && \
    chown ftpuser:ftpuser /home/ftpuser/files

RUN usermod -d /home/ftpuser ftpuser
# Create FTP user
RUN echo "ftpuser:ftppassword" | chpasswd

# Copy a custom config (we’ll write this below)
COPY containers/ftp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Copy the entrypoint script
COPY containers/ftp/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN touch /var/log/vsftpd.log && chmod 666 /var/log/vsftpd.log
# Expose FTP ports
EXPOSE 20 21 21100-21110

# Set environment variables for FTP user and password (optional)
ENV FTP_USER=ftpuser
ENV FTP_PASS=ftppassword

# Healthcheck (uncomment if needed)
# HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD nc -z localhost 21 || exit 1

# CMD ["/entrypoint.sh"]
CMD ["/usr/sbin/vsftpd", "-olisten=YES", "-oxferlog_enable=YES", "/etc/vsftpd/vsftpd.conf"]



# FROM scratch
# ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /
# RUN apk update && \
#     apk add --no-cache \
#     vsftpd \
#     openrc \
#     bash \
#     shadow \
#     netcat-openbsd \
#     && rm -rf /var/cache/apk/*

# # Create FTP user
# RUN useradd -m -d /var/www/html -s /bin/false ftpuser && \
#     echo "ftpuser:ftppassword" | chpasswd

# # Copy a custom config (we’ll write this below)
# COPY containers/ftp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# COPY containers/ftp/entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh
# # Expose FTP ports
# EXPOSE 20 21 21100-21110

# # HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD nc -z localhost 21 || exit 1
# RUN mkdir -p /var/www/html && chown ftpuser:ftpuser /var/www/html

# CMD ["/entrypoint.sh"]
# # CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

