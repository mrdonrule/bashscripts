#!/bin/bash

# Ensure root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run as root."
  exit 1
fi

echo "Starting log truncation and cleanup..."

# 1. Define files and wildcard targets safely in an array
LOG_FILES=(
  # System Logs
  "/var/log/messages"
  "/var/log/maillog"
  "/var/log/cron"
  "/var/log/secure"
  "/var/log/spooler"
  "/var/log/boot.log"
  "/var/log/firewalld"
  
  # MySQL / MariaDB
  "/var/log/mysql/mysql.log"
  "/var/log/mariadb/mariadb.log"
  "/var/log/mysqld.log"
  
  # CWP Specific Logs
  "/usr/local/cwpsrv/logs/access_log"
  "/usr/local/cwpsrv/logs/error_log"
  "/var/log/cwp/services_action.log"
  "/var/log/cwp/cwp_sslmod.log"
  "/var/log/cwp/cwp_cron.log"
  "/var/log/cwp/cwp_backup.log"
  "/var/log/cwp/activity.log"
  "/usr/local/cwpsrv/var/services/roundcube/logs/errors.log"
  "/usr/local/cwpsrv/var/services/roundcube/logs/errors"
  
  # cPanel Specific Logs
  "/usr/local/cpanel/logs/error_log"
  "/usr/local/cpanel/logs/access_log"
  "/var/log/chkservd.log"
)

# Enable nullglob so unmatched wildcards expand to nothing instead of literal strings
shopt -s nullglob

# Collect wildcard matches into the array
LOG_FILES+=(
  /var/log/*.log
  /usr/local/apache/logs/*bytes
  /usr/local/apache/logs/*log
  /usr/local/apache/domlogs/*bytes
  /usr/local/apache/domlogs/*log
  /var/log/apache2/*log
  /var/log/httpd/*log
)

# Truncate active logs safely
for file in "${LOG_FILES[@]}"; do
  if [ -f "$file" ]; then
    truncate -s 0 "$file"
  fi
done

# 2. Clean up rotated logs and temporary files
ROTATED_PATTERNS=(
  "/var/log/maillog-*"
  "/var/log/monit.log-*"
  "/var/log/spooler-*"
  "/var/log/messages-*"
  "/var/log/secure-*"
  "/var/log/pureftpd.log-*"
  "/var/log/yum.log-*"
  "/var/log/cron-*"
  "/var/log/*.gz"
  "/var/log/*.old"
  "/var/lib/clamav/tmp.*"
)

for pattern in "${ROTATED_PATTERNS[@]}"; do
  for file in $pattern; do
    if [ -e "$file" ]; then
      rm -rf "$file"
    fi
  done
done

# Disable nullglob
shopt -u nullglob

# 3. Reload rsyslog / systemd-journald to release file handles if active
if command -v systemctl &> /dev/null; then
  systemctl reload rsyslog &> /dev/null || true
fi

echo "Log cleanup completed successfully."
