#  Linux File System Hierarchy & Scenario-Based Practice.

## part-1 : Linux File System Hierarchy

> In linux everything represented as file including hardware program. The files are stored in a directory and every directory contains a file with a tree structure and this is called file system hierarchy.

### Core Directories (Must Know):
- **/ (root)** - The starting point of entire linux file system. From here all other filesystems are mounted at system boot up.
    - It's owned by the root user (admin), and only admin can add, remove or modify files in this directory.
    - `/root` is the root user’s home directory, which is not the same as `/`.  

        - **I would use this when...**
            - I would use `/` when i need to understand the overall filesystem layout or locate major system directories.
    
    - ![root_dir](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fdb1cacdd75a6003dc1f84869ec2fc0ae637e538/2026/day-07/day-07-snapshots/root-dir.png)  

- **/home** - User home directories.
    - Every non-root user has personal directories inside `/home`.
    - Each user can create, delete, or modify files only in their own home directory and cannot access others’ home directories.
    - Under `/home` there are two directories: `/home/alok-nayak`, which contains all my files.  

        - **I would use this when...**  
            - Masnaging user data, checking permissions, or troubleshoot user specific issues.
    
    - ![hom-dir](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fdb1cacdd75a6003dc1f84869ec2fc0ae637e538/2026/day-07/day-07-snapshots/home-dir.png)  

- **/root** - Root user's home directory.  
    - It is separate from the top-level root directory (/) of the entire filesystem and typically contains configuration files and other data specific to the administrative user. 
    - It contains hidden files (prefixed with a dot, e.g., .bashrc, .vimrc) that store the root user's shell preferences, aliases, and specific application settings.
    - Can store scripts or documents created by the admin for system maintenance, backup, or recovery purposes.  

        - **I would use this when...***
            -Performing administrative tasks or reviewing root-specific configuration files.  

    - ![root-home-dir](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fdb1cacdd75a6003dc1f84869ec2fc0ae637e538/2026/day-07/day-07-snapshots/admin-root-dir.png)

- **/etc** - Configuration files.
    - It contains most, if not all system-wide configuration files.
    - Configuration files for system applications, users, services, and tools.
    - Also contains startup and shutdown shell scripts used to start/stop individual programs.
    - Files that contain the name of your system, the users and their passwords, the names of machines on your network and when and where the partitions on your hard disks should be mounted are all in here. 

        - **I would use this when...**  
            - I would use `/etc` when modifying or troubleshooting service configurations like SSH, cron, nginx, or networking.
    - ![etc-dir](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fdb1cacdd75a6003dc1f84869ec2fc0ae637e538/2026/day-07/day-07-snapshots/etc_dir.png)

- **/var/log** - Log files (very important for DevOps!)
    - `/var` contains things like logs in the `/var/log` subdirectories.
    - Logs are files that register events that happen on the system. If something fails in the kernel, it will be logged in a file in `/var/log`.
    - It also contains spools (***Simultaneous Peripheral Operations On-Line***) for tasks.  

        - **I would use this when...**  
            -Investigating production issues, checking logs for errors, analyzing disk space usage, or troubleshooting application state problems.  

    - ![var](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fdb1cacdd75a6003dc1f84869ec2fc0ae637e538/2026/day-07/day-07-snapshots/var.png)  

- **/tmp** - Temporary files.
    - Contains temporary files, usually placed there by applications that are running or by users.  
    - Files are deleted automatically after the program finishes or when the system is restarted.

        - **I would use this when..**
            - Testing scripts, storing temporary deployment artifacts, or diagnosing application failures caused by permission or disk space issues.
    - ![temp](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fdb1cacdd75a6003dc1f84869ec2fc0ae637e538/2026/day-07/day-07-snapshots/tmp.png)

## Additional Directories (Good To Know)

- **/bin** - Essential command binaries.
    - The `/bin` directory contains essential commands and binaries needed by all users, including  ps, ls, ping, grep, cp, ssh, and kill. These commands are universally available across user types.
    - Contains binary executables.
    - Common linux commands used in single-user modes are located under this directory.  
    
         - **I would use this when...**
            - Verifying core system binaries exist, troubleshooting boot failures, or diagnosing PATH-related command issues.
    - ![bin](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/01b5e48330862cf3df377d2910923eca22d0c0ec/2026/day-07/day-07-snapshots/bin.png)

- **/sbin** - - User command binaries.
    - `/sbin` is similar to `/bin`, but it contains applications that only the superuser will need.
    - This directory holds administrative binaries like iptables, firewall management tools, fsck, init, route etc. 
    - These binaries are primarily for system administrators and typically require root privileges to execute.  

- **/usr/bin**
    - It contains most of the user-level executable binaries installed by the system package manager (apt, yum, dnf, etc.).  
       
         - **I would use this when...**  
            - Verifying whether a required tool is installed.
            - Checking which binary version is being executed.
            - Troubleshooting PATH misconfigurations.

    - ![/usr/bin](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c0fe76bba518c4fc645c6daf4b3bc38374ba48de/2026/day-07/day-07-snapshots/usr-bin.png)  

- **/opt** -Optional/third-party applications.  
    - /opt is used for optional or third-party software installations.
    - It includes their configuration and data files.
    - Contains add-on applications from individual vendors.
    - Add-on applications should be installed under either /opt/ or /opt/ sub-directory.  

        - **I would use this when...**  
            - Deploying custom applications, managing third-party software, or troubleshooting manually installed enterprise tools.

    - ![/opt](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c0fe76bba518c4fc645c6daf4b3bc38374ba48de/2026/day-07/day-07-snapshots/opt.png)  

## Part 2: Scenario-Based Practice

### Scenario 1: Service Not Starting

```
A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order
```  
**My Solution:**
- **Step 1:** Check service status
```bash
systemctl status myapp
```
**why?**: To chek if myapp service has been active, stopped or failed.

- **Step 2:**  What do the logs say?
```bash
journalctl -u myapp -n 50
```
- **Why ?** : To check if any error happend.

- **Step 3:** Is it enabled to start on boot?
```bash
systemctl is-enabled myapp
```
- **Why?** : To know if it will start automatically after reboot.

**What I learned:** Always check status first, then investigate based on what you see.

### Scenario 2: High CPU Usage

```
Your manager reports that the application server is slow.
You SSH into the server. What commands would you run to identify
which process is using high CPU?
```

**My Solution:**
- **Step 1:** Check the cpu load over the last 1, 5, and 15 minutes.
```bash
uptime
```
**why?**: If the load average is more than the cpu core then i will check which process is taking that cpu.

- **Step 2:** Check CPU core
```bash
nproc
```
- **Why ?** : To compare the load average.

- **Step 3:** Check which process causing the cpu spike
```bash
htop
```
```
ps aux --sort=-%cpu | head -10
```
- **Why?** : To know which process is taking the cpu.

- **Step 4:** Check if the server out of RAM (si/so > 0), disk-bound (wa is high), or CPU-maxed (id is 0).  
```bash
vmstat 1 10
```
- **Why?** : 

- **Step 4:** Check Disk.  if %util is near 100% and await is high disk is the bottleneck, even if the CPU is idle.
```bash
iostat -xz 1 3 sda
```
- **Why?** : To know if %util is near 100% and await is high disk is the bottleneck, even if the CPU is idle.

**What I learned :** If the server slow then check the cpu,disk performance, I/O, network, application log and then dignose accordingly.

### Scenario 3 : Finding Service Logs
```
A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?
```
**My Solution:**
- **Step 1:** Check the service status.
```bash
systemctl status docker
```
**why?**: To check the docker status

- **Step 2:** Check logs 
```bash
journalctl -u docker
```
- **Why ?** : To see all logs.

- **Step 3:**  To see latest logs.
```bash
journalctl -u docker -n 50
```
```
jpurnalctl -u  docker -f 
```
- **Why?** : Checking latest 50 logs and live logs.

- **Step 4:** Check logs of specific time range.
```bash
journalctl -u docker --since "1 hour ago"
```

- **Step 4:** Chek only error or warning in logs.
```bash
journalctl -u docker -p err
```
```
journalctl -u docker -p warning
```
- **Why?** : So we can directly spot the issue.

**What I learned :** If theservice is managed by systemd we can see logs using journalctl.


### Scenario 4: File Permissions Issue
```
A script at /home/user/backup.sh is not executing.
When you run it: ./backup.sh
You get: "Permission denied"
What commands would you use to fix this?
```

**My Solution:**
- **Step 1:** Check the file pwermission.
```bash
ls -l /home/user/backup.sh

Look for: -rw-r--r-- (notice no 'x' = not executable)
```
**why?**: If there is no execute permission for user then that's the issue.

- **Step 2:** Add execute permission
```bash
chmod +x /home/user/backup.sh

or, 

chmod  731 /home/user/backup.sh
```
- **Why ?** : Giving execute permisssion to all.

- **Step 3:**  Verify it worked.
```bash
ls -l /home/user/backup.sh
```
```
Look for: -rwxr-xr-x (notice 'x' = executable)
```
- **Why?** : Checking the perissions.

- **Step 4:** Try running it.
```bash
./backup.sh
```



