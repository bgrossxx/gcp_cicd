# Use the official NGINX image as a base
FROM nginx:1.25-alpine

# Install Google Cloud SDK for gsutil
# hadolint ignore=DL3018
RUN apk --no-cache add google-cloud-sdk

# Copy the NGINX configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# The container will listen on the port specified by the PORT environment variable
EXPOSE 8080

ENTRYPOINT ["/startup.sh"]

