# Start from an Alpine base image to keep it small
FROM alpine:3.21

# Install Nginx and required dependencies
RUN apk update && apk add nginx

# Expose Nginx's default HTTP port
EXPOSE 80

# Copy your custom Nginx configuration, if you have one (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
