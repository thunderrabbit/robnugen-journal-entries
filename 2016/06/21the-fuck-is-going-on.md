---
title: the fuck is going on
tags: [ "hmm" ]
author: Rob Nugen
date: 2016-06-21T18:16:16+09:00
---

## 18:16 Tuesday 21 June 2016 JST

Weird shit.  My virtualbox won't open any of the virtual boxes,
including the one I just shut down to figure out what's going on.

Now when I tried to push my journal to bitbucket I get a weird error:

    $ git push
    No user exists for uid 502
    fatal: Could not read from remote repository.
    
    Please make sure you have the correct access rights
    and the repository exists.
    $

Same error when I simply try to rsync:

    $ rsync -r public/* newrobnugen:/home/nrnc/new.robnugen.com
    No user exists for uid 502
    rsync: connection unexpectedly closed (0 bytes received so far) [sender]
    rsync error: error in rsync protocol data stream (code 12) at /BuildRoot/Library/Caches/com.apple.xbs/Sources/rsync/rsync-47/rsync/io.c(453) [sender=2.6.9]

Solution: [Three finger salute](http://apple.stackexchange.com/questions/43940/when-i-open-terminal-i-get-an-i-have-no-name-prompt)
