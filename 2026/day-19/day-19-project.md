# Day 19 – Shell Scripting Project: Log Rotation, Backup & Crontab


### Task 1: Log Rotation Script
Create `log_rotate.sh` that:
1. Takes a log directory as an argument (e.g., `/var/log/myapp`)
2. Compresses `.log` files older than 7 days using `gzip`
3. Deletes `.gz` files older than 30 days
4. Prints how many files were compressed and deleted
5. Exits with an error if the directory doesn't exist

**Answer**
```bash
#!/bin/bash

set -euo pipefail

echo ""
echo "*********** Starting Log Rotation ***********"

LOG_DIR=$1


if [ ! -d "$LOG_DIR" ]; then
	echo "Error: Directory '$LOG_DIR' does not exist."
	exit 1
fi
echo ""
echo "Success: Directory $LOG_DIR exists, Proceeding execution..."
echo ""
echo "     ----   ---   ---   ---   ---   ----    "
echo ""

files_to_compress=$(find $LOG_DIR -type f -name "*.log" -mtime +7 | wc -l)

if [ "$files_to_compress" -gt 0 ]; then
	echo "Found $files_to_compress files older than 7 days to compress..."
	find "$LOG_DIR" -type f -name "*.log" -mtime +7 -print0 | xargs -0 gzip -9
	echo "Successfully compressed $files_to_compress files."
else
    echo "No .log files older than 7 days found to compress."
fi

echo ""
echo "___________________________________________________________-"
echo ""

files_to_delete=$(find "$LOG_DIR" -type f -name "*.gz" -mtime +30 | wc -l)

if [ "$files_to_delete" -gt 0 ]; then
    echo "Found $files_to_delete compressed files older than 30 days to purge..."
    find "$LOG_DIR" -type f -name "*.gz" -mtime +30 -print0 | xargs -0 rm -f
    echo ""
    echo "Successfully deleted $files_to_delete files."
else
    echo "No .gz files older than 30 days found to delete."
fi
echo ""
echo "**********************************************"

echo "    Log Rotation Completed Successfully!   "

echo "**********************************************"
echo ""

```

---

## Task 2: Server Backup Script
Create `backup.sh` that:
1. Takes a source directory and backup destination as arguments
2. Creates a timestamped `.tar.gz` archive (e.g., `backup-2026-02-08.tar.gz`)
3. Verifies the archive was created successfully
4. Prints archive name and size
5. Deletes backups older than 14 days from the destination
6. Handles errors — exit if source doesn't exist

**Answer**

```bash
#!/bin/bash

set -euo pipefail

<< readme

This script for backup with 5day rotation.
Useage: 
./log_rotate.sh < source path > < destination path >
readme

display_usage(){
	echo "Useage: ./log_rotate.sh <source path> <destination path> "
}

if [ $# -ne 2 ]; then
	display_usage
fi

keep_backup_for_days=14
source_dir=$1
backup_dir=$2

timestamp=$( date '+%Y-%m-%d-%H-%M-%S')

create_backup(){
	tar -czf "${backup_dir}/backup_${timestamp}.tar.gz" "$source_dir" > /dev/null
	if [ $? -eq 0 ]; then
                echo " Backup generated successfully for ${timestamp}"
		echo " Backup Size: $(du -sh "${backup_dir}/backup_${timestamp}.tar.gz" | awk '{print $1}')"
        else
                echo "Backup failed!"
                exit 1
        fi
}

perform_rotation(){
	backups=($(ls -t "${backup_dir}/backup_"*.tar.gz 2>/dev/null))

	#echo ${backups[@]}  #Printing the backups array
	if  [ "${#backups[@]}" -gt $keep_backup_for_days  ]; then
		echo "Performing rotation for 14 days..."

		backups_to_remove=("${backups[@]:$keep_backup_for_days}")

		for backup in "${backups_to_remove[@]}";
		do 
			rm -f ${backup}
		done
	fi
}

create_backup
perform_rotation

```
---

### Task 3: Crontab
1. Read: `crontab -l` — what's currently scheduled?

**Answer**
Nothing

2. Understand cron syntax:
   ```
   * * * * *  command
   │ │ │ │ │
   │ │ │ │ └── Day of week (0-7)
   │ │ │ └──── Month (1-12)
   │ │ └────── Day of month (1-31)
   │ └──────── Hour (0-23)
   └────────── Minute (0-59)
   ```
3. Write cron entries (in your markdown, don't apply if unsure) for:
   - Run `log_rotate.sh` every day at 2 AM
    - **Ans.**: ` 0 2 * * * bash /home/alok-nayak/DevOps/workdir/shell-script/log_rotate.sh`

   - Run `backup.sh` every Sunday at 3 AM
    - **Ans.**: ` 0 2 * * * bash /home/alok-nayak/DevOps/workdir/shell-script/backup.sh` 

   - Run a health check script every 5 minutes
    - **Ans.**: ` */5 * * * * bash /home/alok-nayak/DevOps/workdir/shell-script/health_check.sh >> /var/log/system_health.log 2>&1 `
---

### Task 4: Combine — Scheduled Maintenance Script
Create `maintenance.sh` that:
1. Calls your log rotation function
2. Calls your backup function
3. Logs all output to `/var/log/maintenance.log` with timestamps
    - Created 'test_logs/logs/maintenance.log`.
4. Write the cron entry to run it daily at 1 AM
    - **CronEntry** : `0 1 * * * bash /home/alok-nayak/DevOps/workdir/shell-script/maintenance.sh`

**maintenance.sh**
```bash
#!/bin/bash

set -u

LOG_FILE="test_logs/logs/maintenance.log"

exec >> "$LOG_FILE" 2>&1

log_header() {
    echo "==================================================="
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "==================================================="
}

log_header "SYSTEM MAINTENANCE PIPELINE INITIATED"

SCRIPT_DIR="/home/alok-nayak/DevOps/workdir/shell-script"
TARGET_LOG_DIR="test_logs/logs"  # Input for log_rotate.sh
BACKUP_SRC="test_logs/logs"      # Input 1 for backup.sh
BACKUP_DEST="backup"            # Input 2 for backup.sh

#Log Rotation
echo ""
echo "[1/3] Starting Log Rotation..." > /dev/tty
echo "[Step 1/3] Triggering Log Rotation..."
"$SCRIPT_DIR/log_rotate.sh" "$TARGET_LOG_DIR"

LOG_ROTATE_STATUS=$?

if [ $LOG_ROTATE_STATUS -eq 0 ]; then
    echo "> Log rotation completed successfully."
else
    echo "> ERROR: Log rotation failed with exit code $LOG_ROTATE_STATUS"
fi
echo "[1/3] Log Rotation Complete..." > /dev/tty

#Execute System Backup
echo ""
echo "[2/3] Executing File Backup..." > /dev/tty
echo "[Step 2/3] Triggering System Backup..."
"$SCRIPT_DIR/backup.sh" "$BACKUP_SRC" "$BACKUP_DEST"
BACKUP_STATUS=$?

if [ $BACKUP_STATUS -eq 0 ]; then
    echo "> System backup completed successfully."
else
    echo "> ERROR: System backup failed with exit code $BACKUP_STATUS"
fi
echo "[2/3] File Backup Complete..." > /dev/tty
#Health Check
echo ""
echo "[3/3] Running System Health Check..." > /dev/tty
echo "[Step 3/3] Running Infrastructure Health Check..."
"$SCRIPT_DIR/healthcheck.sh"

HEALTH_STATUS=$?

echo ""
echo "[3/3] Health Check Complete..." > /dev/tty
# Final Pipeline Evaluation

if [ $LOG_ROTATE_STATUS -eq 0 ] && [ $BACKUP_STATUS -eq 0 ] && [ $HEALTH_STATUS -eq 0 ]; then
    log_header "MAINTENANCE PIPELINE COMPLETED SUCCESSFULLY"
else
    log_header " MAINTENANCE PIPELINE COMPLETED WITH ERRORS (CHECK ABOVE LOGS)"
fi

echo -e "\n\n" 

```
---
### 3 key points
- Figured out how to use exec >> to automatically dump all standard output and error logs (2>&1) straight into a file so the terminal stays clean.
- Learned how to schedule a script to run daily at 1 AM using cron.
- Learned how to write a single controller script to run multiple independent scripts (backup, logrotate, healthcheck) without them interfering with each other's variables or crashing the whole run if one fails.




