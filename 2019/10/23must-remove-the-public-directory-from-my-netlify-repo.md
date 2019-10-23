---
title: "Must remove the public directory from my Netlify repo"
tags: [ "netlify", "public", "oops" ]
author: Rob Nugen
date: 2019-10-23T17:51:14+09:00
---

Ahh I wonder if this is what caused Netlify to crash on a date.  I was
getting an error like

    5:33:39 PM: Error: Error building site: failed to render pages: open /opt/build/repo/public/blog/2019/10/02/how-to-prepare-for-a-bigger-than-normal-event/index.html: not a directory

searchable phrase is probably "index.html: not a directory"

The problem, I think, was that my public/ directory was in the git
repo.  I have just removed it and hope that fixes Netlify.

##### 18:21

Yep.  Fixed.
