#!/bin/bash
set -e

read -s -p "Encryption password: " CRYPT_PASSWORD
echo

export CRYPT_PASSWORD
docker compose up -d

echo "Started. Run ./mount.sh to mount."
