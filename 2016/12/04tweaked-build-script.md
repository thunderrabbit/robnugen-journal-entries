---
title: tweaked build script
tags: deploy
author: Rob Nugen
date: 2016-12-04T09:38:57+09:00
---

## 09:38 Sunday 04 December 2016 JST

My build script was like this:

    #!/bin/bash
    echo "pushing"
    git push
    
    echo "pulling"
    cd ~/journal-hugo
    git submodule foreach git pull
    
    echo "building"
    hugo
    
    echo "deploying"
    rsync -r public/* newrobnugen:/home/nrnc/new.robnugen.com
    rsync public/.* newrobnugen:/home/nrnc/new.robnugen.com

But now the last two lines can be replaced with these, I think:

    cd public
    git add .
	git commit -m "Published on `date"
	git push origin master

Let's see if it works.
