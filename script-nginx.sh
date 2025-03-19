#!/bin/bash

# Substitute environment variables into Nginx config
envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start Nginx
nginx -g "daemon off;"
