#!/bin/bash

# Input and Validation
LOG_FILE=$1
LOG_LABEL=${2:-ERROR}     # Defaults to "ERROR" if $2 is blank
LINE_LIMIT=${3:-5}        # Defaults to 5 if $3 is blank

# Convert user filter label to uppercase for strict cross-matching
FILTER_LABEL=$(echo "$LOG_LABEL" | tr '[:lower:]' '[:upper:]')

if [ $# -eq 0 ]; then
    echo "Usage: $0 <path/to/log/file> [LOG_LABEL] [LINE_LIMIT]"
    echo "Example: $0 openstack.log WARNING 10"
    exit 1
elif [ ! -f "$LOG_FILE" ]; then
    echo "Error: The file '$LOG_FILE' does not exist.. Please ReCheck!!!"
    exit 1
fi

echo "+----------------------------------------------------------------------------------------------------------------+"
echo "|                                  SYSTEM LOG ANALYSIS REPORT                                                    |"
echo "+----------------------------------------------------------------------------------------------------------------+"

# Error Count Summary (Upgraded with Strict Label Matching Patterns)
echo -e "\n Log Count Summary:"
echo "-----------------------------------------------------------------------------------------------------------------"
for i in "ERROR" "Failed" "WARNING" "CRITICAL"
do
    # Match the label when it is surrounded by brackets, spaces, or punctuation boundaries
    STRICT_COUNT=$(grep -E -c "(\[|^|[[:space:]])${i}(\]|$|[[:space:]]|[[:punct:]])" "$LOG_FILE")
    printf "  • Total '%-8s' occurrences : %s\n" "$i" "$STRICT_COUNT"
done    

#  Critical Events
echo -e "\n Critical Events (Showing Top $LINE_LIMIT):"
echo "-----------------------------------------------------------------------------------------------------------------"
if grep -q "CRITICAL" "$LOG_FILE"; then
    printf "  %-10s %-25s %s\n" "LINE_NO" "TIMESTAMP" "RAW LOG LINE TEXT ENTRY"
    echo "----------------------------------------------------------------------------------------------------------------"
    grep -in "CRITICAL" "$LOG_FILE" | head -n "$LINE_LIMIT" | while IFS=: read -r line_num raw_content; do
        TIMESTAMP=$(echo "$raw_content" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]:_][0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]+)?|[0-9]{2}:[0-9]{2}:[0-9]{2}' | head -n 1)
        TIMESTAMP=${TIMESTAMP:-"N/A"}
        printf "  %-10s %-25s %s\n" "$line_num" "$TIMESTAMP" "$raw_content"
    done
else
    echo "  (No critical events found)"
fi

# Top Message Leaderboard Engine
SUPPORTED_LOG_LABELS="FATAL|EMERGENCY|PANIC|CRITICAL|ALERT|ERROR|SEVERE|FAILURE|FAILED|WARNING|WARN|INFO|NOTICE|DEBUG|TRACE"

# Pipeline Strategy: Capture real labels up front using boundary logic
RAW_DATA=$(grep -inE "(\[|^|[[:space:]])($SUPPORTED_LOG_LABELS)(\]|$|[[:space:]]|[[:punct:]])" "$LOG_FILE" | awk -F: -v target_label="$FILTER_LABEL" '
{
    line_no = $1
    log_line = substr($0, length(line_no) + 2)
    
    match_idx = match(toupper(log_line), "(\\[)?(FATAL|EMERGENCY|PANIC|CRITICAL|ALERT|ERROR|SEVERE|FAILURE|FAILED|WARNING|WARN|INFO|NOTICE|DEBUG|TRACE)(\\])?")
    if (match_idx > 0) {
        msg_payload = substr(log_line, match_idx + RLENGTH)
        matched_lbl = substr(log_line, match_idx, RLENGTH)
        
        gsub(/\[|\]/, "", matched_lbl)
        matched_lbl = toupper(matched_lbl)
        
        if (matched_lbl == target_label) {
            sub(/^[[:space:][:punct:]]*/, "", msg_payload)
            sub(/[[:space:]]*-[[:space:]]*(PID)?[[:space:]]*[0-9]+[[:space:]]*$/, "", msg_payload)
            sub(/[[:space:]]*$/, "", msg_payload)
            
            sig_mask = msg_payload
            gsub(/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+(:[0-9]+)?/, "<NET_ADDR>", sig_mask)
            gsub(/:[0-9]+/, ":<PORT>", sig_mask)
            gsub(/0x[0-9a-fA-F]+/, "<HEX>", sig_mask)
            
            combo_key = matched_lbl "\t" sig_mask
            if (!count[combo_key]) {
                first_line[combo_key] = line_no
                sample_msg[combo_key] = msg_payload
            }
            count[combo_key]++
        }
    }
}
END {
    for (key in count) {
        print count[key] "\t" first_line[key] "\t" key "\t" sample_msg[key]
    }
}' | sort -t$'\t' -k1 -rn)

# Calculate entry metrics safely
ACTUAL_AVAILABLE=$(echo "$RAW_DATA" | grep -v '^$' | wc -l)

# Sum up total hits across all leaderboard clusters for the filter type
LEADERBOARD_SUM=0
if [ "$ACTUAL_AVAILABLE" -gt 0 ]; then
    while IFS=$'\t' read -r count line_no label sig_mask message; do
        count_clean=$(echo "$count" | tr -d '[:space:]')
        if [ ! -z "$count_clean" ]; then
            LEADERBOARD_SUM=$((LEADERBOARD_SUM + count_clean))
        fi
    done <<< "$RAW_DATA"
fi

if [ "$ACTUAL_AVAILABLE" -eq 0 ]; then
    HEADER_TEXT="Showing 0 entries"
elif [ "$ACTUAL_AVAILABLE" -le "$LINE_LIMIT" ]; then
    HEADER_TEXT="Showing Top $ACTUAL_AVAILABLE (All $LEADERBOARD_SUM Matches Available)"
else
    HEADER_TEXT="Showing Top $LINE_LIMIT (of $ACTUAL_AVAILABLE Aggregated Groups)"
fi

echo -e "\n Leaderboard Filtered By [${FILTER_LABEL}] (${HEADER_TEXT}):"
echo "------ ---------------------------------------------------------------------------------------------------------"
printf "  %-12s %-7s %-10s %-25s %s\n" "LABEL" "COUNT" "LINE_NO" "TIMESTAMP SAMPLE" "FULL MESSAGE TEXT"
echo "----------------------------------------------------------------------------------------------------------------"

if [ "$ACTUAL_AVAILABLE" -gt 0 ]; then
    echo "$RAW_DATA" | head -n "$LINE_LIMIT" | while IFS=$'\t' read -r count line_no label sig_mask message; do
        count=$(echo "$count" | tr -d '[:space:]')
        line_no=$(echo "$line_no" | tr -d '[:space:]')
        
        ORIG_LINE=$(sed "${line_no}q;d" "$LOG_FILE")
        
        TIMESTAMP=$(echo "$ORIG_LINE" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]:_][0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]+)?|[0-9]{2}:[0-9]{2}:[0-9]{2}' | head -n 1)
        TIMESTAMP=${TIMESTAMP:-"N/A"}
        
        printf "  %-12s %-7s %-10s %-25s %s\n" "[$label]" "$count" "$line_no" "$TIMESTAMP" "$message"
    done
else
    echo "  (No matching messages found for filter context)"
fi

echo -e "+--------------------------------------------------------------------------------------------------------------+\n"
