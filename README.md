# rclone-drive

Mount an encrypted S3-compatible cloud storage as a local drive on macOS using Docker and NFS.

<img width="732" height="25" alt="rclone-drive-mounted-on-mac" src="https://github.com/user-attachments/assets/b1d66a5e-081a-4b5d-ad38-e2fd715d168e" />


## Setup

1. Copy `.env.example` to `.env` and fill in your S3 credentials:
   ```
   cp .env.example .env
   ```

2. Start the container (prompts for encryption password):
   ```
   ./start.sh
   ```

3. Mount the drive:
   ```
   ./mount.sh
   ```

## Unmount

```
umount ~/RcloneDrive
```
