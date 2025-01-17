create database if not exists Recovery;
use Recovery;

-- Step 1: Database Backup

-- Command to Back Up the Database
-- Use the mysqldump utility to create a backup of your database.
mysqldump -u [username] -p[password] [database_name] > [backup_file.sql]

-- Example:
mysqldump -u root -p my_database > my_database_backup.sql

-- i.) -u root: The username for the database.
-- ii.) -p: Prompts for the password.
-- iii.) my_database: The name of the database to back up.
-- iv.) my_database_backup.sql: The file where the backup is stored.

-- Verification:
-- Ensure the backup file is created by checking its location.

-- Step 2: Simulate Database Failure
-- Delete some records or drop the database to simulate a failure. For example:

 DROP DATABASE my_database;
 
 
--  Step 3: Restore the Database
-- Command to Restore the Database
-- Use the backup file created earlier to restore the database.
mysql -u [username] -p[password] [database_name] < [backup_file.sql]

-- Example:
mysql -u root -p my_database < my_database_backup.sql

-- i.) my_database: The name of the database to restore.
-- ii.) my_database_backup.sql: The backup file.



-- Step 4: Automate the Process
-- Create a shell script to automate the backup and recovery process.

-- Backup Script:
#!/bin/bash
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/backup/$TIMESTAMP"
DB_NAME="my_database"
MYSQL_USER="root"
MYSQL_PASSWORD="password"

mkdir -p "$BACKUP_DIR"
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME > "$BACKUP_DIR/$DB_NAME.sql"
echo "Backup completed: $BACKUP_DIR/$DB_NAME.sql"


-- Recovery Script:
#!/bin/bash
BACKUP_FILE="/backup/2025-01-01/my_database.sql"
DB_NAME="my_database"
MYSQL_USER="root"
MYSQL_PASSWORD="password"

mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME < $BACKUP_FILE
echo "Database restored from $BACKUP_FILE"





