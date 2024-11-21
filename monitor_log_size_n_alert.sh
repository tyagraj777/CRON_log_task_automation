#Objective: Monitor log file size and alert if it exceeds a threshold.
#cron */10 * * * * /path/to/monitor_log_size.sh


#!/bin/bash
LOG_DIR="/var/log/cloud"
THRESHOLD=1000000 # 1MB in bytes

for file in $LOG_DIR/*.log; do
  SIZE=$(stat -c%s "$file")
  if [ $SIZE -gt $THRESHOLD ]; then
    echo "Log file $file exceeds threshold size" | mail -s "Log Alert" admin@example.com
  fi
done
