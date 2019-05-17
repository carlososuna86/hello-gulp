#!/bin/bash

clear

DOWN=true
CLEAN=true
BUILD=true
PORTS=true

if [ ! -f .env ]; then
  cp env.example .env
fi

if $DOWN ; then
  echo "[Shutting down containers]"
  docker-compose down
  echo ""
fi

if $CLEAN; then
  echo "[Cleaning up docker images]"
  docker rmi carlososuna86/hello-gulp:app
  docker rmi carlososuna86/hello-gulp:proxy
  #docker system prune
  echo ""
fi

./generate-ssl.sh

if $BUILD; then
  echo "[Building new docker images]"
  docker-compose build app proxy
  echo ""
fi

echo "[Starting containers]"
docker-compose up -d app proxy
echo ""

if $PORTS; then
  sleep 10s
  ./ports.sh
fi

./logs.sh
