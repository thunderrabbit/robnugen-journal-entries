---
title: "Lemur task blocked on shutdown for 966 seconds and counting"
tags: [ "laptop", "lemur" ]
author: Rob Nugen
date: 2023-03-27T08:13:42+09:00
draft: false
---

#### 08:13 Monday 27 March 2023 JST

I just sent this and logs to System76 support:

    command `htop` showed:
    
    * Memory was filled (39GB ?)
    * Swap space was filled (4 GB).
    * many /usr/bin/gnome-(something) using 16 MB each
    
    There were also many Zoom processes .. but all those meetings
    ended and I Quit Zoom from the app and Exit from the toolbar (top
    of screen)
    
    I have used both Pop Store and CLI `sudo apt install` to install
    packages I need.
    
    My attention is generally on Firefox, Zoom, Atom, Terminal, git,
    Vagrant, Emacs
    
    Available disk space was low so I reconnected an old 4TB drive and
    Duplicity automatically ran.  I left it overnight and it seemed to
    complete cleanly.
    
    I manually moved contents of my ~/Downloads folder to external
    drive and deleted from ~/Downloads the larger files.
    
    I decided to restart (with the intention to increase Swap space
    from 4GB to 10GB (not done yet)).
    
    The shutdown process hung for 966 seconds and counting, so I
    power-cycled the machine by pressing power button about 10 seconds
    to turn off and then a second to turn on.
    
    The machine came back up readily after decrypting disk drive and
    logging in as `thunderrabbit`, my normal (admin) user
    
    I saw the reminder that I still haven't upgraded to Pop!OS 22, so
    I clicked download to do that.
    
    That process hung saying something about packages.  (recall I use
    Pop! Shop and `sudo apt install` inconsistently)
    
    After submitting this description, I plan to attach the logs
    created by System76 Driver and the output of commands for cleaning
    up `apt`
