FROM scratch
ADD /home/vboxuser/inception/alpine-minirootfs-3.21.2-x86_64.tar.gz /



# RUN apt update && apt upgrade && apt install -y nginx
# CMD ["nginx", "-g", "daemon off;"]

RUN apk update && apk add nginx

# Expose Nginx's default HTTP port
EXPOSE 80
EXPOSE 443

# Copy your custom Nginx configuration, if you have one (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
