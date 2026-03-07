# Day 13 – Linux Volume Management (LVM)

## Introduction

Storage management is a critical part of Linux system administration. Traditional disk partitioning can be inflexible when storage needs change.

This is where **Logical Volume Manager** (LVM) becomes powerful. It allows administrators to create flexible storage layers that can grow, shrink, and combine multiple disks.

In this article, I’ll explore LVM through two practical scenarios:

*   Creating and managing LVM using a **virtual disk for safe local practice**
    
*   Using LVM on a real cloud server by attaching a storage volume to an **Amazon EC2** instance backed by **Amazon Elastic Block Store**
    

## Understanding LVM Architecture

LVM introduces an abstraction layer between physical storage and filesystems.

Normal structure:

```plaintext
Disk → Partition → Filesystem
```

LVM structure:

```plaintext
Disk → Physical Volume → Volume Group → Logical Volume → Filesystem
```

## Lab 1 — Practicing LVM with a Virtual Disk

Before mounting the volumes

![](https://cdn.hashnode.com/uploads/covers/69abd0460bca1a39768f0d14/e160f239-a496-484f-9807-666e1ea9a817.png align="center")

Before working with real disks, it's safer to simulate one using a file.

### Step 1 — Create a Virtual Disk File

1.  lvm-disk1.img \[size: 1GB\]
    
2.  lvm-disk2.img \[size: 2GB\]
    

```shell
dd if=/dev/zero of=/tmp/lvm-disk1.img bs=1M count=1024
dd if=/dev/zero of=/tmp/lvm-disk2.img bs=2M count=1024
```

*   check the created disks files in the `/tmp` dierectory.
    

![](https://cdn.hashnode.com/uploads/covers/69abd0460bca1a39768f0d14/ee1723df-ebde-4ec3-b06f-9e7536a45aa1.png align="center")

### step 2 — Attach the virtual disk file with a **loop device and check**

```shell
sudo losetup -fP /tmp/lvm-disk1.img
sudo losetup -fP /tmp/lvm-disk2.img
```

`losetup` "plugs in" your virtual disk files so the system sees them as hardware.

*   `-f`: Finds the first **free** loop device automatically.
    
*   `-P`: Scans the file for **partitions** and creates separate nodes if found.
    

**Check the device and Note the device name (e.g., /dev/loop0)**

```shell
losetup -a | grep lvm
```

![](https://cdn.hashnode.com/uploads/covers/69abd0460bca1a39768f0d14/18f9cd47-a094-494d-815a-925dd5f1c686.png align="center")

You should see **loop devices with 1G and 2G sizes**

```shell
lsblk | grep loop48
lsblk | grep loop49
```

![](https://cdn.hashnode.com/uploads/covers/69abd0460bca1a39768f0d14/0969a840-f320-4d5d-82da-e2e37a77492e.png align="center")

### step 3 — **Create Physical Volume**

```shell
sudo pvcreate /dev/loop48
sudo pvcreate /dev/loop49
```

*   If `pvcreate` command not found install it with `sudo apt install lvm2 -y`
    

Verify the created volumes with:

```shell
sudo pvs
```

![](https://cdn.hashnode.com/uploads/covers/69abd0460bca1a39768f0d14/75ed96d1-a93a-41e4-85a4-0bce21720d75.png align="center")

### step 4 — Create Volume Group

We will combine both disks loop48 and loop49 into one storage pool `devops-pv`

```shell
sudo vgcreate devops-vg /dev/loop48 /dev/loop49
sudo vgs
sudo pvdisplay /dev/loop48
sudo pvdisplay /dev/loop49
```

![](https://cdn.hashnode.com/uploads/covers/69abd0460bca1a39768f0d14/b5aaabd6-1b56-49dd-b17e-3e526ad838f5.png align="center")
