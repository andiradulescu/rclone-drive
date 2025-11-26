#!/bin/bash
set -e

MOUNT_POINT="$HOME/RcloneDrive"

mkdir -p "$MOUNT_POINT"
mount -t nfs -o nolocks,vers=3,tcp,port=2049,noresvport,mountport=2049,nodev,nosuid,noatime localhost:/ "$MOUNT_POINT"

echo "Mounted at $MOUNT_POINT"
