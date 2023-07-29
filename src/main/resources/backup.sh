#!/bin/bash

# Configuration
MONGO_HOST="localhost"      # MongoDB host
MONGO_PORT="27017"          # MongoDB port
BACKUP_DIR="C:/Users/Administrator/Desktop/db_backup"   # Directory to store backups
TIMESTAMP=$(date +%Y%m%d_%H%M%S)   # Timestamp for backup folder name
DATABASE_NAME="frvoldb"   # database name

# Create backup folder
mkdir -p "$BACKUP_DIR/$TIMESTAMP"

# Set full permissions for the folder
icacls "$BACKUP_DIR/$TIMESTAMP" /grant "Everyone:(OI)(CI)F"

# Run mongodump to create the backup
mongodump --db "$DATABASE_NAME" --out "$BACKUP_DIR/$TIMESTAMP"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully. Backup files are stored in: $BACKUP_DIR/$TIMESTAMP"
else
  echo "Backup failed."
fi
