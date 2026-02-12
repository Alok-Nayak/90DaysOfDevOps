# Linux Troubleshooting Runbook

## Environment Basics
- ` uname -a ` -Displaying the operating system name.
- ` unmae -r ` -Only shows the kernel version.
- ` cat /etc/os-release ` -To see linux OS info.
- ` hostnamectl `  -Shows the OS, Kernel, and Architecture in one view.
> These commands helps to check about the OS info and during incidents we can Know the distribution and kernel version and this tells me which set of commands and configuration paths I need to use.

![os info](   )

## Filesystem sanity

- ` mkdir /tmp/runbook-demo ` - Created runbook-demo directory under /tmp.
- ` cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo `  -Copying /etc/hosts file data to /tmp/runbook-demo/hosts-copy file and then cheking the permission through ls -l.

> Able to create and write files under ` /tmp `.

![filesystem](   )

## Service state

- `systemctl status cron`   -Checking the status of corn service.
- `systemctl is-enabled cron` -Checking if it's eneable to start on boot or after reboot.
- `systemctl list-units | grep cron` -Cheking if it's loaded and in an active running state or not.

**bservations**
    - `cron` service is active and running.
    - Main PID observed and service is managed by systemd

**If this worsens**
   - Attempt controlled restart: `systemctl restart cron`.
   - Check for repeated failures in systemd status.
   - Move immediately to logs for root cause.
![systemctl](  )

## CPU & Memory Snapshot

- ` ps -C cron -o pid,ppid,pcpu,pmem,etime,cmd ` -`ps`shows snapshot of current process. Here `-C` means by name and ` -o` shows only the thing's we mention like pid, pcpu, pmem etc..
- ` top/htop ` -An interactive process viewer for Unix systems. 
- ` free -h `  - It shows the systemwide free space avilable.
- ` uptime `   -Tell how long the system has been running, how many users are currently logged on, and the system load averages for the past 1, 5, and 15 minutes.

- **Observations**
    - Cron process consuming negligible CPU and memory.
    - System load average is within acceptable limits.
    - Sufficient free and available memory.

- **If this worsens**
    - Identify CPU or memory spikes via `top` or `htop`.
    - Check for memory leaks or runaway processes.
    - Consider restarting or isolating the service.

![cpu & Memory](  )

## Disk & IO
 
- ` df -h ` -Shows total space is available on mounted partitions and disks.\
- ` du -sh /var/log ` -Checking how much space taken by the log file.
- ` vmstat 1 5 ` -Generate 5 reports in 1 sec. gap on information about processes, memory, paging, block IO, traps, disks and cpu activity.
- ` iostat -xz 1 3 sda ` -Report extended I/O statistics for the `sda` device, updated every (1)second for (3)three iterations, omitting idle devices.
```
*vmstat*:
    - `r` (Run Queue): Number of tasks waiting for CPU; if r > CPU cores, then it's CPU bottleneck.
    - `si/so` (Swap-In/Out): Data moving to/from disk; must be 0 or the system is slow due to low RAM.
    - `wa`(I/O Wait): CPU idle time spent waiting for disk; high wa means a slow disk is the bottleneck.
    - `st`(Steal Time): CPU time taken by the hypervisor; if > 0, Cloud Host is over-provisioned.
*isostat*:
    - ` %util `: How close the disk is to its maximum capacity.
    - ` await `(r_await/w_await): Average time for a request to be served.
    - ` %iowait` (CPU Metric): Percentage of time the CPU is sitting idle because it's waiting for the disk to finish a task.
```
- **Observations**
    -  Disk usage within safe thresholds.
    - `/var/log` consuming 614M  space.
    -  No abnormal disk latency or high `%util`.

- **If this worsens**
    - Clean up or rotate logs.
    - Identify high IO processes.
    - Consider disk expansion or performance tuning.

![Disk & IO](  )

## Network

- `ss -tulpn` -Shows which services are "listening" for connections and on which ports.
- `sudo lsof -i :80 ` -This is used to find the "Owner" of a port and to see which executable is running on a port(ex: port 80).
- `ip addr`   - Shows addresses assigned to all network interfaces.
- `ip -br -c addr `  -Display IP addresses in a brief format with color coding.
- `ip route ` - Show table routes.
- `ping -c 3 8.8.8.8`  -Tests basic "reachability" to a specific IP address.(Here to network hosts. `-c 3` limits it to 3 packets.
- `nc -vz google.com 80 ` -Arbitrary TCP and UDP connections and listens. The -v flag enables verbosity (tells you what's happening), and the -z flag specifies zero-I/O mode (scan only, don't send data).

- **Observations**
    - Network interfaces are up.
    - Routing and connectivity working as expected.
    - No unusual listening ports affecting the service.

- **If this worsens**
    - Check firewall rules.
    - Restart network services if safe.
    - Validate DNS and routing configuration.

![Network](  )

## Logs Reviewe

- `journalctl -u cron -n 10` -Query the systemd journal; -u (unit) filters by service, -n (lines) limits the output.
- `journalctl -u cron --since "1 hour ago" ` -Filters journal entries based on a time window using the --since flag. 
- `journalctl -u cron --since "2026-02-11 14:00:00" ` -Filters journal entries based on a time window using the --since flag.
- `journalctl -p err -n 50 `  -Filter output by message priorities or priority ranges. (*syslog: "emerg" (0), "alert" (1), "crit" (2), "err" (3), "warning" (4), "notice" (5), "info" (6),"debug" (7)*).
- `grep CRON /var/log/syslog | tail -n 10 ` -Searches for the string "CRON" in the traditional system log file and pipes it to tail for the last 10 entries.
- `journalctl -u cron -f `-Output the most recent entries and continue to print new entries as they are appended to the journal. 

- **Observations**
    - No critical errors in recent cron logs.
    - No repeated failures or permission issues detected.
![Logs](  )

## Quick Findings
- System health is stable.
- Cron service is running normally.
- No CPU, memory, disk, or log anomalies detected.

## Resources
- Man page, Google, Gemini, ChatGPT

