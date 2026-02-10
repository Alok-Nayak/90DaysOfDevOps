# Linux Practice

## Process Checks
### cheking Docker process
- `pgrep -a docker `

- ` ps aux | grep docker `   
    - This shows, Docker process is runing.
    - Shows CPU, memory usage, PID

- ` systemctl status docker ` - Checking status of docker

- ` systemctl is-enabled docker ` -Checking if the service is enabled so it can rstart automatically after reboot.

![pgrep](  https://github.com/Alok-Nayak/90DaysOfDevOps/blob/828ce5ae33c479d58bf5aa9c0e7132cc57c9f0b7/2026/day-04/day-04-images/pgrep-systemctl%20status.png)

- ` htop ` then filtering with ` "/" ` or by pressing ` <F4> ` ` docker `. From this we can see...
   - Daemon health
   - Container hierarchy
   - Resource abuse

- ` systemctl list-units ` - Shows units that are currently loaded into memory. (Running services, Failed services, Active sockets, mounts, timers, Things systemd is actively managing right now)
- ` systemctl list-unit-files ` -Shows what exists on disk. (*Enable*-What wiLL start automatically after reboot, *Static* - Cannot be enabled manually & Start automatically when required by dependencies)

![list-units]( https://github.com/Alok-Nayak/90DaysOfDevOps/blob/828ce5ae33c479d58bf5aa9c0e7132cc57c9f0b7/2026/day-04/day-04-images/systemctl%20list-units.png)


![htop](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/828ce5ae33c479d58bf5aa9c0e7132cc57c9f0b7/2026/day-04/day-04-images/htop.png )

**Troubleshoot**

- Initially I have runned NGINX on my local machine, then when i tried to run a NGINX docker container it didn't run/start to find out the issue i runned  ` journalctl -u docker | tail -10 ` so this command gave me last 10 log output of docker and there i got to know that my machines **port 80** was already in used and to know which service is using that when i run ` sudo ss -lntp | grep :80 ` found out NGINX running in my local has using it. Then I changed the hostport to **8080** and renamed the conatiner and run and it started.

- ` journalctl -u docker -f ` -To check live logs of a service, here docker.
- ` journalctl -u docker -n 10 ` - To check last 10 logs immideatly.
![journalctl] (https://github.com/Alok-Nayak/90DaysOfDevOps/blob/828ce5ae33c479d58bf5aa9c0e7132cc57c9f0b7/2026/day-04/day-04-images/journalctl%20-u%20docker%2C%20ss%20-lntp.png)

![8080](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/828ce5ae33c479d58bf5aa9c0e7132cc57c9f0b7/2026/day-04/day-04-images/port8080.png)
![80](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/828ce5ae33c479d58bf5aa9c0e7132cc57c9f0b7/2026/day-04/day-04-images/port80.png)

- 
