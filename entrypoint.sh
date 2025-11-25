#!/bin/sh
set -e

# Obscure the password for rclone config
OBSCURED_PASSWORD=$(rclone obscure "$CRYPT_PASSWORD")

# Create rclone config
cat > /config/rclone/rclone.conf << EOF
[s3]
type = s3
provider = Other
endpoint = ${S3_ENDPOINT}
access_key_id = ${S3_ACCESS_KEY}
secret_access_key = ${S3_SECRET_KEY}

[crypt]
type = crypt
remote = s3:${S3_BUCKET}
password = ${OBSCURED_PASSWORD}
filename_encryption = standard
directory_name_encryption = true
EOF

echo "Starting rclone WebDAV server on port 8080..."
exec rclone serve webdav crypt: \
    --addr :8080 \
    --vfs-cache-mode full \
    --buffer-size 64M \
    --dir-cache-time 72h \
    --log-level INFO \
    --user rclone \
    --pass rclone
