---
title: "crontab -e as root vs sudo crontab -e [solved]"
tags: [ "ab", "work", "weird", "crontab" ]
author: Rob Nugen
date: 2019-01-21T21:10:29+09:00
---

##### 21:10 Monday 21 January 2019 JST

I had a weird issue with crontab today.

If I editted the crontab while logged in as root, it did not work.

    $# whoami
    root
    $# crontab -e
       ((( make edits )))
    crontab: installing new crontab

But the changes did not work.

    $# exit
    $ whoami
    ubuntu
    sudo crontab -e
       ((( make edits )))
    crontab: installing new crontab

And the changes work just fine.

One clear difference was user ubuntu was using nano to edit, while
user root was using emacs...  But seems weird if that would make a
difference.

The same cronfile was edited both times.

Anyway, I got it working by `sudo crontab -e` instead of having root
do `crontab -e`.
