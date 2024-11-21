#Objective: Remove logs older than 30 days to save storage.
#cron 0 2 * * * /path/to/clean_old_logs.sh


#!/bin/bash
LOG_DIR="/var/log/cloud"
find $LOG_DIR -type f -name "*.log" -mtime +30 -exec rm -f {} \;
