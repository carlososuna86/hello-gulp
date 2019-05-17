#!/bin/bash

echo "[Showing open ports for service proxy]"
docker-compose exec proxy netstat -ntlp
echo ""
echo "[Showing open ports for service app]"
docker-compose exec app netstat -ntlp
echo ""
