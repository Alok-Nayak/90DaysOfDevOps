#  Linux File System Hierarchy & Scenario-Based Practice.

## part-1 : Linux File System Hierarchy

> In linux everything represented as file including hardware program. The files are stored in a directory and every directory contains a file with a tree structure and this is called file system hierarchy.

### Core Directories (Must Know):
- **/ (root)** - The starting point of entire linux file system. From here all other filesystems are mounted at system boot up.
    - It's owned by the root user (admin), and only admin can add, remove or modify files in this directory.
    - `/root` is the root user’s home directory, which is not the same as `/`.  

        - **I would use this when...**
            - I would use `/` when i need to understand the overall filesystem layout or locate major system directories.
    
   - ![root_dir]()  

- **/home** - User home directories.
    - Every non-root user has personal directories inside `/home`.
    - Each user can create, delete, or modify files only in their own home directory and cannot access others’ home directories.
    - Under `/home` there are two directories: `/home/alok-nayak`, which contains all my files.  

        - **I would use this when...**  
            - Masnaging user data, checking permissions, or troubleshoot user specific issues.
    
    - ![hom-dir]()  

- **/root** - Root user's home directory.
    -
- **/etc** - Configuration files
- **/var/log** - Log files (very important for DevOps!)
- **/tmp** - Temporary files
