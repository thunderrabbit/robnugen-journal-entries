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

## 18:46 Saturday 08 July 2017 JST

Thank you /u/wasamasa!  https://www.reddit.com/r/emacs/comments/6lzpre/use_interactive_list_readstring_to_read_arbitrary/djxuzst/

Easy, write a helper function that constructs such a list:

    (defun my-read-tags ()
      (let (tags tag done)
        (while (not done)
          (setq tag (read-string "Tag: "))
          (if (string-empty-p tag)
              (setq done t)
            (push tag tags)))
        (nreverse tags)))

You can then use it in your command:

    (defun my-test (title tags)
      (interactive (list (read-string "Title: ") (my-read-tags)))
      (message "%s: %s" title tags))

## 20:55 Saturday 08 July 2017 JST

Nice.

I tweaked the code a bit and now I have multiple tags per journal entry.
