#!/bin/bash
mkdir -p /test/data /test/logs /test/socket /test/dump/import /test/dump/export /test/config
exec "$@"  # To continue with the CMD from Dockerfile (e.g., start MariaDB)
