#!/bin/bash
# chmod +x import_db.sh

# Set MySQL username and password
MYSQL_USER="root"
MYSQL_PASSWORD="root"

# Set the directory containing SQL files
SQL_DIR="./backups"

# Iterate over SQL files in the directory
for sql_file in "$SQL_DIR"/*.sql; do
    # Extract filename without extension
    filename=$(basename "$sql_file")
    db_name="${filename%.*}"

    # Import SQL file into MySQL
    echo "Importing $sql_file into database $db_name..."
    mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$db_name\`;"
    mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$db_name" < "$sql_file"
    echo "Import completed for $sql_file"
done

echo "All SQL files imported successfully."
