# Day 11 Challenge

## Files & Directories Created
### Task 1: Understanding Ownership

1.  Run ` ls -l ` in your home directory
2.  Identify the owner and group columns
3.  Check who owns your files
- Format:` -rw-r--r-- 1 owner group size date filename `

What's the difference between owner and group?
> The Owner is the single individual (user) who has primary control over the file.
> Group is a collection of multiple users who share the same access level.

![task-1]()  

## Ownership Changes
### Task 2: Basic chown Operations (20 minutes)
1. Create file `devops-file.txt`
2. Check current owner: `ls -l devops-file.txt`
3. Change owner to tokyo
4. Change owner to berlin
5. Verify the changes

![task-2]()  

### Task 3: Basic chgrp Operations
1. Create file `team-notes.txt`
2. Check current group: `ls -l team-notes.txt`
3. Create group: `sudo groupadd heist-team`
4. Change file group to `heist-team`
5. Verify the change

![task-3]()  

### Task 4: Combined Owner & Group Change  
- Using chown you can change both owner and group together:
1. Create file `project-config.yaml`
2. Change owner to professor AND group to heist-team.
3. Create directory `app-logs/`
4. Change its owner to `berlin` and group to `heist-team`.

![task-4]()  

### Task 5: Recursive Ownership  
![task-5]()  

### Task 6: Practice Challenge
- Create directory: bank-heist/
- Create 3 files inside: access-codes.txt, blueprints.pdf, escape-plan.txt
- Set different ownership:
  - access-codes.txt → owner: tokyo, group: vault-team
  - blueprints.pdf → owner: berlin, group: tech-team
  - escape-plan.txt → owner: nairobi, group: vault-team

![task-6]()  
!task-6]()  

## Commands Used

- `mkdir -p heist-project/vault`
- `touch heist-project/vault/gold.txt`
- `sudo groupadd planners`
- `sudo chown professor:planners heist-project/`
- `sudo chown berlin:tech-team bank-heist/blueprints.pdf`
- `ls -lR bank-heist/`

## What I Learned
- Every file has exactly one Owner (UID) and one Group (GID)
- Permissions are applied separately to the User, Group, and Others.
- By default, new files are owned by the user who created them and their primary group.
- Permissions determine what can be done.
- Ownership determines who does it.
