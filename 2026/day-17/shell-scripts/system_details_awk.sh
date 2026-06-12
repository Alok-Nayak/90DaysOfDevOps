#!/bin/bash

<<comment
This is a script to check system information using awk commands
- RAM used
- Storage used
- Top processes
comment

check_memory() {
    # Grabs the "Available" memory column from the second row
    free -h | awk 'NR==2 {print $7}'
}

check_storage() {
    # Dynamically finds the root filesystem (/) and prints its available space ($4)
    df -h | awk '$6 == "/" {print $4}'
}

check_most_mem_consuming_process() {
    # Sorts processes by memory usage and prints the top one (NR==2 skips the header)
    ps aux --sort=-%mem | awk 'NR==2 {print "PID-"$2, " CPU-"$3"%", " MEM-"$4"%"}'
}

show_details() {
    echo "========== SYSTEM DETAILS =========="
    echo -n "Available Memory: "
    check_memory

    echo -n "Available Storage: "  
    check_storage

    echo "Most Memory Intensive Process: "
    check_most_mem_consuming_process
}

show_details

