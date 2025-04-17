---
title: "Tossing old junk from AB image server"
tags: [ "junk", "clean", "code" ]
author: Rob Nugen
date: 2025-05-05T07:41:54+09:00
draft: false
---

(written 07:41 Monday 05 May 2025 ACST)

While this server is running,
I'm cleaning up the two disks represented on the last two lines.

```
ubuntu@ip-10-0-33-142:~$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  996M   12K  996M   1% /dev
tmpfs          tmpfs     201M  376K  200M   1% /run
/dev/xvda1     ext4       16G  3.4G   12G  23% /
none           tmpfs     4.0K     0  4.0K   0% /sys/fs/cgroup
none           tmpfs     5.0M     0  5.0M   0% /run/lock
none           tmpfs    1001M     0 1001M   0% /run/shm
none           tmpfs     100M     0  100M   0% /run/user
/dev/xvdc      ext4      148G  112G   30G  80% /var/www/abimages.net/files
/dev/xvdg      ext4       50G   39G  8.5G  82% /var/www/abimages.net/cache
```

The last disk was 150 GB when I started, but the cache only took up
39G so I added a new volume and copied the stuff over.  It's actually
not just a cache but a storeage space for modifications.

The other disk has lots of images that AB does not need.

With a little help from ChatGPT, I came up with this little BASH
script to help me ensure I only delete unneeded files.

```
#!/bin/bash

DELETED_CODE=""

# If after_delete is passed, remove the current first set before generating
if [ "$1" == "after_delete" ]; then
    DELETED_CODE=$(basename "$(find /var/www/abimages.net/files/image/??/ -type d | head -n 1)")

    if [ -n "$DELETED_CODE" ]; then
        echo "Deleting previously reviewed code: $DELETED_CODE"
        sudo rm -rf "/var/www/abimages.net/files/image/$DELETED_CODE/"
        sudo rm -rf "/var/www/abimages.net/cache/image/$DELETED_CODE/"
    else
        echo "No directories found to delete."
        exit 1
    fi
fi

# Detect the new current directory
CODE=$(basename "$(find /var/www/abimages.net/files/image/??/ -type d | head -n 1)")
BASE="/var/www/abimages.net/files/image/$CODE"
CDN="https://rediddlyacted.cloudfront.net"

if [ ! -d "$BASE" ]; then
    echo "No valid image directory found."
    exit 1
fi

# Generate the HTML output
{
    echo "<!DOCTYPE html>"
    echo "<html><head><meta charset=\"UTF-8\"><title>Images</title></head><body>"

    find "$BASE" -type f -name "*.jpg" | while read -r file; do
        rel_path="${file#/var/www/abimages.net/files/image/}"
        img_name=$(echo "$rel_path" | sed 's|/image.jpg$||' | tr -d '/')
        echo "<img src=\"$CDN/${img_name}.jpg\" />"
    done

    echo "</body></html>"
} > /var/www/b.abimages.net/current/wwwroot/images.html

echo "Next reviewable code: $CODE"
echo "    sudo rm -rf /var/www/abimages.net/files/image/$CODE/"
echo "    sudo rm -rf /var/www/abimages.net/cache/image/$CODE/"
```

The spaces before the lower two `sudo` lines ensure they don't clog up
the `history` because basically by definition, I will only use them
once.  Plus then I can just up-arrow a single time to get back to the
command that runs this script.
