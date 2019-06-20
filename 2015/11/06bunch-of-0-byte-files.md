---
title: bunch of 0 byte files
tags: [ "doh" ]
author: Rob Nugen
date: 2015-11-06T22:22:31+09:00
---

## 22:22 Friday 06 November 2015 JST

Email I wrote to Fred:

    I just ran a script that was supposed to create thumbnails of
    images as needed, but it created a bunch of 0 byte files in a
    bunch of directories.
    
    So I want a script which will delete 0 byte files and then a
    script which will delete empty directories.  I'll run the second
    script N times (10 should be enough) because they're not toooo
    deep.
    
    I know you're away for the weekend so I'll probably scratch it out
    myself, but I sure want your Bash brain now.  Or maybe I should
    just do it in Perl.
    
    bah.

hmm!  The first part was easy: [find . -size 0 -delete](http://stackoverflow.com/a/3157937/194309)

Hmm!  Second part was easy: [find . -type d -empty -delete](http://unix.stackexchange.com/a/46326)

