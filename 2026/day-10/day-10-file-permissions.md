# Day 10 Challenge

## Files Created

### Task 1: Create Files.
1. Create empty file devops.txt using touch
2.  Create notes.txt with some content using cat or echo
3.  Create script.sh using vim with content: echo "Hello DevOps"
4. Verify: ls -l to see permissions

![task-1]()  

### Task 2: Read Files.
1. Read notes.txt using cat
2. View script.sh in vim read-only mode
3. Display first 5 lines of /etc/passwd using head
4. Display last 5 lines of /etc/passwd using tail

![task-2]()  
![task-2-readonly script]()  

### Task 3: Understand Permissions (10 minutes)
**File Permission**
```bash
Format: rwxrwxrwx (owner-group-others)

r = read (4), w = write (2), x = execute (1)

```

> Q.  Check your files: ls -l devops.txt notes.txt script.sh
> What are current permissions? Who can read/write/execute?

![task-3 permissions]()  


## Permission Changes
### Task 4: Modify Permissions
1. Make script.sh executable → run it with ./script.sh
2. Set devops.txt to read-only (remove write for all)
3. Set notes.txt to 640 (owner: rw, group: r, others: none)
4. Create directory project/ with permissions 755
5. Verify: ls -l after each change

![task-4 modif permission]()  

### Task 5: Test Permissions
1. Try writing to a read-only file - what happens?
- Ans: Permission denied to write. 
2. Try executing a file without execute permission
3. Document the error messages
- bash: ./script.sh: Permission denied

![task-5 test permission]()  

## Commands Used
- ` cat notes.txt `
- ` vim -R script.sh `
- ` head -5 /etc/passwd `
- ` tail -5 /etc/passwd `
- ` chmod 777 script.sh `
- ` mkdir -m 755 project `
- ` echo "Helloooooo!" > devops.txt `
- ` history | tail -20 `

## What I Learned
-  File permissions (r, w, x) control what you can do to the content of a file, but the parent directory permissions control whether you can rename, delete, or replace the file itself.
-  You can execute any script's logic as long as you have Read ('r') permission by calling the interpreter directly (ex: bash script.sh), because the interpreter reads the file as text and carries out the commands.  
 The Execute ('x') bit is only required if you want to run the file directly as a standalone program (ex: ./script.sh).  
