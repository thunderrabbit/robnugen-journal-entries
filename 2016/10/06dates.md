---
title: dates
tags: []
author: Rob Nugen
date: 2016-10-06T21:08:04+09:00
---

## 21:08 Thursday 06 October 2016 JST

Sweet.  Now I can add dates as above or timestamps as below.

## 21:08

See?

## 21:08 Thursday 06 October 2016 JST
## 21:08
## 21:08 Thursday 06 October 2016 JST
## 21:08 Thursday 06 October 2016 JST
## 21:08
## 21:08
## 21:08 Thursday 06 October 2016 JST
## 21:08 Thursday 06 October 2016 JST
## 21:08
## 21:08 Thursday 06 October 2016 JST

    ;;;  http://stackoverflow.com/a/251922
    
    
    (defvar current-date-time-format "## %H:%M %A %d %B %Y %Z"
      "Format of date to insert with `insert-current-date-time' func
    See help of `format-time-string' for possible replacements")
    
    (defvar current-time-format "## %H:%M"
      "Format of date to insert with `insert-current-time' func.
    Note the weekly scope of the command's precision.")
    
    
    (defun markdown-timestamp-full ()
      "Insert the current date and time into current buffer.  Uses `current-date-time-format' for the formatting the date/time."
           (interactive)
           (insert (format-time-string current-date-time-format (current-time)))
           (insert "\n")
           )
    
    (defun markdown-timestamp-short ()
      "Insert the current time (1-week scope) into the current buffer."
           (interactive)
           (insert (format-time-string current-time-format (current-time)))
           (insert "\n")
      )

    (global-set-key (kbd "C-c t") 'markdown-timestamp-short)
    (global-set-key (kbd "C-c T") 'markdown-timestamp-full)

From
http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs

