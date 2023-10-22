#!/bin/bash

# Check if BIND is running
if systemctl is-active --quiet named; then
    echo "BIND is running."
else
    echo "BIND is not running. Restarting..."
    systemctl start named   # This command may vary based on your system's configuration
fi
