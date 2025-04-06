FROM scratch
ADD alpine-minirootfs-3.55.2-x86_64.tar.gz /

RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl \
    ca-certificates && \
    # Clean up after installation to reduce image size
    rm -rf /var/cache/apk/* && \
    mkdir -p /run/nginx && \
    mkdir -p /var/www/html
# RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365
# RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365 -config openssl.cnf -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com" -nodes

COPY containers/nginx/nginx.conf /etc/nginx/nginx.conf
COPY web/html/index.html /var/www/html/index.html
COPY containers/nginx/openssl.cnf /

# COPY containers/nginx/index.html /usr/share/nginx/html/index.html

RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/my_key.key -out /etc/ssl/certs/cert.pem -days 365 -config openssl.cnf -subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=IT/CN=codam.nl" -nodes
RUN chmod 600 /etc/ssl/private/my_key.key
RUN chmod 644 /etc/ssl/certs/cert.pem

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]






# COPY entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

# Install necessary dependencies
# RUN apk update && \
#     apk add --no-cache \
#     nginx \
#     openssl \
#     ca-certificates && \
#     # Clean up after installation to reduce image size
#     rm -rf /var/cache/apk/* && \
#     mkdir -p /run/nginx 

# # Copy custom nginx.conf (you can modify your nginx.conf accordingly)
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY nginx.conf /etc/nginx/http.d/default.conf
# COPY index.html /var/www/html/index.html


# # Copy SSL certificates into the container (adjust the paths)
# COPY certs/cert.pem /etc/ssl/certs/cert.pem
# COPY certs/cert.key /etc/ssl/private/cert.key

# # Expose ports for HTTP and HTTPS
# EXPOSE 80
# EXPOSE 443




# # Command to run Nginx in the foreground
# CMD ["nginx", "-g", "daemon off;"]