#Objective: Parse logs for errors and generate a daily report.
#cron 30 23 * * * /path/to/generate_error_report.sh


#!/bin/bash
LOG_DIR="/var/log/cloud"
REPORT_DIR="/var/reports"
DATE=$(date +%Y-%m-%d)

mkdir -p $REPORT_DIR
grep -i "ERROR" $LOG_DIR/*.log > $REPORT_DIR/error_report_$DATE.txt
