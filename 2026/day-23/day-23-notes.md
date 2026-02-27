# Git Advance
## Task-1 : Understanding Branches

1. What is a branch in Git?  
```bash
A branch is an independent line of development created from another branch.
It contains all the code from the point where it was created.
Any new features, fixes, or experiments done in that branch do not affect the main branch until it is merged.  
```   
2. Why do we use branches instead of committing everything to main?  
```bash
We use branches to develop features or fixes in isolation without affecting the main branch.
This prevents breaking production code.
It also enables multiple developers to work in parallel without creating conflicts or chaos in the main branch.
```
3. What is HEAD in Git?  
```bash
HEAD is a pointer that tells Git which branch and commit you are currently on. 
```
4. What happens to your files when you switch branches?  

```bash
- When we switch branches, Git updates the working directory files to match the snapshot of the branch we switched to. Files that don’t exist in that branch are removed, and files that exist in that branch are restored.  
- And when we create a new branch then it simply creates a new pointer to the current commit. No files change at that moment.
```

## Task-2: Branching Commands — Hands-On

In [devops-git-practice](https://github.com/Alok-Nayak/devops-git-practice.git).

1. Listed all branches in the repo.
2. Created a new branch called feature-1.
3. Switched to feature-1.
4. Created a new branch and switched to it in a single command — call it feature-2.
5. Moved between branches using git switch.

    - Both `git checkout -b` and `git switch -c` create and switch to a new branch, but git switch only switches between existing branch.  

6. Commited feat `feat1.md` on `feature-1` it was not exist on main.
7. Switched back to main — verified that the commit from feature-1 is not there
8. Delete a branch you no longer need
9. Added all branching commands to [git-commands.md](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/9771d239cac1ad806143c6c81f35ac877f14d506/2026/day-22/devops-git-practice/git-commands.md)  

![TASK-2 git branch](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/14855b3d94c5ee78211d09964861c2d09d838d38/2026/day-23/day-23-git-adv-snapshots/git-branch.png)  
![TASK-2 git chekout -b](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/14855b3d94c5ee78211d09964861c2d09d838d38/2026/day-23/day-23-git-adv-snapshots/git-chekout-b.png)
![TASK-2 feat1 branch commit](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/14855b3d94c5ee78211d09964861c2d09d838d38/2026/day-23/day-23-git-adv-snapshots/feature%201%20commit%20not%20in%20main.png)  


## Task 3: Push to GitHub

1. Created a new repository on GitHub `devops-git-practice`
2. Connected local devops-git-practice repo to the GitHub remote.
3. Pushed your main branch to GitHub
4. Pushed feature-1 branch to GitHub
5. Both branches are visible on GitHub

6. What is the difference between origin and upstream?

**Ans :
```bash
*origin*     : Default name of the remote repository.
*upstream*   : Either the original repo (in fork workflow) OR the remote branch that local branch tracks.
```

## Task 4: Pull from GitHub

1. Make a change to a file directly on GitHub (use the GitHub editor)
2. Pull that change to your local repo
3. What is the difference between git fetch and git pull?

**Ans :
```bash
*git fetch* : Downloads changes but does NOT apply them.
*git pull*  : Downloads changes AND merges them into your current branch.
```

## Task 5: Clone vs Fork

1. Cloned public repository from GitHub to your local machine
2. Fork the same repository on GitHub, then clone your fork
3. What is the difference between clone and fork?
4. When would you clone vs fork?
5. After forking, how do you keep your fork in sync with the original repo?
