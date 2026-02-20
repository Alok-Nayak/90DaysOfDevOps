# git commands

## Setup & Config

` git init `    :Iniitialize git.
` git config --global user.name Alok-Nayak ` :Set global Username.
` git config --global user.email "aloknayak.contact@gmail.com" ` : Set global email addr.

- **To unset global config. user and email.**
```bash
git config --global --unset user.name  
git config --global --unset user.email
```
## Basic Workflow

- ` git status `   -Check git status
- ` git add <file> ` -Add file to staging area.
- ` git add . `  - Add everything in working directory to staging area.
- ` git commit -m "message" ` - Adding the commit message.
- ` git push `  - Pushing commits to github repo.
- ` git pull `  - Pulling changes from git hub.

## Viewing Changes

- ` git log ` - Show's commit history
- ` git diff ` - Show's unstaged changes(working vs staging).
- ` git diff --staged ` -Shows staged changes(staging vs last commit).
- ` git show <commitid> ` - Shows details of a specific commit.
    
