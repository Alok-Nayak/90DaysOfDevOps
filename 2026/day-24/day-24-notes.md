
### Task 1: Git Merge — Hands-On

1. Create a new branch `feature-login` from `main`, add a couple of commits to it

![git-merge-1]()

2. Switch back to `main` and merge `feature-login` into `main`

![git-branch-merge-2]()

3. Observe the merge — did Git do a **fast-forward** merge or a **merge commit**?
    - Git performs a Fast-forward merge because main had no new commits after feature-login was created. Git simply moved the main branch pointer forward to match feature-login. No extra commit was created.

![git log --oneline]()

4. Now create another branch `feature-signup`, add commits to it — but also add a commit to `main` before merging

![day-24-task-1-point-4]()

![day-24-task-1-point-4-2]()

5. Merge `feature-signup` into `main` — what happens this time?

![day-24-task-1-point-4-3]()
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

![day-24-task1-point-6-l]()

---


