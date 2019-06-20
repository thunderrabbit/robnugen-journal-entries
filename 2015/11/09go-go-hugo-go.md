---
title: Go go Hugo Go!
tags: [ "hugo" ]
author: Rob Nugen
date: 2015-11-09T02:47:48+09:00
---

## 02:47 Monday 09 November 2015 JST

Oh my goodness Hugo is way faster than Middleman.

Here's my script which I run from my `~/journal` directory to put most
recent entries online:

    #!/bin/bash
    echo "pushing"
    git push
    
    echo "yayer"
    cd ~/journal-hugo
    git submodule foreach git pull origin master
    
    echo "building"
    hugo
    
    echo "deploying"
    rsync -r public/* newrobnugen:/home/newrob/new.robnugen.com
    
    echo "coming back"
    cd ~/journal
    echo "back jack"

Thanks to http://fredrikloch.me/post/automatic_hugo_deploy/ for the
rsync line.
