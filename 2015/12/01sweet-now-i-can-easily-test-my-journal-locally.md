---
title: Sweet now I can easily test my journal (text) locally
tags: sweet
author: Rob Nugen
date: 2015-12-01T08:43:17+09:00
---

## 08:43 Tuesday 01 December 2015 JST

```
   #!/bin/bash
   cd ~/journal-hugo-local
   
   open http://localhost:1313/
   
   echo "building"
   hugo server --watch
   
   echo "coming back"
   cd ~/journal
   echo "back jack"
```

The browser is
[opened using the `open` command](http://osxdaily.com/2011/07/18/open-url-default-web-browser-command-line/)
and shows a failure for a few seconds until I reload it after Hugo builds the site at
lightning speed.  After that, any changes I make a quickly refelcted
on the localhost webpage.

Hmm but [I can't yet see my images locally](https://discuss.gohugo.io/t/equivalent-to-htaccess-rewrite-on-localhost/2188)
