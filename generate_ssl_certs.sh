#!/bin/sh

set -e

# Generate a private key and a self-signed certificate.

CERTS_DIR='/etc/ssl'
CONFIG='/etc/ssl/openssl.cnf'

mkdir -p $CERTS_DIR

# Generate private key.
openssl genrsa -out $CERTS_DIR/private.pem 1024

# Generate cert signing request.
openssl req -new \
    -key $CERTS_DIR/private.pem \
    -out $CERTS_DIR/proxy.csr \
    -config $CONFIG

# Generate self-signed cert.
openssl x509 -req \
    -days 730 \
    -signkey $CERTS_DIR/private.pem \
    -in $CERTS_DIR/proxy.csr \
    -out $CERTS_DIR/cert \
    -extensions v3_req \
    -extfile $CONFIG

# Delete signing request.
rm $CERTS_DIR/proxy.csr
