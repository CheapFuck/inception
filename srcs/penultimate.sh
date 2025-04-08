#!/bin/bash

# Fetch the list of Alpine versions from the official Alpine releases page for the latest stable release series
versions=$(curl -s https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/ | grep -oP 'alpine-minirootfs-\K[0-9\.]+(?=-x86_64.tar.gz)' | sort -V | uniq)

# Debug: Output the list of versions to check if there are any duplicates
echo "Available versions:"
echo "$versions"

# Get the latest version (last in the sorted list)
latest_version=$(echo "$versions" | tail -n 1)

# Get the penultimate version (second-to-last in the sorted list)
penultimate_version=$(echo "$versions" | tail -n 2 | head -n 1)

# Debug: Output the latest and penultimate versions to verify correctness
echo "Latest version: ${latest_version}"
echo "Penultimate version: ${penultimate_version}"

# Set the URL to download the penultimate tarball
url="https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-${penultimate_version}-x86_64.tar.gz"

# Download the tarball
pwd
wget -q $url -O alpine-minirootfs-${penultimate_version}-x86_64.tar.gz

# Output the downloaded penultimate version
echo "Downloaded Alpine penultimate version: ${penultimate_version}"
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" /containers/nginx/Dockerfile
sed -i "s|alpine-minirootfs-[0-9.]*-x86_64.tar.gz|alpine-minirootfs-${penultimate_version}-x86_64.tar.gz|" /containers/mariadb/Dockerfile

# cat Dockerfile