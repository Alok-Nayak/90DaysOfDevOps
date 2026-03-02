# Day 09 Challenge

## Users & Groups Created
- Users: tokyo, berlin, professor, nairobi
- Groups: developers, admins, project-team
![task-1]()  
![task-2]()  

## Group Assignments
- tokyo → developers, project-team
- berlin → developers, admins
- professor → admins
- nairobi → project-team
![Task-3]()   

## Directories Created
- /opt/dev-project (775, group: developers)
- /opt/team-workspace (775, group: project-team)
![Task-4]()  
![task-5]()    

## Commands Used
useradd, passwd, groupadd, usermod, chgrp, chmod, groups, ls

## What I Learned
1. Group permissions control collaboration.
2. 775 enables controlled shared access.
3. Always use -aG when adding users to groups.
