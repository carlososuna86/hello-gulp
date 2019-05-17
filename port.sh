#!/bin/bash

if [ -z $1 ]; then
  echo "Container name not specified"
  exit -1
fi

CONTAINER=$1

echo "[Displaying ports for Container $CONTAINER]"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER
docker port $CONTAINER

docker exec $CONTAINER netstat -ntlp
echo ""

