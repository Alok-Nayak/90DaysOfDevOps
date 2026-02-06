# Linux Command Cheet Sheet...

##  Process Management 

- ` ps `    - Report a snapshot of the current process.

- ` ps aux ` - To see every process on the system.
- ` pgrep <service name> `
- ` pidof <servicename>` -To know PID of a specific process or service.
- ` pstree -p ` - Display a tree of processes with PIDs (Process IDs).

- ` top `/` htop ` -Intractive process viwer.

- ` htop -u <user-name> ` - To see  processes of a specific user.

- `watch -n 1 ps aux`  - To run a command in every 1 sec interval, here checking the running process in every 1 sec interval.

- ` kill PID'  - To kill a running process.
- ` kill -SIGSTOP PID`, `kill -SIGCONT PID`
- ` kill -9 PID` -Unconditional forceful termination signal.  The process is killed instantly, regardless of its state.

- ` pkill < service or process name >` -To target processes based on their name or other attributes using pattern matching.

- ` nice -n <value between -20(highest priority) and 19(Lowest Priority)> <command or process>`  - Starts a new process with a specific priority.
- ` renice <value> -p <PID>`  -Updates the priority of a running process.
Higher value = Higher politeness = Lower CPU priority.  (-20 means higest priority and 19 means lowest priority)
> Root privileges are required to set a negative (high priority) value to prevent regular users from crashing the system by hogging the CPU.


- ` strace -p <PID> ` -Trace system calls and signals.Crucial when a process is "stuck" or "hanging"; it tells you if it's waiting for a network response, trying to read a missing file, or trapped in a loop.

- ` lsof -p <PID> `   -Shows every file, directory, and network socket that a specific process currently has open. Used to identify which configuration files a process is actually using or to see which log file it is writing to when you can't find the output.

## File System (Navigation, Disk, Permissions, Search, Cleanup)

- ` touch <file-name> ` - Creates a file.
- ` vi <file-name> `    - Creates a file and open it in vi editor to write.
- ' mkdir <directory name> ` -Creates a directory.


- ` ls `      - List Files and Directories.
- ` ls -lh `  - List with long format and human-readable sizes.
- ` ls -ltr ` - List by time, in reverse order. Most recently modified files appear last.
- ` tree `    - List contents of directories in a tree-like format.
- ` pwd `     - Print name of current/working directory.
- ` cd `      - Change the shell working directory.

- ` cp file1 file2 `    - Creates duplicate of *file1* and name it as *file2*.
- ` cp -r dir1 dir2 `   - Copy directories recursively. *dir1* directory and it's files to *dir2*.
- ` mv oldname newname `- Rename oldname with newname in same location. Or move a file from one location to other(providing path to new location).
- ` rm file `           - Remove file or directories.
- ` rm -rf dir `        - Forces the deletion of a directory and everything inside it without asking for confirmation.


- ` df -h `    - Report file system disk space usage (human-readable).
- ` df -i `    - Shows how many files you can still create, regardless of how much GB you have left.
- ` du -sh * ` - Calculates the total size of every file and folder in the current directory.
- ` lsblk `    - Shows a tree-like view of all physical disks, partitions, and LVM volumes.
- ` mount `    - Shows which physical disks are attached to which folders and with what permissions (e.g., read-only vs read-write).
> The `mount` command is temporary. To make it survive a reboot, must add the device and mount point details to the /etc/fstab (File System Table) configuration file.

                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
