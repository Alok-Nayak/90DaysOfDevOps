# Linux Architecture

## Core Components of Linux are 
    1. Kernel
    2. System Libraries
    3. System Utilities.
    4. Shell.
    5. Hardware.

### kernel 
A linux kernel is the bridge between hardware and shell or application. Translate software commands into hardware actions. It tells the CPU what to do, basically it act as middle man between application/softwar and hardware. It allocates resources like CPU, memory to applications as per there need and make sure that one process won't affect another one.

- Process Managewment: It creates, schedule and terminate processes.
- Memory Managewment: Tracks memory usage, allocates RAM to processes, and manages virtual memory.
- Device Drivers: Acts as an interpreter, allowing software to use hardware like network cards, keyboards, and disks.
- File System Management: Provides a structured way to access and manage files and directories.
- System Calls: Handles requests from applications for services, managing security and resource access.
- Networking: Manage network calls and protocols.

### System Libraries
A Linux system library is a collection of pre-compiled code (functions and routines) that provides essential functionality for application programs and system utilities to access the Linux kernel's features and perform common tasks

### System Utilities
System utilities are the commend line tools that preforms various tasks provided by user to make system management and administration better.

### Shell
It is the interface to the kernel. It takes commands from the user and interprets them. 
The shell transmits these commands to the kernel, which then performs the requested operations. 
Users can just enter the commend and using the kernel's function that specific task is performed accordingly.

### Hardware Layer
It is the foundation of entire system, it have all physical components like the CPU, RAM, storage, Graphic card, Input/Output devices.

## How processes are created and managed in linux?
- PowerOn-> After power on the BIOS/UEFI wakes up the hardware and find the startup instruction (bootloader).
- GNU/GRUB-> Then HW tells GRUB to load the linux kernel.
- Loading Screen-> When we see the loading screen in background the kernel is mounting files and get the brain of the OS ready.
- init/systemd Process:-> After the kernel setuped it lunches systemd which is the very first software to run on userspace.
- PID1:-> Because it is the first process it gets id as 1.
- Systemctl:-> This is system controller by which user intracts with the process.

## What systemd does and why it matters?
systemd is a system and service manager for Linux os. Systemd acts as the init system that brings up and maintains user space services when run as the first process on boot (PID 1) and responsible for starting, stopping and managing services. PID 1 is known as init and is the first Linux user-mode process created. It runs until the system shutdown. Systemd mounts the host's file system and manages temporary file.

Automatically restarts services on failure using unit policies.
Simplifies troubleshooting with centralized logs via journalctl.
Limits CPU/RAM per service to prevent crashes using Cgroups.
Speeds up boot times with dependency-based parallel startup.
Standardizes management across all distros via systemctl.

## Daily Use Linux Commands:
ps -aux (To view running processes and their PID)
![ps -aux](https://github.com/Alok-Nayak/90DaysOfDevOps/2026/day-02/images/ps%20-aux)


