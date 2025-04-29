#!/bin/bash

#filepath: /home/derrick/linux-assignment/assignment5/arch_oldfiles.sh
# Check if the script is run with superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

TARGET_DIR=$1
ARCHIVE_DIR="$TARGET_DIR/archived"
LOG_FILE="/var/log/arch_oldfiles.log"
SKIPPED_LOG_FILE="/var/log/arch_oldfiles_skipped.log"

# Ensure the target directory is provided
if [ -z "$TARGET_DIR" ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi

# create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$(dirname "$SKIPPED_LOG_FILE")"
touch "$LOG_FILE"
touch "$SKIPPED_LOG_FILE"

# find and process files older than 30 days
find "$TARGET_DIR" -type f -mtime +30 ! -path "$ARCHIVE_DIR/*" | while read -r file; do
FILE_SIZE=$(du -h "$file" | cut -f1)

if [ "$FILE_SIZE" -gt 1073741824 ]; then
    # Skip files smaller than 1GB
   echo "$(date): Skipped large file: $file (size: $FILE_SIZE bytes)" >> "$SKIPPED_LOG_FILE"
   else
   # Move and compress files
   ARCHIVE_PATH="$ARCHIVE_DIR/$(basename "$file").gz"
    gzip -c "$file" > "$ARCHIVE_PATH" && rm "$file"
    echo "$(date): Archived and compressed: $file to $ARCHIVE_PATH" >> "$LOG_FILE"
fi
done

echo "File achiving completed. Check $LOG_FILE for details."
echo "Archived files log: $LOG_FILE"
echo skipped files log: $SKIPPED_LOG_FILE