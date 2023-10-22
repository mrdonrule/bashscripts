#!/bin/bash

# Check if httpd is running
if pgrep httpd >/dev/null 2>&1; then
    echo "httpd is running."
else
    echo "httpd is not running. Restarting..."
    systemctl restart httpd   # Use "service apache2 restart" if you're using Apache on Ubuntu
fi
