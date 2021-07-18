---
title: "copy paste not working for password in command line"
tags: [ "annoying", "ugh", "cli", "password" ]
author: Rob Nugen
date: 2021-07-17T23:28:51+09:00
draft: false
---

I wrote this with the intention of sending it to Dreamhost Support,
but found the solution by the end.

    Before today, I had not logged in as thunderrabbit for a pretty
    long time (over a year).
    
    Earlier today, I reset thunderrabbit's password via
    https://panel.dreamhost.com/index.cgi?tree=users
    
    After a few minutes, via ssh, I logged into Canyonville using
    thunderrabbit with the password
    
    Logged in as thunderrabbit, I did not do much.  I just changed the
    permissions of directory /home/thunderrabbit/robnugen.com from 700
    to 755, so newly created domain temp.robnugen.com could serve the
    (old) content at that URL.
    
    After a couple hour break, I could not log in again as
    thunderrabbit on Canyonville, even after carefully copy-pasting
    the password.
    
    I even tried resetting the password again, have waited several
    minutes, including taking a shower and now typing this request..
    
    Why can't I log in as thunderrabbit on Canyonville?
    
    Related info:
    
    In ~/.ssh/config with the following block
    
    Host dreamhost
        HostName canyonville.dreamhost.com
        User thunderrabbit
    
    At my command line $ prompt, I type
    
    $ ssh dreamhost
    
    and it replies 
    
    Received disconnect from 64.90.48.21 port 22:2: Too many authentication failures
    Disconnected from 64.90.48.21 port 22
    
    If I add `IdentitiesOnly` to the block
    
    Host dreamhost
        HostName canyonville.dreamhost.com
        User thunderrabbit
        IdentitiesOnly yes
    
    $ ssh dreamhost
    Host key fingerprint is SHA256:49CmYCDhMILX7yP5M/N0xDXUeimpNXRrRGUlTZ+o52U
    thunderrabbit@canyonville.dreamhost.com's password: 
    Permission denied, please try again.
    thunderrabbit@canyonville.dreamhost.com's password: 
    Permission denied, please try again.
    thunderrabbit@canyonville.dreamhost.com's password: 
    thunderrabbit@canyonville.dreamhost.com: Permission denied (publickey,password).
    
    I AM able to log in to thunderrabbit via WebFTP at a URL like
    https://files.dreamhost.com/#/c/64.90.48.21/thunderrabbit/REDACTED
    
    For fun, after typing all the above, I am trying again to reset
    the password.
    
    While waiting for the new password reset, I will mention I have
    tens of users on Canyonville, and all of them have been set up
    with ssh keys.  thunderrabbit used to have an ssh key, but I lost
    access to it when I changed computers.  This is just to say I am
    99% I am doing things correctly, but just cannot understand why
    the password authentication is not working when I log in via ssh..
    
    Yeah it is still not working, and it has been 5 minutes since I
    reset the password, so I hope you can figure it out.
    
    OMG it works if I type the password and not use copy-paste buffer
    (keyboard or mouse). ugh.