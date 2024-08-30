#!/bin/bash
# chmod +x import_db.sh

# Set MySQL username and password
MYSQL_USER="root"
MYSQL_PASSWORD="root"

# Set the directory containing SQL files
SQL_DIR="./backups"

# Iterate over SQL and GZ files in the directory
for file in "$SQL_DIR"/*.{sql,gz}; do
    # Check if file exists (to handle case when no .sql or .gz files are found)
    [ -e "$file" ] || continue

    # Extract filename without extension
    filename=$(basename "$file")
    db_name="${filename%.*}"

    # Import SQL file or GZ file into MySQL
    echo "Importing $file into database $db_name..."
    mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$db_name\`;"

    if [[ "$file" == *.gz ]]; then
        gunzip < "$file" | mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$db_name"
    else
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$db_name" < "$file"
    fi

    echo "Import completed for $file"
done

echo "All SQL and GZ files imported successfully."
