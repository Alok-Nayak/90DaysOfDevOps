# git

## TASK-1 : Install and Configure Git

### cheking git version

```bash
git -v or git --version
```

### Setting up git identity

**Check Global Configuration.**
```bash
- git config --global --list 
- git config --list
- git config --global user.name Alok-Nayak
- git config --global user.email "aloknayak.contact@gmail.com"
```
![git config ](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/f0d088db13b75acffa161eda5e45b03d5de252d5/2026/day-22/day-22-git-snapshots/git-config.png)

### TASK-2 : Create Your Git Project

1. Created new directory `devops-git-practice `.
2.  Initialize it as a Git repository.
3. Checked `.git` directory.

```bash
1. mkdir devops-git-practice
2. cd devops-git-practice
3. git init
4. git status
```
![git init](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/f0d088db13b75acffa161eda5e45b03d5de252d5/2026/day-22/day-22-git-snapshots/git%20init.png)
### TASK-3 : Create Your Git Commands Reference
1. created `git-commands.md` inside `devops-git-practice` directory.
2. Added commands for :
    - Setup and Config.  
    - Basic Workflow.  
    - Viweing Chnages.  
![git commnad](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/f0d088db13b75acffa161eda5e45b03d5de252d5/2026/day-22/day-22-git-snapshots/task-3-1.png)

### TASK-4 : Stage and Commit
1. Stagged files with ` git add . `.
2. Checked what is staged with ` git status `.
3. Added a commit message ` docs: added devops-git-practice.md file `.
4. Viwed commit history with ` git log --oneline `.
![stage&commit](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/f0d088db13b75acffa161eda5e45b03d5de252d5/2026/day-22/day-22-git-snapshots/Stage%20and%20Commit.png)
![commit history](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/f0d088db13b75acffa161eda5e45b03d5de252d5/2026/day-22/day-22-git-snapshots/commit%20history.png)

### Task 5: Make More Changes and Build History
Done and pushed.


### Task 6: Understand the Git Workflow.  
Done

- Q1. What is the difference between git add and git commit?
```bash
With "git add" we can add the files/dir from workarea to staging area and after then only we can commit it to local repo.
```
- Q2. What does the staging area do? Why doesn't Git just commit directly?
```bash
The staging area gives us freedom to check the files we are going to commit, so any thing needs to change we can restore and make changes and then commit also we can add selective files to commit and finally push to repo.

- Q3. What information does git log show you?
```bash
git log shows commit history.
```
- Q4. What is the .git/ folder and what happens if you delete it?
```bash
So when we initialize git with **git init** it create a .git folder.
And it's basically our local git repo where it manages project history and configuration.
```
- Q5. What is the difference between a working directory, staging area, and repository?
```bash
After we initialize git it creates 3 workspace:
Working Directory: This the space where we create/modify files. And whatever actions performed here(create/delete/modify) git keeps all record of it.
Staging Area: This is where the files moves after we run "git add ." command, and then we can review the files and can modify them if needed before commiting.
Repository: The files along with the rivision history stored in a space after commit and that space called repository.


