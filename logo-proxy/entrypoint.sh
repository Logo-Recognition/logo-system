#!/bin/bash

echo "Writing config..."
# Substitute environment variables into Nginx config

envsubst '${NGINX_HOST} ${MINIO_API_PORT} ${MINIO_CONSOLE_PORT} ${API_PORT} ${FRONTEND_PORT}' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf
# envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

cat /etc/nginx/nginx.conf
# Start Nginx
nginx -g "daemon off;"
