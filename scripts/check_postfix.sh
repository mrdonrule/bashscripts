#!/bin/bash

# Check if postfix service is active
if ! systemctl is-active --quiet postfix; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Postfix is down. Attempting restart..." >> /var/log/postfix_monitor.log
    systemctl restart postfix
    
    # Optional: Verify if restart was successful
    if systemctl is-active --quiet postfix; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Postfix restarted successfully." >> /var/log/postfix_monitor.log
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to restart Postfix!" >> /var/log/postfix_monitor.log
    fi
fi
