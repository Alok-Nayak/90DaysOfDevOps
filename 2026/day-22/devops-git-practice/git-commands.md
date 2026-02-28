# git commands

## Basic Commands

### Setup & Config

` git init `    - Iniitialize git.  
` git config --global user.name Alok-Nayak ` - Set global Username.  
` git config --global user.email "aloknayak.contact@gmail.com" ` - Set global email addr.  

- **To unset global config. user and email.**  

```bash
git config --global --unset user.name  
git config --global --unset user.email
```
### Basic Workflow

- ` git status `                - Check git status
- ` git add <file> `            - Add file to staging area.
- ` git add . `                 - Add everything in working directory to staging area.
- ` git commit -m "message" `        - Adding the commit message.
- ` git push `                       - Pushing commits to github repo.
- ` git pull `                       - Pulling changes from git hub.
- ` git fetch `                      - Only fetch changes, no merge.

### Remote Repo 

- ` git remote -v `                       - Show remote repos.
- ` git remote add origin <repo-url> `    -  Add remote repo.
- ` git push -u origin <main> `           - Push and set upstreame
- ` git push origin --delete <branch-name> `  - Delete remote branch.

### Viewing Changes

- ` git log `             - Show's full commit history.
- ` git log --oneline `   - Oneline commit  history.
- ` git diff `            - Show's unstaged changes(working vs staging).
- ` git diff --staged `   - Shows staged changes(staging vs last commit).
- ` git show <commitid> ` - Shows details of a specific commit.-

## Git Advance Commands

### Branching & Switching

- ` git branch `                    - List local branches
- ` git branch -r `                 - List remote branches
- ` git branch -a  `                - List all branches
- ` git branch <branch-name> `      - Create branch
- ` git checkout <branch-name> `    - Switch branch
- ` git checkout -b <branch-name> ` - Create + switch branch

### New Commands

- ` git switch <branch-name> `      - Switch branch
- ` git switch -c <branch-name> `   - Create + switch
- ` git branch -M main `            - Rename current branch

### Merging & Rebaseing

- ` git merge branch-name `         - Merge branch into current.
- ` git rebase branch-name `        - Reapply commits on top of another branch.
- ` git pull --rebase `             - Pull with rebase instead of merge.
- ` git cherry-pick <commit-id> `   - Apply a single commit from another branch.

### Srash & Restore

- ` git stash `     - saves tracked changes.
git stash -u saves tracked + untracked changes
git stash apply        # Restore last stash without removing it
git stash list         # List all stashes
git stash apply        # Restore last stash without removing it
git stash list         # List all stashes

### Inspection and clean

- ` git reflog `            - Show all HEAD movements.
- ` git clean -fd `         - Remove untracked files/folders.
- ` git blame <file> `      - See who changed each line.
