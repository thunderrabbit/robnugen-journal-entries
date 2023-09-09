---
title: "Thank God I stayed home yay"
tags: [ "literally" ]
author: Rob Nugen
date: 2023-09-09T11:10:45+09:00
draft: false
---

##### 10:32 Saturday 09 September 2023 JST

Oh my flock of cats I'm so glad I stayed home.  I hadn't set up disk
volumes properly in `/etc/fstab` so my disk cache was filling up the
primary disk which was at 100% usage (109 MB available) Yikes stripes!

Getting it sorted now.  Whew!!

##### 11:02 Saturday 09 September 2023 JST

Done!  I went from this:

```
root@ip-10-0-33-142:/# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  996M   12K  996M   1% /dev
tmpfs          tmpfs     201M  360K  200M   1% /run
/dev/xvda1     ext4       16G   15G  109M 100% /                 <--- yikes!
none           tmpfs     4.0K     0  4.0K   0% /sys/fs/cgroup
none           tmpfs     5.0M     0  5.0M   0% /run/lock
none           tmpfs    1001M     0 1001M   0% /run/shm
none           tmpfs     100M     0  100M   0% /run/user
/dev/xvdc      ext4      148G  101G   40G  72% /var/www/fsnet/filestore
root@ip-10-0-33-142:/#
root@ip-10-0-33-142:/# lsblk
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
xvda    202:0    0    16G  0 disk 
└─xvda1 202:1    0    16G  0 part /
xvdc    202:32   0   150G  0 disk /var/www/fsnet/filestore
xvdf    202:80   0   150G  0 disk                                <--- oops
root@ip-10-0-33-142:/#
```

To this:

```
root@ip-10-0-33-142:/# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  996M   12K  996M   1% /dev
tmpfs          tmpfs     201M  360K  200M   1% /run
/dev/xvda1     ext4       16G  2.6G   13G  18% /                 <--- whew!
none           tmpfs     4.0K     0  4.0K   0% /sys/fs/cgroup
none           tmpfs     5.0M     0  5.0M   0% /run/lock
none           tmpfs    1001M     0 1001M   0% /run/shm
none           tmpfs     100M     0  100M   0% /run/user
/dev/xvdc      ext4      148G  101G   40G  72% /var/www/fsnet/filestore
/dev/xvdf      ext4      148G   52G   90G  37% /var/www/fsnet/cache
root@ip-10-0-33-142:/# lsblk
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
xvda    202:0    0    16G  0 disk 
└─xvda1 202:1    0    16G  0 part /
xvdc    202:32   0   150G  0 disk /var/www/fsnet/filestore
xvdf    202:80   0   150G  0 disk /var/www/fsnet/cache
root@ip-10-0-33-142:/# 
```

Via

```
sudo rm -r /var/www/fsnet/cache/*
sudo mount /dev/xvdf /var/www/fsnet/cache/
```

And fixing `/etc/fstab`

```
root@ip-10-0-33-142:/# cat /etc/fstab
LABEL=cloudimg-rootfs	/	   ext4	defaults,discard	0 0
/dev/xvdc /var/www/fsnet/filestore ext4 defaults,nofail 0 0
/dev/xvdf /var/www/fsnet/cache     ext4 defaults,nofail 0 0
root@ip-10-0-33-142:/# 
```