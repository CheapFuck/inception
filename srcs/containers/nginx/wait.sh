#!/bin/bash
# Wait for PHP-FPM to be ready
until curl -s wordpress:9000 > /dev/null; do
    echo "Waiting for PHP-FPM to start..."
    sleep 5
done
# Start Nginx after PHP-FPM is ready
nginx -g "daemon off;"
