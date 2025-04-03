FROM scratch
ADD ../alpine-minirootfs-3.21.2-x86_64.tar.gz /
RUN apt update && apt upgrade && apt install -y nginx
CMD ["nginx", "-g", "daemon off;"]