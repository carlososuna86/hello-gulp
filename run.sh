#!/bin/bash

clear

DOWN=true
CLEAN=true
BUILD=true
PORTS=true

SERVICE=node

if $DOWN ; then
  echo "[Shutting down containers]"
  docker-compose down
  echo ""
fi

if $CLEAN; then
  echo "[Cleaning up docker images]"
  docker system prune
  echo ""
fi

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
  echo "[Showing open ports for service $SERVICE]"
  docker-compose exec $SERVICE netstat -ntlp
  echo ""
fi

echo "[Showing logs for containers]"
docker-compose logs -f $SERVICE

