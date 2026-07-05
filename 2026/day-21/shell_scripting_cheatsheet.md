# Shell Scripting Cheat Sheet
## A quick-reference guide for Linux system administration and DevOps automation pipelines.

##  Quick Reference Table

| Topic | Key Syntax | Example |
|-------|-----------|---------|
| Variable | `VAR="value"` | `NAME="DevOps"` |
| Argument | `$1`, `$2` | `./script.sh arg1` |
| If | `if [ condition ]; then` | `if [ -f file ]; then` |
| For loop | `for i in list; do` | `for i in 1 2 3; do` |
| Function | `name() { ... }` | `greet() { echo "Hi"; }` |
| Grep | `grep pattern file` | `grep -i "error" log.txt` |
| Awk | `awk '{print $1}' file` | `awk -F: '{print $1}' /etc/passwd` |
| Sed | `sed 's/old/new/g' file` | `sed -i 's/foo/bar/g' config.txt` |

### Task 1: Basics

1. **Shebang (`#!/bin/bash`) — what it does and why it matters**

    - It tells the linux kernel which interpreter to use.

2. **Running a script — `chmod +x`, `./script.sh`, `bash script.sh`**

    - `chmod +x` - Giving executable permission to a file/script.
    - `./script.sh` - Executing a script via path with executable permission.
    - `bash script.sh` - Executing a script without executaion permission(+x).
 
3. **Comments — single line (`#`) and inline**

    - Used to document scripts. Single-line comments start with #.
    - # This is a dedicated single-line comment
    - echo "Hello World" # This is an inline comment

4. **Variables — declaring, using, and quoting (`$VAR`, `"$VAR"`, `'$VAR'`)**

    - No spaces around the = sign during variable assignment. 
    - Always double-quote variables when expanding to prevent word splitting and globbing.

**```bash
NAME="Alok"   # Declare variable
echo $NAME        # Basic usage
echo "$NAME"      # Correct: Double quotes allow variable expansion
echo '$NAME'      # Literal: Single quotes prevent expansion (outputs: $NAME)
```
5. Reading user input — `read`

- `read -p "Hey what's your name?" NAME` (Input: Alok)
- Captures interactive keyboard entry from the user.
- echo $NAME (Output: Alok )

6. Command-line arguments — `$0`, `$1`, `$#`, `$@`, `$?`
- Positional parameters passed to the script at runtime.
- ```bash
echo "Script name: $0"
echo "First argument: $1"
echo "Total arguments count: $#"
echo "All arguments passed: $@"
echo "Exit status of last command: $?"

```
---

### Task 2: Operators and Conditionals

1. **String comparisons — `=`, `!=`, `-z`, `-n`**

    - [ "$A" = "$B" ]   # True if A & B  strings are equal
    - [ "$A" != "$B" ]  # True if strings are not equal
    - [ -z "$A" ]       # True if string is empty/null
    - [ -n "$A" ]       # True if string is not empty

2. **Integer comparisons — `-eq`, `-ne`, `-lt`, `-gt`, `-le`, `-ge`**

    - [ "$X" -eq "$Y" ] # X equal to Y
    - [ "$X" -ne "$Y" ] # X not equal to Y
    - [ "$X" -lt "$Y" ] # X less than Y
    - [ "$X" -gt "$Y" ] # X greater than Y
    - [ "$X" -le "$Y" ] # X less than or equal to Y
    - [ "$X" -ge "$Y" ] # X greater than or equal to Y

**Ex: -**
```bash

#!/bin/bash

EXP=8

if [ "$EXP" -lt 5 ]; then
    echo "Junio candidate."
elif [ "$EXP" -ge 5 ]; then
    echo "Senior level candidate eligible for technical interview."
fi

```

3. **File test operators — `-f`, `-d`, `-e`, `-r`, `-w`, `-x`, `-s`**

    - `[ -f "$FILE" ]`    # True if regular file exists
    - `[ -d "$DIR"  ]`    # True if directory exists
    - `[ -e "$PATH" ]`    # True if path exists (file, dir, link, etc.)
    - `[ -r "$FILE" ]`    # True if readable
    - `[ -w "$FILE" ]`    # True if writable
    - `[ -x "$FILE" ]`    # True if executable
    - `[ -s "$FILE" ]`    # True if file exists and has size greater than 0.

**Ex: -**

```bash

#!/bin/bash

LOG_FILE="app.log"

# Check if file exists and actually has data inside it

if [ -f "$LOG_FILE" ] && [ -s "$LOG_FILE" ]; then
    echo "Log file found and contains data. Copying to backup..."
    cp "$LOG_FILE" "backup_$(date +%F).log"
else
    echo "Skipping backup: File does not exist or is completely empty."
fi

```



4. **`if`, `elif`, else` syntax**

```bash

if [ "$A" -gt "$B" ]; then
        echo "$A is bigger.."
elif [ "$A" -lt "$B" ]; then
        echo "$A is smaller.."
else
        echo "Both are same"
fi

``` 

5. **Logical operators — `&&`, `||`, `!`**

    - Used to combine multiple conditions together (&& for AND, || for OR) or invert a condition (! for NOT).

```bash

# Both conditions must be true (AND)
if [ "$USER" = "admin" ] && [ "$ENV" = "prod" ]; then
    echo "Access granted to production infrastructure."
fi

# At least one condition must be true (OR)
if [ "$DEPLOY_STATUS" = "failed" ] || [ "$FORCE_ROLLBACK" = "true" ]; then
    echo "Initiating immediate rollback..."
fi

# Reverses the result (NOT) - true if the directory does NOT exist
if [ ! -d "/var/log/nginx" ]; then
    echo "Nginx log directory is missing!"
fi

```

6. **Case statements — `case ... esac`**

    - Case statement is like synonyms of if & else if statement.

```bash

case "$1" in
    start)   echo "Starting service..." ;;
    stop)    echo "Stopping service..." ;;
    restart) echo "Restarting..." ;;
    *)       echo "Usage: $0 {start|stop|restart}" ;;
esac

```
---

### Task 3: Loops

1. **`for` loop — list-based and C-style**

    - **List-based loop

```bash

for ENV in dev stage prod; do
    echo "Env: $ENV"
done

```
    - **C-style loop
```bash

for ((i=1; i<=5; i++)); do
    echo "Index: $i"
done

```

2. **`while` loop**
    - Runs as long as the condition evaluates to true.

```bash

COUNT=1
while [ $COUNT -le 3 ]; do
    echo "Count: $COUNT"
    ((COUNT++))
done

```
3. **`until` loop**
    - Runs as long as the condition evaluates to false (stops when true).
```bash
COUNT=1
until [ $COUNT -gt 3 ]; do
    echo "Count: $COUNT"
    ((COUNT++))
done
```
4. **Loop control — `break`, `continue`**
    - **Break**: Stop the loop entirely right now and don't process anything else.
```bash
for num in 1 2 3; do
    if [ "$num" -eq 2 ]; then
        break     # Stop completely at 2
    fi
    echo "$num"
done
```
    - **Continue** : Skip the rest of this specific round and move to the next item.
```bash
for num in 1 2 3; do
    if [ "$num" -eq 2 ]; then
        continue  # Skip number 2
    fi
    echo "$num"
done
```

5. **Looping over files — `for file in *.log`
    - Here this checks cur rent directory and chek for any file end with `.log` and print the name.

```bash

for LOG in *.log; do
    [ -f "$LOG" ] || continue # Handle empty matches gracefully
    echo "Processing $LOG"
done

```
6. **Looping over command output — `while read line`**

```bash

df -h | while read -r LINE; do
    echo "Disk line: $LINE"
done

```
---

### Task 4: Functions

1. **Defining a function — `function_name() { ... }`**
2. **Calling a function**

```bash

name=${1:- "<Your Name>"}

myfunction(){
        echo "Hello, Have a Great Time $name"
}

myfunction alok

```
3. **Passing arguments to functions — `$1`, `$2` inside functions**

```bash
#!/bin/bash

name=${1:- "<Your Name>"}

second_args=${2:-  "<You haven't provided any second argument>"}

myfunction(){
        echo "Hello $name"
        echo "Your second argument is : $second_args"
}

myfunction

```

4. **Return values — `return` vs `echo`**
    - return sends an exit status code, while echo outputs actual data string payload.
```bash
check_status() {
    return 1 # Fails status
}

check_status
echo "Function exited with code: $?"
```

5. **Local variables — `local`**
    - **Global Variable :** Accessible anywhere in the script. Created by default.
    - **Local Variable :** Accessible only inside the function where it is made. It disappears when the function ends.

```bash
test_variables() {
    local my_local="I am local"
    my_global="I am global"
}

test_variables

echo "Local variable: $my_local"
echo "Global variable: $my_global"

```
---

### Task 5: Text Processing Commands

1. **`grep` — search patterns, `-i`, `-r`, `-c`, `-n`, `-v`, `-E`**
    - `grep "error" app.log`          # Search pattern
    - `grep -i "error" app.log`       # Case-insensitive
    - `grep -r "CONN_REFUSED" /var/`  # Recursive directory search
    - `grep -c "WARN" app.log`        # Count lines matching pattern
    - `grep -n "FATAL" app.log`       # Print line number with match
    - `grep -v "DEBUG" app.log`       # Invert match (exclude DEBUG)
    - `grep -E "err|fail" app.log`    # Extended regex (OR match)

2. **`awk` — print columns, field separator, patterns, `BEGIN/END`**
    - `awk '{print $1}' auth.log`                  # Print first column (whitespace delimited)
    - `awk -F: '{print $1, $6}' /etc/passwd`       # Use ':' as custom field separator
    - `awk '/ERROR/ {print $3}' app.log`           # Print 3rd column only on rows containing 'ERROR'
    - `awk 'BEGIN {print "START"} {print $1} END {print "END"}' file` # Run actions before/after processing

3. `sed` — substitution, delete lines, in-place edit
    - `sed 's/Mango/Apple/g' config.json`          # Substitute Mango with Apple (outputs to terminal)
    - `sed -i 's/localhost/127.0.0.1/g' file`      # In-place edit (saves changes directly to file)
    - `sed '3d' file`                              # Delete line number 3 from output

4. `cut` — extract columns by delimiter
    - `cut -d':' -f1,3 /etc/passwd`            # Extract specific fields (1 and 3) using ':' delimiter
    - `cut -d'-' -f1 data.txt`                         # Extract column 1 using '-' delimiter(f1 means field/coloumn number)
    - `echo "A,B,C,D" | cut -d',' -f2 --complement`    # `--complement` to extract everything except the fields you specify.
        - **Output**: A,C,D
    - `echo "2026-07-03" | cut -c1-4`                  # Extract characters 1 through 10
        - **Output**: 2026 (Extracts the year)


```bash

    -d: Delimiter (the separator character). Must be a single character.
  
    -f: Field/Column number (starts at 1).

    -c: Character position.

    - (Hyphen): sSpecifies a range (e.g., 1-3 or 3-).

    , (Comma): Specifies a list (e.g., 1,4).

```
5. **`sort` — alphabetical, numerical, reverse, unique**
6. **`uniq` — deduplicate, count**
    - `sort names.txt`                         # Alphabetical sort
    - `sort -n numbers.txt`                    # Numerical sort
    - `sort -r file.txt`                       # Reverse sort
    - `sort file.txt | uniq`                   # Deduplicate adjacent matching lines
    - `sort file.txt | uniq -c`                # Deduplicate and count occurrences

7. **`tr` — translate/delete characters**
    - `echo "hello" | tr 'a-z' 'A-Z'`          # Convert to uppercase
    - `echo "devops123" | tr -d '0-9'`         # Delete all numeric characters

8. **`wc` — line/word/char count**

    - `wc -l app.log`                          # Count lines
    - `wc -w app.log`                          # Count words
    - `wc -m app.log`                          # Count only characters 

9. **`head` / `tail` — first/last N lines, follow mode**

    - `head -n 15 app.log`                     # Output first 15 lines
    - `tail -n 20 app.log`                     # Output last 20 lines
    - `tail -f app.log`                        # Stream log updates in real-time (follow mode)

---

### Task 6: Useful Patterns and One-Liners
Include at least 5 real-world one-liners you find useful. 

**Examples:**
    - **Find and delete files older than N days**
        - `find /path/to/logs -type f -mtime +30 -delete`   # Finds files in a specific path modified more than 30 days ago and deletes them.
    - **Count lines in all `.log` files**
        - `wc -l *.log`                                     # Count lines in all .log files
    - **Replace a string across multiple files**
        - `sed -i 's/localhost/124.0.0.1/g' *.conf`         # Uses sed to find the word "localhost" and replace it with "124.0.0.1" inside all .conf files, editing them in place (-i).
    - **Check if a service is running**
        - `systemctl is-active --quiet nginx && echo "Running" || echo "Stopped"`
        - `systemctl status nginx`
    - **Monitor disk usage with alerts**
        -  df -h / 
        - if [ "$(df -H / | awk 'NR==2 {print $5}' | cut -d% -f1)" -gt 90 ]; then echo "ALERT: Disk usage is high!"; else echo "Disk is fine."; fi
    - **Parse CSV or JSON from command line**
        - 
    - **Tail a log and filter for errors in real time**
        - `grep failure linux-logfile.log | tail -5`

---

### Task 7: Error Handling and Debugging

1. **Exit codes — `$?`, `exit 0`, `exit 1`**
    - Every command returns an exit status between 0 and 255. A 0 indicates success, while any non-zero value indicates an error.
        - `$?` : stores the exit code of the last executed command.
        - `exit 0` : A 0 indicates success.
        - `exit 1` : It immediately terminates the execution of a script and returns a general error status code of 1.

```bash

TARGET_FILE="/etc/nginx_config.conf"

cat "$TARGET_FILE" 2>/dev/null

STATUS=$?

if [ $STATUS -eq 0 ]; then
    echo "Success! File read successfully."
    exit 0
else
    echo "Error! Command failed with exit code: $STATUS"
    exit 1
fi

```
 
2. **`set -e` — exit on error**
    - It terminates the script if any command returns nonzero exit status.
```bash
set -e

echo "This command succeeds."
ls /nonexistent_directory_xyz
echo "This line will never execute."

```


3. **`set -u` — treat unset variables as error**
    - It forces the script to crash immediately when it encounters an unbound variable.
```bash
set -u

TARGET_DIR="/tmp/backup_folder"
echo "Cleaning up directory: $TARGET_DR" # Typo in variable name here. 

```
4. **`set -o pipefail` — catch errors in pipes**
    - It ensures the pipeline returns a failure if any command inside it fails.
```bash
# Without pipefail (Returns 0/Success because 'wc' succeeds)
cat missing_file.txt | wc -l
echo "Exit code without pipefail: $?" 

# With pipefail
set -o pipefail
cat missing_file.txt | wc -l
echo "Exit code with pipefail: $?" 

```
5. **`set -x` — debug mode (trace execution)**
    - This prints a step-by-step trace of commands and their expanded arguments to the terminal before running them. It acts as an interactive blueprint of execution.
```bash
#!/bin/bash

set -x
cat missing_file.txt | wc -l
echo "Exit code without pipefail: $?" 

set -o pipefail
cat missing_file.txt | wc -l
echo "Exit code with pipefail: $?" 

```
6. **Trap — `trap 'cleanup' EXIT`**
    - Traps allows us to intercept system signals and the EXIT state and we can define our own actions when a particular signal send to it.
    - It guarantees that a cleanup function runs before the script terminates, regardless of whether it succeeded, crashed, or was interrupted.

**EX-1**
```bash
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

```
**Ex-2:**
```bash
#!/bin/bash

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
```
---


