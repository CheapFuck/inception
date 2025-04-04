FROM scratch
ADD alpine-minirootfs-3.21.2-x86_64.tar.gz /

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
#     mkdir -p /run/nginx && \
#     mkdir -p /var/www/html

# Copy custom nginx.conf (you can modify your nginx.conf accordingly)
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/http.d/default.conf
# COPY index.html /var/www/html/index.html


# Copy SSL certificates into the container (adjust the paths)
COPY certs/cert.pem /etc/ssl/certs/cert.pem
COPY certs/cert.key /etc/ssl/private/cert.key

# Expose ports for HTTP and HTTPS
EXPOSE 80
EXPOSE 443




# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]