#!/bin/bash

#Truncate file content to zero content
truncate -s 0  /usr/local/apache/logs/*bytes
truncate -s 0  /usr/local/apache/logs/*log
truncate -s 0  /usr/local/apache/domlogs/*bytes
truncate -s 0  /usr/local/apache/domlogs/*log
truncate -s 0 /var/log/messages
truncate -s 0 /var/log/maillog
truncate -s 0 /var/log/*log
truncate -s 0  /usr/local/cwpsrv/logs/access_log
truncate -s 0  /usr/local/cwpsrv/logs/error_log
truncate -s 0  /var/log/cron
truncate -s 0  /var/log/secure
truncate -s 0  /var/log/cwp/services_action.log
truncate -s 0  /var/log/cwp/cwp_sslmod.log
truncate -s 0  /var/log/cwp/cwp_cron.log
truncate -s 0  /var/log/cwp/cwp_backup.log
truncate -s 0  /var/log/cwp/activity.log
truncate -s 0  /usr/local/cwpsrv/var/services/roundcube/logs/errors
truncate -s 0  /var/log/mysql/mysql.log
# Remove all file from the folder that contains
rm -rf /var/log/maillog-*
rm -rf /var/log/monit.log-*
rm -rf /var/log/spooler-*
rm -rf /var/log/messages-*
rm -rf /var/log/secure-*
rm -rf /var/log/pureftpd.log-*
rm -rf /var/log/yum.log-*
rm -rf /var/log/monit.log-*
rm -rf /var/log/cron-*
rm -rf /var/lib/clamav/tmp.*
