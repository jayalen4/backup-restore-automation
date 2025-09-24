SRC=~/Documents/ProjectFiles/
DEST=~/Documents/Backups/ProjectFilesBackup/
LOG=~/Documents/Backups/backup.log

# Checking to see if the source exists
if [ ! -d "$SRC" ]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: Source Directory $SRC not Found." >>$LOG 
	exit 1
fi

# IF THE SOURCE EXISTS / PERFORM THE BACKUP
echo "$(date '+%Y-%m-%d %H:%M:%S') Starting backup..." >> "$LOG"
rsync -avh --delete "$SRC" "$DEST" >> "$LOG" 2>&1

# CHECK EXIT STATUS
if [ $? -eq 0 ]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') SUCCESS: Backup completed sucessfully"
else
	echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: Backup failed." >> $LOG
fi

#Filterting to keeping only 5 lines
tail -n 10 "$LOG" > "$LOG.tmp" && mv "$LOG.tmp" "$LOG"
