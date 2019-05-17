#!/bin/bash

SSL_PATH=./proxy/config/ssl

if [ ! -f $SSL_PATH/fullchain.pem ] || [ ! -f $SSL_PATH/privkey.pem ]; then
  source .env

  echo "[Generating default SSL certificate files for Nginx]"

  sudo mkdir -p $SSL_PATH
  SSL_SUBJECT="/C=$SSL_C/ST=$SSL_S/L=$SSL_L/O=$SSL_O/OU=$SSL_OU/CN=$SSL_CN/emailAddress=$SSL_EMAIL"
  if $DEBUG
  then
    echo "Subject=$SSL_SUBJECT"
  fi
  sudo openssl req -nodes -x509 \
       -newkey rsa:4096 \
       -keyout $SSL_PATH/privkey.pem \
       -out $SSL_PATH/fullchain.pem \
       -days 365 \
       -subj $SSL_SUBJECT

  if $DEBUG
  then
    ls -la $SSL_PATH
  fi

  echo ""

  echo "[Fixing certificate permissions]"
  #sudo chown root:root $SSL_PATH/*.pem
  sudo chmod go+r $SSL_PATH/*.pem
  echo ""
fi


