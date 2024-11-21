#Objective: Rotate logs daily to prevent excessive file size.
#JOB 0 0 * * * /path/to/log_rotation.sh

#!/bin/bash
LOG_DIR="/var/log/cloud"
ARCHIVE_DIR="/var/log/cloud/archived"
DATE=$(date +%Y-%m-%d)

mkdir -p $ARCHIVE_DIR
find $LOG_DIR -name "*.log" -type f -exec mv {} $ARCHIVE_DIR/{}_backup_$DATE \;

# Compress archived logs
find $ARCHIVE_DIR -name "*_backup_$DATE" -exec gzip {} \;
