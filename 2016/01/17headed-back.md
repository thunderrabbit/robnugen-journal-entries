---
title: headed back
tags: journal
author: Rob Nugen
date: 2016-01-17T11:34:27+09:00
---

## 11:34 Sunday 17 January 2016 JST

My goal for this train ride is to create a macro that will insert a
new timestamp if I keypress C-c 3.  I was going to do C-c #; maybe
I'll do both.

## 12:14

failed.  I thought this

    (defun markdown-timestamp-full ()
      "Insert timestamp in markdown format.  NOT"
      (insert
         (format-time-string "## %H:%M %A %d %B %Y %Z")
         )
      )

plus this

    (global-set-key (kbd "C-c #") 'markdown-timestamp-full)

Would do it, but I get `Wrong type argument: commandp, markdown-timestamp-full`
