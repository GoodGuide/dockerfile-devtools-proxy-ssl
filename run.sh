#!/bin/bash

set -e

if [ -z "$PROXY_TO_URI" ]; then
  echo 'You need to supply $PROXY_TO_URI to tell Nginx where to send requests'
  exit 1
fi
sed -i "s|<<PROXY_TO_URI>>|${PROXY_TO_URI}|g" /etc/nginx/nginx.conf

/bin/generate_ssl_certs.sh

exec nginx
