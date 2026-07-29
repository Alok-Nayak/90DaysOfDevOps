### Task 1: Understanding Branches

1. What is a branch in Git?
    - A Git branch is an independent, isolated workspace created from the primary codebase that allows developers to create, modify, or test features without impacting the stable production line `main` . It enables multiple team members to work on different parts of the project simultaneously without interfering with each other's code. Once the changes are fully verified and approved, the branch is merged back into `main` to update the application safely.

2. Why do we use branches instead of committing everything to `main`?
    - Committing directly to `main` is  if a bug or broken code slips through, it can cause immediate application downtime, and rolling back changes becomes a huge headache when dozens of developers are pushing code at the same time. Using branches completely isolates new modifications, making it easy to identify, debug, and fix issues without affecting the live site. This setup ensures that code is only brought into production after it has passed a thorough verification and approval process.

3. What is `HEAD` in Git?
    - HEAD is simply a pointer or reference that indicates your current position in the Git repository. It usually points directly to the latest commit of the specific branch you currently have checked out, effectively telling Git which snapshot of your project you are actively working on right now.

4. What happens to your files when you switch branches?
    - When you switch branches, Git automatically updates your local working directory to match the exact snapshot of the target branch. Files you modified or created on your previous branch disappear from your folder and saved safely in git's history, and the files belonging to the new branch instantly appear so you can pick up exactly where you left off.

---

### Task 2: Branching Commands — Hands-On
Completing this in `devops-git-practice` repo.

1. List all branches in your repo
2. Create a new branch called `feature-1`
3. Switch to `feature-1`
4. Create a new branch and switch to it in a single command — call it `feature-2`

![git-branch](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fc1b0838dd900e9a74f72feead67775a3b05af89/2026/day-23/day-23-git-adv-snapshots/git-branch.png) #branch-feature1

5. Try using `git switch` to move between branches — how is it different from `git checkout`?
6. Make a commit on `feature-1` that does not  exist on `main`
7. Switch back to `main` — verify that the commit from `feature-1` is not there
8. Delete a branch you no longer need
9. Add all branching commands to your `git-commands.md`

![branch-feature1](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fc1b0838dd900e9a74f72feead67775a3b05af89/2026/day-23/day-23-git-adv-snapshots/branch-feature1.png)

---


### Task 3: Push to GitHub
1. Create a **new repository** on GitHub (do NOT initialize it with a README)
2. Connect your local `devops-git-practice` repo to the GitHub remote
3. Push your `main` branch to GitHub
4. Push `feature-1` branch to GitHub

![feature-1-branch-push](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fc1b0838dd900e9a74f72feead67775a3b05af89/2026/day-23/day-23-git-adv-snapshots/featue-1-branch-push.png)

5. Verify both branches are visible on GitHub

6. What is the difference between `origin` and `upstream`?
    - origin is your own copy (fork) of the repository on GitHub, while upstream is the original main repository that everyone else is contributing to.
    - When you want to work on a project, you fork the main repo to your account (origin) so you can push your changes freely without messing up the original project. You then set the original main repo as upstream so you can pull the latest updates from it and keep your local code synced with the team. 
    - So you  push your changes to origin and fetch the central updates from upstream.

---

### Task 4: Pull from GitHub
1.  Make a change to a file **directly on GitHub** (use the GitHub editor)
2.  Pull that change to your local repo
3.  What is the difference between `git fetch` and `git pull`?
    - `git fetch` only downloads the latest commits, branches, and tags from the remote repository without altering local files or merging changes into the current working branch. On the other hand, `git pull` runs both `git fetch` and `git merge` in a single command, immediately downloading the latest changes and updating the active branch automatically.

![different-branch-commits](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/fc1b0838dd900e9a74f72feead67775a3b05af89/2026/day-23/day-23-git-adv-snapshots/different%20branch%20commits-cli.png)

---
### Task 5: Clone vs Fork
1. **Clone** any public repository from GitHub to your local machine
2. **Fork** the same repository on GitHub, then clone your fork
3.  What is the difference between clone and fork?
    -   `fork` creates a copy of someone else's repository under your own GitHub account on the cloud, while `clone` downloads a repository from the cloud directly onto your local machine so you can start working on it.
4.  When would you clone vs fork?
    - Fork when you want your own independent copy on GitHub (like contributing to open source or experimenting without affecting the original project). Clone when you already have access to the repo and just need a copy on your laptop to start writing code and pushing directly to it.
   
5. After forking, how do you keep your fork in sync with the original repo?
    - Set the original repo as `upstream`, `fetch` its latest changes, and merge them into the local `main` branch before pushing to `origin`:
    - ```bash
git remote add upstream <original-repo-url>
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

```
- Or, we can sync directly on GitHub:
    -  Open the forked repository on GitHub, click the Fetch upstream button near the top, and select Sync fork. After syncing online, simply run `git pull origin main` in the terminal to update the local machine.

---


