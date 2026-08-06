# Git Reset vs Revert & Branching Strategies

### Task 1: Git Reset — Hands-On
1. Make 3 commits in your practice repo (commit A, B, C)
![day-25-t-1-p-1]()

2. Use `git reset --soft` to go back one commit — what happens to the changes?
    - After running `git reset --soft <commit id>`, HEAD moves back to that commit ID. The changes from the commits above it move to the staging area (ready to commit again).

![day-25-t-2-p-2]()

3. Re-commit, then use `git reset --mixed` to go back one commit — what happens now?
    - After running `git reset --mixed <commit id>`, HEAD moves back to that commit ID. The changes from the commits above it move back to the working directory (unstaged).

![day-25-t-1-p-3]()

4. Re-commit, then use `git reset --hard` to go back one commit — what happens this time?
    - `git reset --hard <commit id>`, HEAD moves back to that commit ID, and all changes from the commits above it are completely deleted from both the staging area and working directory.
![day-25-t-1-p-4]()

5. Answer in your notes:
    - What is the difference between `--soft`, `--mixed`, and `--hard`?
        - `--soft` : Moves HEAD back to the target commit and puts all the undone changes into the staging area (safe, ready to re-commit).
        - `--mixed` (Default): Moves HEAD back to the target commit and puts the undone changes into the working directory (unstaged, meaning they are just sitting in your files).
        - `--hard` : Moves HEAD back to the target commit and completely deletes all undone changes from both your staging area and working directory.

    - Which one is destructive and why?
        - `--hard` is destructive.
        - Why: Because it wipes out and permanently deletes uncommitted changes and newer commits from your working tree. If you haven't backed them up, you will lose your code.
    
    - When would you use each one?
        - `--soft` : When you want to undo a commit (or a few commits) just to combine them into one single commit, clean up your commit message, or re-organize how you staged your files.
        - `--mixed`: When you want to undo a commit, but you want to completely review, edit, or split up the code changes in your files before committing them again.
        - `--hard` : When your current experimental work is completely messed up, broken, or useless, and you want to instantly throw it all away and reset your project back to a clean, working past commit.

    - Should you ever use `git reset` on commits that are already pushed?
        - We should avoid it.
        - It rewrites history and breaks the remote repository for anyone else working on it.
        - Use git revert instead. It creates a new commit that undoes the changes safely without rewriting history.

---

### Task 2: Git Revert — Hands-On
1. Make 3 commits (commit X, Y, Z)

![day-25-t-1-p-1]()
![day-25-t-1-p-2]()
![day-25-t-1-p-3]()
![day-25-t-1-p-4]()

2. Revert commit Y (the middle one) — what happens?

![day-25-t-2-p-1]()
![day-25-t-2-p-2_a]()
![day-25-t-2-p-2_b]()
![day-25-t-2-p-2_c]()
![day-25-t-2-p-2_d]()

3. Check `git log` — is commit Y still in the history?

![day-25-t-2-p-3]()

4. Answer in your notes:
    - How is `git revert` different from `git reset`?
        - `git reset` : rewinds history backward. It erases or unstages past commits as if they never happened.
        - `git revert`: moves history forward. It leaves old commits untouched and creates a brand-new commit that undoes the exact changes of a specific past commit.

    - Why is revert considered **safer** than reset for shared branches?
        - `git reset` rewrites history. If you reset commits that are already pushed to GitHub/remote, you break the branch for everyone else working on it and force risky `git push --force` commands.
        - `git revert` is just a normal new commit. It doesn't break anyone's history, so teammates can pull it smoothly using a standard `git push` without any issues.

    - When would you use revert vs reset?
        - `git reset` : On your local, unpushed branches when you make mistakes, want to cleanup messy WIP(Work In Progress) commits, or want to wipe local test code before sharing.
        - `git revert`: On shared or public branches (like main or develop), or for any commits that are already pushed to GitHub.

---

### Task 3: Reset vs Revert — Summary
Create a comparison in your notes:

| | `git reset` | `git revert` |
|---|---|---|
| What it does | ? | ? |
| Removes commit from history? | ? | ? |
| Safe for shared/pushed branches? | ? | ? |
| When to use | ? | ? |

---
