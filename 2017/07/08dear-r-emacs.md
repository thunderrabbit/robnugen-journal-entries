---
title: dear /r/emacs
tags: [ "emacs", "" ]
author: Rob Nugen
date: 2017-07-08T14:23:30+09:00
---

## 14:23 Saturday 08 July 2017 JST

Dear /r/emacs

I use Emacs to prepare text files that will be processed by a static site generator (Hugo).

The YAML topmatter can include multiple tags, so I would like the option of entering more tags into my file preparation function.

My functions ask me for Title, Tag, and date..  then produce output like this:

    ---
    title: reddit emacs
    tags: [ "emacs", "" ]
    author: Rob Nugen
    date: 2017-07-08T14:23:30+09:00
    ---
    
    ## 14:23 Saturday 08 July 2017 JST

I would like emacs to keep asking me for tags so it could produce output like this, for example:

    ---
    title: reddit emacs
    tags: [ "emacs", "programming", "tag3", "tag4" ]
    author: Rob Nugen
    date: 2017-07-08T14:23:30+09:00
    ---
    
    ## 14:23 Saturday 08 July 2017 JST


The full code I have so far is here https://gist.github.com/thunderrabbit/b6a3d157fd4a916d23bea75f1d10b58f

You can just save it as `~/.emacs` or load it within your `.emacs` file with

    (find-file "~/path/to/file")

The relevant code is here:

    (interactive (list
                  (read-string "Title: ")
                  (read-string "Tag: ")
            )
          )

How can I have emacs keep asking for tags until I enter an empty tag?

