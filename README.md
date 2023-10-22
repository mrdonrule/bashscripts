A collection of simple Bash scripts.

## Getting Started

1. [Goaccess.sh](scripts/goaccess.sh): Delete Go access directory in CWP or in linux located in /hoe/{user}
1. [ClearLog.sh](scripts/clearlog.sh): Clear or truncate all logs to save space
2. [MysqlCheck.sh](scripts/check_mysql.sh) shell script to check if the MySQL server is running and restart it if it's not.
3. [HTTPDcheck.sh](scripts/check_httpd.sh) shell script to check if the Apache or HTTPD server is running and restart it if it's not.
4. [BINDcheck.sh](scripts/check_bind.sh) shell script to check if the BIND (Berkeley Internet Name Domain) DNS server is running and restart it if it's not.

After creating these files you can make them executable by running these command as root ```bash chmod +x filename.sh ```
Set a cronjob every minute,  Example ```bash crontab -e ```  them edit cron internace with ```bash /path/to/your/command * * * * * /root/check_bind.sh ```

## License

MIT
