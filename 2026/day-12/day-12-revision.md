# Day 12 – Revision (Days 01–11)

## Quick Review
### Processes & Services
Checked running processes and services again.
Commands used:
- `ps aux`
- `systemctl status docker`
- `journalctl -u docker`

Observed what a service is doing from service logs.

### File Operations Practice

Practiced some file operations again:

- `echo "revision practice" >> notes.txt`
- `ls -l`
- `chmod 640 notes.txt`
- `cp notes.txt backup-notes.txt`
- `mkdir test-folder`

### Ownership & Permissions

Revisited ownership concepts from Day 11.
Commands used:

- `sudo chown tokyo notes.txt`
- `sudo chgrp developers notes.txt`
- `ls -l notes.txt`

Verified ownership changes using ls -lr.

## Mini Self-Check

Q. Which 3 commands save you the most time right now?

- `ls -l` → Check permissions and ownership.  
- `systemctl status service` → Useful to know if a service in which state.
- `ps aux` → Helps see running processes.

Q.  How do you check if a service is healthy?

`systemctl status <service>`  - Verify status of service  
`journalctl -u <service>`     - To check logs  
`ps aux | grep <service>`     - To see running process  

Q. How do you safely change ownership and permissions?

- `sudo chown <user>:<group> <filename>` - Will use this to change owner and group of a file.
- `chmod 640 <filename>`    - Simply changing permission of a file.
- `ls -l <filename>`    - To verify the permissions, owner, group.


### Focus for the next 3 days

- Become good with Linux commands and system.
- Improve troubleshooting approach.
- Practice shell scripting.
- Practice github actions.

## Key Takeaway
Taking time to revise helped remember the fundamentals.
Commands  like `ls`, `chmod`, `chown`, and `journalctl` are simple, but they are very useful when managing Linux systems.

