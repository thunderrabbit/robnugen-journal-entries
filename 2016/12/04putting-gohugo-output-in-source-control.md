---
title: putting gohugo output in source control
tags: deploy
author: Rob Nugen
date: 2016-12-04T09:01:01+09:00
---

## 09:01 Sunday 04 December 2016 JST

I think this is the short version of what I ended up doing:

On server:

    cd /var/www/public
    git init
	git add .
	git commit -m "website now in version control"
	git config receive.denyCurrentBranch updateInstead

On local:

    cd ~/gohugo/
    rm -rf public/
	git clone remote:/var/www/public public

Rebuild site with Hugo

    cd public
    git add .
	git commit -m "Changes from local"
    git push origin master

