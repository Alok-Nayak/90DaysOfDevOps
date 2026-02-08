# Linux Command Cheet Sheet...

##  Process Management 

### View & inspect processes
- ` ps `    - Report a snapshot of the current process.
- ` ps aux ` - To see every process on the system.
- ` pgrep <service name> ` or ` pgrep -a <service name>.
- ` pidof <servicename>` -To know PID of a specific process or service.
- ` pstree -p ` - Display a tree of processes with PIDs (Process IDs).

- ` top `/` htop ` -Intractive process viwer.

- ` htop -u <user-name> ` - To see  processes of a specific user.

- `watch -n 1 ps aux`  - To run a command in every 1 sec interval, here checking the running process in every 1 sec interval.

### Kill / control processes

- ` kill PID'  - To kill a running process.
- ` kill -SIGSTOP PID`, `kill -SIGCONT PID`
- ` kill -9 PID` -Unconditional forceful termination signal.  The process is killed instantly, regardless of its state.
- ` pkill < service or process name >` -To target processes based on their name or other attributes using pattern matching.

### Process priorities

- ` nice -n <value between -20(highest priority) and 19(Lowest Priority)> <process or command>`  - Starts a new process with a specific priority. (can view the process with `htop`)
- ` renice <value> -p <PID>`  -Updates the priority of a running process.
Higher value = Higher politeness = Lower CPU priority.  (-20 means higest priority and 19 means lowest priority)

**Example:**
```
**Real-World Scenario**: The Log Compression Crisis
The Environment: A production server is running a high-traffic Java Application. Every night at 2:00 AM, a cron job runs a script to compress old logs (tar -czf) and move them to an S3 bucket.

**The Problem**: The tar command is extremely CPU-intensive because of the compression algorithm. While the script is running, the Java Application's response time (latency) spikes from 50ms to 2000ms, causing users to experience timeouts.

**Solution Phase 1**: Prevention (The nice command)
As a DevOps engineer, you realize the log compression doesn't need to finish in 5 minutes; it can take 20 minutes as long as the web app stays fast. You modify the cron job to be "nicer" to the Java app.

**Original Command**: tar -czf logs.tar.gz /var/log/app/*.log

**Improved Command**: nice -n 19 tar -czf logs.tar.gz /var/log/app/*.log

**The Result**: The Linux kernel sees that the web app has a priority of 0 and the compression task has a priority of 19. Whenever the web app needs CPU cycles, the kernel immediately pauses the tar command to serve the users first.
```
> Root privileges are required to set a negative (high priority) value to prevent regular users from crashing the system by hogging the CPU.

### Debugging running processes

- ` strace -p <PID> ` -Trace system calls and signals.Crucial when a process is "stuck" or "hanging"; it tells you if it's waiting for a network response, trying to read a missing file, or trapped in a loop.

- ` lsof -p <PID> `   -Shows every file, directory, and network socket that a specific process currently has open. Used to identify which configuration files a process is actually using or to see which log file it is writing to when you can't find the output.

## File System (Navigation, Disk, Permissions, Search, Cleanup)

- ` touch <file-name> ` - Creates a file.
- ` vi <file-name> `    - Creates a file and open it in vi editor to write.
- ' mkdir <directory name> ` -Creates a directory.

### Navigation & listing

- ` ls `      - List Files and Directories.
- ` ls -lh `  - List with long format and human-readable sizes.
- ` ls -ltr ` - List by time, in reverse order. Most recently modified files appear last.
- ` tree `    - List contents of directories in a tree-like format.
- ` pwd `     - Print name of current/working directory.
- ` cd `      - Change the shell working directory.

### File operations

- ` cp file1 file2 `    - Creates duplicate of *file1* and name it as *file2*.
- ` cp -r dir1 dir2 `   - Copy directories recursively. *dir1* directory and it's files to *dir2*.
- ` mv oldname newname `- Rename oldname with newname in same location. Or move a file from one location to other(providing path to new location).
- ` rm file `           - Remove file or directories.
- ` rm -rf dir `        - Forces the deletion of a directory and everything inside it without asking for confirmation.

### Disk usage & space

- ` df -h `    - Report file system disk space usage (human-readable).
- ` df -i `    - Shows how many files you can still create, regardless of how much GB you have left.
- ` du -sh * ` - Calculates the total size of every file and folder in the current directory.
- ` lsblk `    - Shows a tree-like view of all physical disks, partitions, and LVM volumes.
- ` mount `    - Shows which physical disks are attached to which folders and with what permissions (e.g., read-only vs read-write).
> The `mount` command is temporary. To make it survive a reboot, must add the device and mount point details to the /etc/fstab (File System Table) configuration file.

### Permissions & ownership
  *Linux File Permissions*

  | Read | Write | Execute |
  |------|-------|---------|
  |  4   |  2    |   1     |                                                                                                               

- Reed+Write+Execute = 7, So Read+Write = 6, Execute = 1
- `chmod <xxx> <file>`   - Changing permission of a file. (here *xxx* means: owner, group, other)
ex:` chmod 755  myfile`  - Sets permissions so the Owner has full access (rwx), while Group and Others can only read and execute (r-x).
-` chmod -R 644 <dir> `  - Recursively sets all files in a directory to be readable/writable by the Owner and read-only for everyone else.
- ` chown <user>:<group> <file> `  -Changes both the Owner and the Group assigned to a specific file.
- ` getfacl <file> `  -Displays the extended Access Control List (ACL) for a file.
- ` setfacl -m u:<user>:rwx <file> ` - Modifies the ACL to grant a specific user full permissions without changing the file's primary owner or group.
ex:` setfacl -m u:alok:rwx <myfile> `

### find
- ` find / -name <myfile>  `  -Searches the entire system (starting at /) for any file exactly named  *myfile*.
 ` find /etc -name "*.conf" ` 

- ` find </var/log> -size <+10M> ` -Find files based on the amount of disk space they use.
- ` find <directory> -type f <time_condition> ` - To search for regular files based on their last modification time.
``` 
    Modified within the last N days    - `find . -type f -mtime -1` (last 24 hours)
    Modified more than N days ago      - `find . -type f -mtime +7` (more than 7 days ago)
    Modified within the last N minutes - `find . -type f -mmin -60` (last 60 minutes)

    -n: Less than n days ago (i.e., within the last n days).
    +n: More than n days ago.
     n: Exactly n days ago.  
```

- ` grep <"word to be search"> <file> ` - Scans a specific file and prints every line that contains the word. ex:- ` grep "404" access.log `

- ` grep -R "Exception" /var/log `      - Searches for the word "Exception" inside every single file within /var/log and its subfolders.
  ` grep -Ri "failed" /etc/ `           - `-i` Makes it case sensitive.


### File Inspection

- ` cat <file> `              - Shows a files content on screen.
- ` less <file> `             - Opens a file in an interactive view, allowing you to scroll through large logs without loading the whole file into memory.(allows you to search (using /) while viewing.).
- ` head -n <10> <file> `     - Shows first 10 lines of a file.
- ` tail -n <5> <file>  `     - Output the last 5 lines of a file.
- ` tail -f /var/log/syslog ` - Keeps the file open and prints new lines to the screen in real-time as they are written.


### Archives & compression

- ` tar -cvf <backup.tar> </etc/nginx> `-Bundles a whole folder into a single file without compressing it yet.
- ` tar -xvf <file.tar> `               -Unpacks a .tar bundle back into its original files and folders.
- ` tar -cvzf <file.tar.gz> <dir> `     -Create a *gzip* file.  Bundles a directory and compresses it to save disk space.
- ` tar -xvzf <file.tar.gz> `           -Extract a gzipped archive.
- ` gzip <file> `                       -Compresses a single file and replaces it with a `.gz` version.(**Note:** It deletes the original file and leaves only the compressed one.).
- ` gunzip <file.gz> `                  -Restores a `.gz` file back to its original uncompressed state.

### Inodes & links

- ` ls -i `  - Print the index number of each file.Use this to verify if two filenames are actually pointing to the exact same data on the disk.
- ` stat <filename> `        -It shows you exactly when a file was last modified or when its permissions were changed. 
- ` ln <file> <hardlink> `   -Creates a hardlinks between files. Even if you delete the original file, the data remains as long as the hard link exists.
- ` ln -s <file> <symlink> ` -Make symbolic links.

## Networking Troubleshooting

### Network info
- ` ip a `/` ip addr `    -Lists all network interfaces and their assigned IP addresses.
- ` ip link `             -Shows the physical state of network interfaces.
- ` ip route `            -Routing table management. Displays the "map" the server uses to decide where to send network packets.
- ` hostname `            -Prints the DNS/system name of the machine.
- ` hostname -I `         -Display the network address of the host. 
- ` nmcli device status ` -Provides a high-level status of all network devices managed by the NetworkManager service.

### Connectivity checks
- ` ping google.com `       -Send ICMP ECHO_REQUEST to network hosts.
- ` ping -c 4 google.com `  -Sends exactly four pings and then stops, providing a summary of the results.
- ` traceroute google.com ` -Lists every hop packet passes through to reach the destination.
- ` tracepath google.com `  -Traces path to destination discovering MTU along this path.
- ` mtr google.com `        -Combines ping and traceroute into a live, continuously updating dashboard.

### DNS troubleshooting
- ` nslookup google.com `   -Query Internet name servers interactively.
- ` dig google.com `/` dig +short google.com ` -DNS lookup utility.
- ` dig google.com <MX> `   -Query specific DNS record types. (MX -Mail Exchange, A -ipv4, AAAA - ipv6, NS - Name Server)
- ` cat /etc/resolv.conf`   -The local configuration file that tells Linux which DNS servers (like 8.8.8.8 or 1.1.1.1) to ask when looking up a domain.

### Ports & sockets
- ` ss -lntup `      -Display summary statistics for TCP, UDP, and raw sockets.
- ` netstat -tulnp ` -Print network connections, routing tables, and interface statistics.

- ` ss -tunap `      -Display all established and non-listening sockets.
- ` lsof -i :80 `    -Lists the process currently "owning" port 80.
- ` lsof -iTCP -sTCP:LISTEN ` -List only files in the TCP LISTEN state.

### HTTP & API's
- ` curl https://google.com  `     -Fetches the body of the webpage or API response and prints it to the terminal.
- ` curl -I https://google.com `   -Fetch the HTTP-header only.
- ` curl -v https://example.com `  -Shows the entire communication "handshake," including DNS resolution, SSL certificate exchange, and the full request/response headers.
- ` wget https://example.com `     - Download files from internet.

### Firewall

- ` iptables -L -n ` -Lists all active firewall rules.
- ` iptables -S `    -Print the rules in the selected chain as iptables commands.
- ` firewall-cmd --list-all ` -Provides a high-level summary of the firewalld configuration, including active zones, allowed services, and open ports.
- ` firewall-cmd --list-ports ` -List ports added for a zone.

### Packet Capture

- ` tcpdump -i any `          -Captures traffic on all active interfaces.
- ` tcpdump -i eth0 port 80 ` -Filter packets based on a specific port number.
- `tcpdump -nn -i eth0`       - Don't convert addresses (host addresses, port numbers, etc.) to names.
``` 
-c 10: Capture only 10 packets and then stop.
-w file.pcap: Write the packets to a file so you can open them in Wireshark later.
```

### Remote access
- ` ssh user@host `              -Connects you to a remote server's terminal over a secure, encrypted channel.
- ` ssh -i key.pem user@host `   -Connects to a server using a specific private key file instead of a password.
- ` scp file user@host:/path `   -Copies a file from your local machine to a remote server (or vice-versa) using the SSH protocol.
- ` rsync -avz dir user@host:/path `     -Synchronizes directories between locations. It is "smart" because it only sends the parts of files that have changed.


#### SSH Client Configuration
```
1. Create or open the config file "vi ~/.ssh/config".
2. Add the HOST entry like this:
   
 Host prod
    HostName 1.2.3.4
    User ubuntu
    IdentityFile ~/.ssh/my-prod-key.pem
    Port 22

3. Set Correct Permission "chmod 600 ~/.ssh/config".
4. Use the shortcut "ssh prod"

```                                                                                                                                                            
