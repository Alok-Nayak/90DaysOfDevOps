#!/bin/bash
<<comment
# Without pipefail (Returns 0/Success because 'wc' succeeds)
set -x
cat missing_file.txt | wc -l
echo "Exit code without pipefail: $?" 

# With pipefail
set -o pipefail
cat missing_file.txt | wc -l
echo "Exit code with pipefail: $?" 



echo "-----------------------------------------------------"

#comment

#!/bin/bash
set -ex

# Define cleanup function
cleanup() {
	echo "Starting the TRAP"
	echo " Cleaning up temporary files..."
	rm -f /tmp/temp_report.txt
}

# Register the trap for script EXIT
trap cleanup EXIT

# Script operations
echo "Generating report data..." > /tmp/temp_report.txt
echo "Processing records..."
ls /invalid_path_to_trigger_crash  

# Script fails, but trap STILL runs!

comment

echo "_______________________________________________"


# Define the trap action
no_quit() {
    echo -e "\n Nice try! You tried to press Ctrl+C, but I trapped it."
    echo "Exiting cleanly now."
    exit 0
}

# Trap the INT (Interrupt) signal
trap no_quit INT

echo "I am running a long loop. Try to stop me using Ctrl+C!"
for i in {1..5}; do
    echo "Processing step $i..."
    sleep 2
done


#comment

echo "____________________________________________"


