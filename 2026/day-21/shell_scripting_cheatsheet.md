# Shell Scripting Cheat Sheet: Build Your Own Reference Guide

### Task 1: Basics

1. Shebang (`#!/bin/bash`) — what it does and why it matters

- It tells the linux kernel which interpreter to use.

2. Running a script — `chmod +x`, `./script.sh`, `bash script.sh`

- `chmod +x` - Giving executable permission to a file/script.
- `./script.sh` - Executing a script via path with executable permission.
- `bash script.sh` - Executing a script without executaion permission(+x).
 
3. Comments — single line (`#`) and inline
- Used to document scripts. Single-line comments start with #.
- # This is a dedicated single-line comment
- echo "Hello World" # This is an inline comment

4. Variables — declaring, using, and quoting (`$VAR`, `"$VAR"`, `'$VAR'`)

- No spaces around the = sign during variable assignment. 
- Always double-quote variables when expanding to prevent word splitting and globbing.

```bash
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

1. String comparisons — `=`, `!=`, `-z`, `-n`

- [ "$A" = "$B" ]   # True if A & B  strings are equal
- [ "$A" != "$B" ]  # True if strings are not equal
- [ -z "$A" ]       # True if string is empty/null
- [ -n "$A" ]       # True if string is not empty

2. Integer comparisons — `-eq`, `-ne`, `-lt`, `-gt`, `-le`, `-ge`

- [ "$X" -eq "$Y" ] # X equal to Y
- [ "$X" -ne "$Y" ] # X not equal to Y
- [ "$X" -lt "$Y" ] # X less than Y
- [ "$X" -gt "$Y" ] # X greater than Y
- [ "$X" -le "$Y" ] # X less than or equal to Y
- [ "$X" -ge "$Y" ] # X greater than or equal to Y

3. File test operators — `-f`, `-d`, `-e`, `-r`, `-w`, `-x`, `-s`

- `[ -f "$FILE" ]`    # True if regular file exists
- `[ -d "$DIR"  ]`    # True if directory exists
- `[ -e "$PATH" ]`    # True if path exists (file, dir, link, etc.)
- `[ -r "$FILE" ]`    # True if readable
- `[ -w "$FILE" ]`    # True if writable
- `[ -x "$FILE" ]`    # True if executable
- `[ -s "$FILE" ]`    # True if file exists and has size greater than 0

4. `if`, `elif`, else` syntax

```bash

if [ "$A" -gt "$B" ]; then
        echo "$A is bigger.."
elif [ "$A" -lt "$B" ]; then
        echo "$A is smaller.."
else
        echo "Both are same"
fi

``` 

5. Logical operators — `&&`, `||`, `!`

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

6. Case statements — `case ... esac`

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

1. `for` loop — list-based and C-style

-  **List-based loop

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

2. `while` loop

 - Runs as long as the condition evaluates to true.

```bash

COUNT=1
while [ $COUNT -le 3 ]; do
    echo "Count: $COUNT"
    ((COUNT++))
done

```
3. `until` loop
 - Runs as long as the condition evaluates to false (stops when true).
```bash
COUNT=1
until [ $COUNT -gt 3 ]; do
    echo "Count: $COUNT"
    ((COUNT++))
done
```
4. Loop control — `break`, `continue`
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

5. Looping over files — `for file in *.log`

- Here this checks cur rent directory and chek for any file end with `.log` and print the name.

```bash

for LOG in *.log; do
    [ -f "$LOG" ] || continue # Handle empty matches gracefully
    echo "Processing $LOG"
done

```
6. Looping over command output — `while read line`

```bash

df -h | while read -r LINE; do
    echo "Disk line: $LINE"
done

```
---

### Task 4: Functions

1. Defining a function — `function_name() { ... }`

```bash

name=${1:- "<Your Name>"}

myfunction(){
        echo "Hello, Have a Great Time $name"
}

myfunction
```

2. Calling a function
3. Passing arguments to functions — `$1`, `$2` inside functions
4. Return values — `return` vs `echo`
5. Local variables — `local`

