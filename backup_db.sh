#!/bin/bash
# chmod +x backup_db.sh

MYSQL_USER="root"
MYSQL_PASSWORD="root"

# Get today's date in YYYY-MM-DD format
# TODAY=$(date +%Y-%m-%d)

# Create a directory with today's date
# mkdir -p "$TODAY"
mkdir -p "backups"

# Loop through all databases and create backups in the directory
for I in $(mysql  -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e 'show databases' -s --skip-column-names); do
    mysqldump  -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$I" | gzip > "./backups/$I.sql.gz"
done
