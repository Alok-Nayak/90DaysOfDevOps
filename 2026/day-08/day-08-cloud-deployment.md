# Cloud Server Setup: Docker, Nginx & Web Deployment

## Part 1: Launch Cloud Instance & SSH Access

### Steps to lunch EC2 instance.

#### [1] Create key-pair

![key-pair-1](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-keyPair-1.png)  
![key-pair-2](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-keyPair-2.png)    
![key-pair-3](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-keyPair-3.png)    
![key-pair-4](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-keyPair-4.png)   

#### [2] Create Security Group
- This helps to connect to ec2 instance by opening required port.
- Here we need port: 22 for SSH and port: 8080 for nginx

![sg-1](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-security-group-1.png)  
![sg-2](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-security-group-2.png)    
![sg-3](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-security-group-3.png)  
![sg-4](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-security-group-4.png)  


#### [3] Lunching EC2 instance

![ec2-lunch-1](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-1.png)    
![ec2-lunch-2](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-2.png)    
![ec2-lunch-3](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-3.png)    
![ec2-lunch-4](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-4.png)    
![ec2-lunch-5](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-5.png)   
![ec2-lunch-6](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-6.png)    


#### Step 2: Connect via SSH  

![ec2-connect](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-7.png)  
![ssh-1](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-lunch-8.png)    
![ssh-2](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-ssh-1.png)    

## Part 2: Install Docker & Nginx 

 - Step 1: Update System  
![system update](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-ec2-apt-update.png)    

- Step 2: Install Nginx
![Install nginx](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-nginx-installation.png)    


![Install Docker](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-docker-installation.png)  
![Install Docker](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-docker-installation2.png)   
 
- Verify Nginx & Docker is running  
![nginx & docker status](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-nginx-docker-status.png)    

## Part 3: Security Group Configuration
![sg http](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-security-group-allow-http.png)  

- Test Web Access: Open browser and visit: http://<your-instance-ip>
- You should see the Nginx welcome page!

![welcome nginx](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-welcome-to-nginx.png)    

##  Part 4: Extract Nginx Logs

- **Step 1:** View Nginx Logs
![nginx logs find](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/c8a876b4d2259cf42a3ec19ee5a33d46b654c2f2/2026/day-08/day-08-screenshots/day-08-nginx-logs.png)  
- **Step 2:** Save Logs to File
![nginx logs save](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/8c19f0ad5e656d2baaeda10f9fb3390f356a34ea/2026/day-08/day-08-screenshots/day-08-nginx-log-save-to-file.png)    
- **Step 3:**  Download Log File to Your Local Machine
![nginx log download](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/8c19f0ad5e656d2baaeda10f9fb3390f356a34ea/2026/day-08/day-08-screenshots/day-08-nginx-log-save-to-file.png)  

- **Command to copy files from remote linux machine.**
> ` scp -i your-key.pem ubuntu@<your-instance-ip>:~/nginx-logs.txt . `

## Commands Used
- `ssh -i <keyfile.pem> <username>@<ip-address>`
- `ps aux  | grep <service name>`
- `sudo lsof -p <PID>`
- `tail -f </path/to/logfile.log>`
- `cat <filename>`
- `systemctl status <service name> `
- `journalctl -u <service name>`
- `sudo apt install <service>`
- `sudo apt-get update -y && sudo apt-get upgrade -y`
- `sudo chown <owner>:<group> <file name>`
- `ls -lr`
- `pwd`
- `newgrp <group name>`
- `sudo usermod -aG <group name> <user name>`

## Challenges Faced
- After launching the EC2 instance, I tried connecting to it using SSH but got a permission denied error. After checking, I realized the downloaded key pair file did not have the correct permissions. I fixed it by changing the file permission to 400, and then the connection worked.  

- After connecting to the EC2 instance and updating the system, the next commands I ran were not responding. When I checked the security group settings, I noticed that it was configured to allow SSH access only from my IP, but my IP address had changed. I updated the IP in the security group, and the issue was resolved.

- After installing Docker, when I ran docker `ps -a` to check containers, it showed a permission denied error. I solved this by creating a Docker group and adding the current user to that group.  

- While copying a file from the remote Linux server to my local machine using `scp`, the command failed and the file was not downloaded. After investigating, I found that the file ownership needed to be assigned to the user. Once I changed the ownership, the file copied successfully.  

## What I Learned

- Permissions matter a lot. Many issues were simply because of wrong file or user permissions.
- Always check basics first. Security groups, IP, and access settings can easily break things.
- Hands-on troubleshooting, fixing real errors helped me understand the system better.





