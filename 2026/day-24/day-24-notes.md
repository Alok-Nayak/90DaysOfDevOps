
### Task 1: Git Merge — Hands-On
---

1. Create a new branch `feature-login` from `main`, add a couple of commits to it

![git-merge-1](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/git-merge-1.png)

2. Switch back to `main` and merge `feature-login` into `main`

![git-branch-merge-2](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/git-brnach-merge-2_.png)

3. Observe the merge — did Git do a **fast-forward** merge or a **merge commit**?
    - Git performs a Fast-forward merge because main had no new commits after feature-login was created. Git simply moved the main branch pointer forward to match feature-login. No extra commit was created.

![git log --oneline](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/git%20log%20--oneline_2.png)

4. Now create another branch `feature-signup`, add commits to it — but also add a commit to `main` before merging

![day-24-task-1-point-4](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-1-point4.png)

![day-24-task-1-point-4-2](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-1-point-4-2.png)

5. Merge `feature-signup` into `main` — what happens this time?

![day-24-task-1-point-4-3](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task1-point-4-3.png)
    - When i tyry to merge the `featur-signup` branch in `main` where both `feature-branch` and `main` have commits it oppend an editor with a commit message `Merge branch 'feature-signup'.`. Then i edited and added another message and saved. Then i abele to merge it with main.

6. Answer in your notes:
- What is a fast-forward merge?
    -   A fast-forward merge happens when the target branch (main) has no new commits since the feature branch was created. Git doesn't need to combine histories; it just slides the main pointer straight forward to the latest commit of the feature branch.

- When does Git create a merge commit instead?
    - If there are two branches—for example, main and a feature branch created from it—and commits were made on both the new branch and main, Git creates a merge commit when merging them together.
    - When this happens: 
        - Git automatically opens a text editor (like Vim) to save the merge commit message.
        - The merge strategy used by default is called ort.
        - Once saved and closed, the new merge commit integrates both branches safely into main.

- What is a merge conflict? (try creating one intentionally by editing the same line in both branches)
    - A merge conflict occurs when two different branches modify the exact same line(s) of a file in different ways, or when one branch deletes a file that another branch modified. Git cannot automatically decide which change is correct, so it pauses the merge process and flags the file, requiring manual intervention to choose the correct code before finishing the merge.

![day-24-task1-point-6](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task1-point-6.png)

---

### Task 2: Git Rebase — Hands-On
---

1. Create a branch `feature-dashboard` from `main`, add 2-3 commits

- ![day24-task-2-point1](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/task-2-point-1.png)

2. While on `main`, add a new commit (so `main` moves ahead)

- ![day24-task-2-point2](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-2-point-2.png)

3. Switch to `feature-dashboard` and rebase it onto `main`

- ![day24-task-2-point3](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-2-point-3.png)

4. Observe your `git log --oneline --grah --all` — how does the history look compared to a merge?

- ![day-24-task2-point4-before-rebase](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-2-point-4-before-rebase.png)
 **and**
- ![day-24-task2-point4-after-rebase](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-2-point-4-after-rebase.png)

5. Answer in your notes:
    - What does rebase actually do to your commits?
        - Rebase takes the commits made on a feature branch, temporarily sets them aside, moves the starting point of the branch to the latest commit of `main`, and then replays those feature commits one by one on top of `main`.

        - Unlike a merge, it does not create an extra merge commit or open an editor for a merge message. Instead, it rewrites history to make it look like you started your work from the newest version of `main`, giving you a clean, single straight-line commit history. 

    - How is the history different from a merge?
        - **Merge:** Retains the exact historical truth. It shows when the branch diverged and keeps a separate merge commit joining the paths together. The graph looks like a tree with branches splitting and joining.

        - **Rebase:** Cleans up and rewrites history into a single linear path. There are no extra merge commits, making the commit log very clean and straightforward to read.
    
    - Why should you **never rebase commits that have been pushed and shared** with others?
        - Because rebase rewrites history and changes commit hashes, rebasing a public branch destroys the shared reference point. If others are building on those original commits, pushing a rebased branch forces remote conflicts, breaks their local repositories, and forces the whole team to manually fix a broken history.

    - When would you use rebase vs merge?
        - **Use Rebase:** When working on a local, private feature branch before submitting changes to the team. It keeps your feature branch up-to-date with main and creates a clean, linear history.

        - **Use Merge:** When integrating a completed feature branch into shared/public branches (like `main` or `develop`), or when preserving the exact context and timeline of commits is necessary.

---

### Task 3: Squash Commit vs Merge Commit
---

1. Create a branch `feature-profile`, add 4-5 small commits (typo fix, formatting, etc.)
![day-24-task3-point-1](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-3-point-1.png)

2. Merge it into `main` using `--squash` — what happens?
![day-24-task3-point-2](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-3-point-2.png)

3. Check `git log` — how many commits were added to `main`?
![day-24-task3-point-3](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-3-pont-3.png)

4. Now create another branch `feature-settings`, add a few commits
![day-24-task3-point-4](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-3-point-4.png)

5. Merge it into `main` **without** `--squash` (regular merge) — compare the history
![day-24-task3-point-5]()

![day-24-task3-point-5-log](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-3-point-5-log.png)


6. Answer in your notes:
    - What does squash merging do?
        - Squash merging combines all individual commits from a feature branch into a single unified set of changes and applies them as one single commit onto main.
    
    - When would you use squash merge vs regular merge?
        - **Squash Merge:** Use it when a feature branch has lots of tiny or messy commits (like "fix typo", "formatting", "WIP") so you can keep the main branch log clean.
        - **Regular Merge:** Use it when you want to keep the complete, step-by-step history and see every individual commit made during the feature development.
    
    - What is the trade-off of squashing?
        - You lose the detailed step-by-step history. If something breaks later, you can't see or revert a specific small change inside that feature—you can only revert the entire squashed commit.

---

### Task 4: Git Stash — Hands-On
---

1. Start making changes to a file but **do not commit**
2. Now imagine you need to urgently switch to another branch — try switching. What happens?

![day-24-task4-point-2](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-4-point-1and2_1.png)

3. Use `git stash` to save your work-in-progress

![day-24-task4-point-3_1](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-4-point3_1.png.png)                                                                                                                                                                                                                                                                 
- When you create a new file on one branch (main) and leave it uncommitted, Git will block you from switching to another branch (feature-1) if that target branch does not have the file.

- **To fix this and switch safely:**
    - Run `git stash` to temporarily park your uncommitted work.
    - Switch branches freely using `git switch <branch>`.
    - When you come back, run `git stash pop` to restore your files.

4. Switch to another branch, do some work, switch back
5. Apply your stashed changes using `git stash pop`

![day-24-task4-point-5](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-4-point-5_.png)

6. Try stashing multiple times and list all stashes
7. Try applying a specific stash from the list

![day-24-task4-point-6-7](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-4-point-6-7.png)

8. Answer in your notes:
    - What is the difference between `git stash pop` and `git stash apply`?
        - **`git stash pop`**: Restores the stashed changes to your working space and automatically deletes that stash entry from the `git stash list`.
        - **`git stash apply`**: Restores the stashed changes to your working space but keeps the stash entry saved in the `git stash list` so you can reuse it again later or apply it on another branch (like feature-1).
    
    - When would you use stash in a real-world workflow?
        - **Urgent context switching:** When working on a feature in `feature-1` and you suddenly need to switch to main to fix a production bug, but your feature work isn't complete or clean enough to commit yet
        - **Overcoming branch switch errors:** When Git blocks `git switch feature-1` with `error: Your local changes... would be overwritten because you have uncommitted files that differ from or don't exist in feature-1`.
        - **Pulling latest changes cleanly:** When you need to run `git pull` on `main`, but local uncommitted changes prevent the pull. You `stash`, `pull`, and then `apply` your stash back on top.

---

### Task 5: Cherry Picking
---

1. Create a branch `feature-hotfix`, make 3 commits with different changes
2. Switch to `main`

![day-24-task-5-point-1-2](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-5-point-1-2.png)

3. Cherry-pick **only the second commit** from `feature-hotfix` onto `main`
4. Verify with `git log` that only that one commit was applied

![day-24-task-5-point-3-4](https://github.com/Alok-Nayak/90DaysOfDevOps-Core/blob/073f619b77c872623e89fbadb15fb0a5e6c926fa/2026/day-24/day-24-snapshots/day-24-task-5-point-3-4.png)

5. Answer in your notes:
    - What does cherry-pick do?
        - `git cherry-pick <commit-hash>` selects a specific, single commit from any branch and applies its exact changes as a brand new commit onto your current working branch.
    
    - When would you use cherry-pick in a real project?
        - **Urgent Hotfixes:** A bug fix was made on a development or feature branch that isn't ready to be merged yet, but production (`main`) needs that specific fix right away.
        - **Accidental Commits:** You made a commit on the wrong branch (e.g., committed directly on `main` instead of `feature-login`). You can switch to `feature-login`, cherry-pick the commit hash over, and then reset `main`.
        - **Extracting Specific Features:** You want a single utility function or bug fix from a colleague's dirty/abandoned branch without bringing over all their incomplete work.
    
    - What can go wrong with cherry-picking?
        - **Duplicate Commits:** Cherry-picking creates a new commit with a new hash on the target branch. If you later merge or rebase the original branch into main, Git might try to apply the same changes twice, leading to merge conflicts.
        - **Missing Dependencies:** If the commit you cherry-pick relies on code or variables introduced in prior commits on that feature branch, the cherry-picked code will break or fail to compile.
        - **Merge Conflicts:** If the code surrounding the cherry-picked change differs between branches, Git will pause and force you to resolve a merge conflict manually.
---


