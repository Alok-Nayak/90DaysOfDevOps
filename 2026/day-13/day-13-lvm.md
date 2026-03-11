# LVM

## Task 1: Check Cuyrrent Storage
![check current storage](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-1-check-current-storage.png)    


## Task 2: Create Physical Volume

### Create a Virtual Disk File
```command
dd if=/dev/zero of=/tmp/disk1.img bs=1M count=1024
```
### Attach the virtual disk file with a loop device
```command
losetup -fP /tmp/disk1.img
```
![attach the virtuals disk file with loop device](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-2-disk-img-loop-device-attach.png)    

![check](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-2-a-checking-loop-device.png)    

### Create Physical Volume
```command
    sudp pvcreate /dev/loop6
    sudo pvs
```
![pysical-volume](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-3-creatiung-physical-disk.png)    

## Task 3: Create Volume Group

```command
sudo vgcreate devops-vg /dev/loop6
sudo vgs
```
![volume group](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-4-creating-volume-group.png)    

## Task 4: Create Logical Volume
```command
lvcreate -L 500M -n app-data devops-vg
lvs
```
![logiocal volume](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-5-t4-creating-logical-volume.png)    

## Task 5: Format and Mount
```command
mkfs.ext4 /dev/devops-vg/app-data
mkdir -p /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data
df -h /mnt/app-data
```
![Format and Mount](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-6--t5-format-%26-mount.png)    

## Task 6: Extend the Volume
```command
lvextend -L +200M /dev/devops-vg/app-data
resize2fs /dev/devops-vg/app-data
df -h /mnt/app-data
```
![extend the volume](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/6cc7d8c78557d173d18663416ec06f5bbf055e4b/2026/day-13/day-13-lvm-snapshots/day-13-7-t6-volume-extend.png)  

## What I leraned:

- LVM provides flexibility compared to traditional disk partitioning
- Storage can be extended dynamically without recreating partitions
- Logical volumes make storage management easier for applications and servers.  

