### Task 1: Understanding Branches

1. What is a branch in Git?
    - A Git branch is an independent, isolated workspace created from the primary codebase that allows developers to create, modify, or test features without impacting the stable production line `main` . It enables multiple team members to work on different parts of the project simultaneously without interfering with each other's code. Once the changes are fully verified and approved, the branch is merged back into `main` to update the application safely.

2. Why do we use branches instead of committing everything to `main`?
    - Committing directly to `main` is  if a bug or broken code slips through, it can cause immediate application downtime, and rolling back changes becomes a huge headache when dozens of developers are pushing code at the same time. Using branches completely isolates new modifications, making it easy to identify, debug, and fix issues without affecting the live site. This setup ensures that code is only brought into production after it has passed a thorough verification and approval process.

3. What is `HEAD` in Git?
    - HEAD is simply a pointer or reference that indicates your current position in the Git repository. It usually points directly to the latest commit of the specific branch you currently have checked out, effectively telling Git which snapshot of your project you are actively working on right now.

4. What happens to your files when you switch branches?
    - When you switch branches, Git automatically updates your local working directory to match the exact snapshot of the target branch. Files you modified or created on your previous branch disappear from your folder and saved safely in git's history, and the files belonging to the new branch instantly appear so you can pick up exactly where you left off.
