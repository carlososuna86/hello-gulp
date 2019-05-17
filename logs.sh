#!/bin/bash

echo "[Showing logs for containers]"
docker-compose logs -f proxy app
