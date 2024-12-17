#!/bin/bash
# chmod +x backup_db.sh

# Check if username and password are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <mysql_username> <mysql_password>"
    exit 1
fi

MYSQL_USER="$1"
MYSQL_PASSWORD="$2"

# Create a directory for backups
mkdir -p "backups"

# Loop through all databases and create backups in the directory
for I in $(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e 'show databases' -s --skip-column-names); do
    mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$I" | gzip > "./backups/$I.sql.gz"
done
