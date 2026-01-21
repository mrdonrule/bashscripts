#!/bin/bash

# Log file
LOG_FILE="/var/log/cwp_reset_bandwidth.log"

echo "========== Bandwidth Reset Started: $(date) ==========" >> "$LOG_FILE"

# Get all CWP usernames
USER_LIST=$(ls /home)

for USER in $USER_LIST; do
    # Skip system folders
    if [[ "$USER" == "mysql" || "$USER" == "cwp" || "$USER" == "backup" ]]; then
        continue
    fi

    echo "Resetting bandwidth for: $USER" >> "$LOG_FILE"

    /scripts/cwp_api account reset_bandwidth "$USER" >> "$LOG_FILE" 2>&1

    if [ $? -eq 0 ]; then
        echo "SUCCESS: $USER" >> "$LOG_FILE"
    else
        echo "FAILED: $USER" >> "$LOG_FILE"
    fi
done

echo "========== Bandwidth Reset Finished: $(date) ==========" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
