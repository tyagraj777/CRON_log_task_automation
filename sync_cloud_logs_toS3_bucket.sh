#Objective: Automatically upload logs to an S3 bucket for backup.
#cron 0 * * * * /path/to/sync_logs_to_s3.sh


#!/bin/bash
LOG_DIR="/var/log/cloud"
BUCKET_NAME="my-cloud-logs"
aws s3 sync $LOG_DIR s3://$BUCKET_NAME/ --exclude "*.tmp"
