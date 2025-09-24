SRC=~/Documents/ProjectFiles/
DEST=~/Documents/Backups/ProjectFilesBackup/
rsync -avh $SRC $DEST
echo "Backup compelted on $(date)"

#Calling the logging script
/Users/jdeeezayy/backup_with_logging.sh
