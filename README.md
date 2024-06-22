A collection of simple Bash scripts.

## Getting Started

1. [Goaccess.sh](scripts/goaccess.sh): Delete Go access directory in CWP or in linux located in /hoe/{user}
1. [ClearLog.sh](scripts/clearlog.sh): Clear or truncate all logs to save space
2. [MysqlCheck.sh](scripts/check_mysql.sh) shell script to check if the MySQL server is running and restart it if it's not.
3. [HTTPDcheck.sh](scripts/check_httpd.sh) shell script to check if the Apache or HTTPD server is running and restart it if it's not.
4. [BINDcheck.sh](scripts/check_bind.sh) shell script to check if the BIND (Berkeley Internet Name Domain) DNS server is running and restart it if it's not.
5. [CheckNginx.sh](scripts/check_nginx.sh) shell script to check if the Check if nginx server is running and restart it if it's not restart
6. [RemoveBadHtaccess](scripts/remove_bad_htaccess.sh) Remove bad htaccess
7. [BackupEachDatase](scripts/db_table_backup.sh) Backup each database using shel

After creating these files you can make them executable by running these command as root ``` chmod +x filename.sh ```
Set a cronjob every minute,  Example ``` crontab -e ```  them edit cron internace with ``` /path/to/your/command * * * * * /root/check_bind.sh ```
## BAD HTACCESS EXAMPLE
<FilesMatch ".(py|exe|phtml|php|PhP|php5|suspected)$">
  Order Allow,Deny
  Deny from all
</FilesMatch>
## License

MIT
