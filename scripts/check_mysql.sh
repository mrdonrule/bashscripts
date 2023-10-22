#!/bin/bash

# Check if MySQL is running
if systemctl is-active --quiet mysql; then
    echo "MySQL is running."
else
    echo "MySQL is not running. Restarting..."
    systemctl start mysql   # This command may vary based on your MySQL service name or init system
fi
