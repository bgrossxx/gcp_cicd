#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Get the GCS URI from an environment variable
# GCS_HTML_FILE should be in the format gs://your-bucket/your-file.html
if [ -z "$GCS_HTML_FILE" ]; then
  echo "Error: GCS_HTML_FILE environment variable is not set."
  exit 1
fi

# Download the static file from GCS to the NGINX web root
gsutil cp "$GCS_HTML_FILE" /usr/share/nginx/html/index.html

# Replace the placeholder port in nginx.conf with the port from the PORT env var
sed -i "s/listen 8080;/listen ${PORT};/" /etc/nginx/nginx.conf

# Start NGINX in the foreground
nginx -g 'daemon off;'

