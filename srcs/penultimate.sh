#!/bin/bash

versions=$(curl -s https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/ | grep -oP 'alpine-minirootfs-\K[0-9\.]+(?=-x86_64.tar.gz)' | sort -V | uniq)
echo "Available versions:"
echo "$versions"
latest_version=$(echo "$versions" | tail -n 1)
penultimate_version=$(echo "$versions" | tail -n 2 | head -n 1)
echo "Latest version: ${latest_version}"
echo "Penultimate version: ${penultimate_version}"
url="https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-${penultimate_version}-x86_64.tar.gz"
filename="srcs/alpine-minirootfs-${penultimate_version}-x86_64.tar.gz"
if [ -f "$filename" ]; then
    echo "File $filename already exists. Skipping download."
else
    wget -q "$url" -O "$filename"
fi
echo "Downloaded Alpine penultimate version: ${penultimate_version}"
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/nginx/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/mariadb/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/wordpress/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/ftp/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/redis/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/adminer/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" srcs/containers/peercoin/Dockerfile
