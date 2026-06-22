#!/bin/bash

set -euo pipefail

if [ $# -eq 0 ]; then
	echo "Please provide log directory e.g. log_rotate.sh <path/to/log/dir>"
	exit 1 
fi

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
