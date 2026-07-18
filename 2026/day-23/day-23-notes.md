### Task 1: Understanding Branches

1. What is a branch in Git?
- A Git branch is a separate, safe workspace created by copying the primary codebase so developers can add, create, or modify code without affecting the production line. Multiple developers can work on different features at the same time in these parallel environments, keeping the main branch clean and stable. Once th
new code is fully tested and verified, the branch is simply merged back into main to update the project safely.

2. Why do we use branches instead of committing everything to `main`?
- If we commit directly to main then if any bug showup in application or due to any error we have to revert it then modify it and that will cause a downtime and it will be a headache to do so if there are 10's of devlopers writing and commiting directly to main.
- Creating a branch isolate the specific feature or modification to the branch itself and if anything happened we can identify and fix it easily. Also after complte verification only if that feature/modification is approved then we can merge that to main branch safely.

3. What is `HEAD` in Git?
4. What happens to your files when you switch branches?

---
