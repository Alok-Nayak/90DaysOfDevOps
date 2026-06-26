#!/bin/bash

set -euo pipefail

date=$(date +%Y-%m-%d)

# Task 1: Input and Validation
if [ $# -eq 0 ]; then
        echo "Please provide the log file path as argument. e.g.: log_analyzer.sh  <path/to/log/file>"
        exit 1
fi

LOG_FILE=$1
LOG_LABEL=${2:-ERROR}

if [ ! -f "$LOG_FILE" ]; then
        echo "The '$LOG_FILE' file does not exist.. Please ReCheck!!!"
        exit 1
fi

# Task 2: Error Count
for i in "ERROR" "Failed"
do
        echo "The Total '$i' count : $(grep -ic "$i" "$LOG_FILE")"
done

# Task 3: Critical Events
echo ""
echo -e "---Top 5 Critical Events---- \n$(grep -in "CRITICAL" "$LOG_FILE" | head -5 )"
echo ""

# Task 4: Top Error Messages
echo "--- Top 5 $LOG_LABEL Messages ---"
grep "\[$LOG_LABEL\]" "$LOG_FILE" | cut -d']' -f2 | cut -d'-' -f1 | sort | uniq -c | sort -rn | head -5
echo " "

# Task 5: Summary Report

REPORT_FILE="log_report_${date}.txt"
REPORT_DIR="reports"

if [ -d "$REPORT_DIR" ]; then
	echo ""
	echo " The $REPORT_DIR directory exists."
else
	echo " The '$REPORT_DIR' directory does not exist."
	mkdir -p "$REPORT_DIR"
	echo " The '$REPORT_DIR' dir created successfully."
	echo ""
fi

echo "Generating report: $REPORT_FILE..."

echo "" > "$REPORT_DIR/$REPORT_FILE"
echo "--- Log Analysis Summary Report ---" >> "$REPORT_DIR/$REPORT_FILE"
echo "" >>"$REPORT_DIR/$REPORT_FILE"
echo "Date of analysis: $date" >> "$REPORT_DIR/$REPORT_FILE"
echo "Log file name: $LOG_FILE" >> "$REPORT_DIR/$REPORT_FILE"
echo "Total lines processed: $(wc -l < "$LOG_FILE")" >> "$REPORT_DIR/$REPORT_FILE"

echo "Total error count: $(grep -ic "ERROR" "$LOG_FILE")" >> "$REPORT_DIR/$REPORT_FILE"
echo "" >> "$REPORT_DIR/$REPORT_FILE"

echo "--- Top 5 $LOG_LABEL Messages ---" >> "$REPORT_DIR/$REPORT_FILE"
echo "" >> "$REPORT_DIR/$REPORT_FILE"
grep "\[$LOG_LABEL\]" "$LOG_FILE" | cut -d']' -f2 | cut -d'-' -f1 | sort | uniq -c | sort -rn | head -5 >> "$REPORT_DIR/$REPORT_FILE"
echo "" >> "$REPORT_DIR/$REPORT_FILE"

echo "--- Critical Events with Line Numbers ---" >> "$REPORT_DIR/$REPORT_FILE"
echo "" >> "$REPORT_DIR/$REPORT_FILE"
grep -in "CRITICAL" "$LOG_FILE" | tail -15 >> "$REPORT_DIR/$REPORT_FILE"
echo "" >> "$REPORT_DIR/$REPORT_FILE"

echo "Report saved successfully!"



# Task 6: Archive Processed Logs
 
ARCHIVE_DIR="archive"

if [ -d "$ARCHIVE_DIR" ]; then
	echo ""
	echo "The $ARCHIVE_DIR directory exists."
else
	echo " '$ARCHIVE_DIR' directory does not exist."
	mkdir -p "$ARCHIVE_DIR"
	echo " The '$ARCHIVE_DIR' dir created successfully."
fi


if mv "$LOG_FILE" "$ARCHIVE_DIR"; then
	echo "Success: '$LOG_FILE' has been moved to '$ARCHIVE_DIR'"
else
	echo "Error: Failed to move log file to archive directory."
fi

