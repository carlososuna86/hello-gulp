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
  docker rmi carlososuna86/hello-gulp:node
  docker rmi carlososuna86/hello-gulp:proxy
  #docker system prune
  echo ""
fi

./generate-ssl.sh

if $BUILD; then
  echo "[Building new docker images]"
  docker-compose build
  echo ""
fi

echo "[Starting containers]"
docker-compose up -d
echo ""

if $PORTS; then
  sleep 10s
  echo "[Showing open ports for service proxy]"
  docker-compose exec proxy netstat -ntlp
  echo ""
  echo "[Showing open ports for service node]"
  docker-compose exec node netstat -ntlp
  echo ""
fi

echo "[Showing logs for containers]"
docker-compose logs -f proxy node

