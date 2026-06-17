#!/bin/bash

# Configuration
BACKUP_DIR="/backup/mysql_custom_dumps"
DATE=$(date +"%Y-%m-%d_%H%M%S")

# Ensure the backup folder exists
mkdir -p "$BACKUP_DIR"

# Fetch all active databases (skipping structural system tables)
DATABASES=$(mysql -e "SHOW DATABASES;" | grep -Ev "Database|information_schema|performance_schema|sys|mysql")

echo "Starting CWP Database Export Process..."

for DB in $DATABASES; do
    echo "Compressing & Backing Up: $DB"
    
    # Export and compress instantly on the fly
    mysqldump --single-transaction --quick --routines --triggers "$DB" | gzip > "$BACKUP_DIR/${DB}_$DATE.sql.gz"
done

echo "Success! All database archives are safely stored in $BACKUP_DIR"
