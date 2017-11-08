---
title: "Hugo journal entries with Emacs"
tags: [ "emacs", "journal", "quotes", "hugo", "" ]
author: Rob Nugen
date: 2017-11-08T13:42:06+09:00
---

## 13:42 Wednesday 08 November 2017 JST

To kick off this little journal entry, I type C-c j and then enter the
title, as many tags as I like, then hit enter a few times to confirm
the date, and get the following YAML meta data for the entry:

    ---
    title: "Hugo journal entries with Emacs"
    tags: [ "emacs", "journal", "quotes", "hugo", "" ]
    author: Rob Nugen
    date: 2017-11-08T13:42:06+09:00
    ---
    
    ## 13:42 Wednesday 08 November 2017 JST

Today I modified my code to add quotes around the title (so my Marble
Track 3 entries can have titles including colons: "mt3: started last
track"

And, I modified my Japanese journal entries to make the filename be
English, but the title be Japanese.  That was done just by hardcoding
the filename, but for now I am fine with that.  Just don't tell
Travis.

Code for `~/.emacs.d/personal/hakyll/hakyll.el`is here
https://gist.github.com/thunderrabbit/453c1e1c4a959f113d10#file-hakyll-el
and here:

    ;;; journal.el --- Convenience functions for working with journal.
    ;;
    ;;; Commentary:      
    ;; Convenience functions for working with journal.
    
    ;;; Code:
    
    (defvar journal-site-location "~/journal/"
      "The location of the journal files.")
    
    (defun journal-insert-image (alt-text)
      "Insert an image from /images/yyyy/mm to current buffer /posts/yyyy/mm/dd/....md"
      (interactive "sAltText: ")
      (let ((yyyymm (substring buffer-file-name 35 42)))
        (insert
         (format "![%s](/images/%s/thumbs/"
    	     alt-text
    	     yyyymm
    	     ))
        )
      )
    
    (fset 'ruby-tag-create-region
       "\C-w<ruby><rb>\C-y</rb><rt></rt></ruby>")
    
    (defun journal-new-dream-post (title tags yyyy mm dd)
      "Create a new journal post for today with TITLE and TAGS."
      (interactive (list
    		(read-string (format "Title: (%s):" "Dream") nil nil "Dream") 
    		(read-string (format "Tags: (%s):" "dream") nil nil "dream")
                    (read-string (format "Year (%s): " (format-time-string "%Y")) nil nil (format-time-string "%Y"))
                    (read-string (format "Month (%s): " (format-time-string "%m")) nil nil (format-time-string "%m"))
                    (read-string (format "Date (%s): " (format-time-string "%d")) nil nil (format-time-string "%d"))
    		)
    	       )
      (let (
    	(file-name (journal-post-title dd title))
    	(file-path (journal-post-path title yyyy mm dd))
    	)
        (set-buffer (get-buffer-create file-path))
        (insert
         (format "---\ntitle: \"%s\"\ntags: %s\nauthor: Rob Nugen\ndate: %s-%s-%sT%s\n---\n\n%s\n\n"
                 title
    	     (downcase tags)
    	     yyyy
    	     mm
    	     dd
    	     (format-time-string "%H:%M:%S+09:00")
    	     (format-time-string "## %H:%M %A %d %B %Y %Z")
    	     ))
        (write-file
         (expand-file-name file-path (concat journal-site-location "")))
        (switch-to-buffer file-name)
        (auto-fill-mode)
      )
    )
    
    (defun journal-new-japanese-post (title tags yyyy mm dd)
      "Create a new journal post for today with TITLE and TAGS."
      (interactive (list
    		(read-string (format "Title: (%s):" "日本語を勉強しました") nil nil "日本語を勉強しました")
    		(read-string (format "Tags: (%s):" "日本語") nil nil "日本語")
                    (read-string (format "Year (%s): " (format-time-string "%Y")) nil nil (format-time-string "%Y"))
                    (read-string (format "Month (%s): " (format-time-string "%m")) nil nil (format-time-string "%m"))
                    (read-string (format "Date (%s): " (format-time-string "%d")) nil nil (format-time-string "%d"))
    		)
    	       )
      (let (
    	(file-name (journal-post-title dd "studied japanese"))
    	(file-path (journal-post-path "studied japanese" yyyy mm dd))
    	)
        (set-buffer (get-buffer-create file-path))
        (insert
         (format "---\ntitle: \"%s\"\ntags: %s\nauthor: Rob Nugen\ndate: %s-%s-%sT%s\n---\n\n%s\n\n### There are probably errors in the Japanese notes below!\n\n"
                 title
    	     (downcase tags)
    	     yyyy
    	     mm
    	     dd
    	     (format-time-string "%H:%M:%S+09:00")
    	     (format-time-string "## %H:%M %A %d %B %Y %Z")
    	     ))
        (write-file
         (expand-file-name file-path (concat journal-site-location "")))
        (switch-to-buffer file-name)
        (auto-fill-mode)
      )
    )
    
    (defun journal-new-post (title tags yyyy mm dd)
      "Create a new journal post for today with TITLE and TAG."
      (interactive (list
                    (read-string "Title: ")
                    (journal-read-tags)
                    (read-string (format "Year (%s): " (format-time-string "%Y")) nil nil (format-time-string "%Y"))
                    (read-string (format "Month (%s): " (format-time-string "%m")) nil nil (format-time-string "%m"))
                    (read-string (format "Date (%s): " (format-time-string "%d")) nil nil (format-time-string "%d"))
                    )
                   )
      (let (
            (file-name (journal-post-title dd title))
            (file-path (journal-post-path title yyyy mm dd))
            )
        (set-buffer (get-buffer-create file-path))
        (insert
         (format "---\ntitle: \"%s\"\ntags: [ %s, \"\" ]\nauthor: Rob Nugen\ndate: %s-%s-%sT%s\n---\n\n%s\n\n"
                 title
                 (mapconcat (lambda (x) (format "\"%s\"" (downcase x)))
                       tags ", ")
                 yyyy
                 mm
                 dd
                 (format-time-string "%H:%M:%S+09:00")
                 (format-time-string "## %H:%M %A %d %B %Y %Z")
                 ))
        (write-file
         (expand-file-name file-path (concat journal-site-location "")))
        (switch-to-buffer file-name)
        (auto-fill-mode)
      )
    )
    
    (defun my-test (title tags)
       (interactive (list (read-string "Title: ") (journal-read-tags)))
       (message "%s: %s" title
    
    (mapconcat (lambda (x) (format "'%s'" x))
               tags ", ")
    
                ))
    
    (defun journal-read-tags ()
      (let (tags tag done)
        (while (not done)
          (setq tag (read-string "Tag: "))
          (if (= (length tag) 0)
              (setq done t)
            (push tag tags)))
        (nreverse tags)))
    
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
    
    (defun journal-new-note (title)
      "Create a new Note with TITLE."
      (interactive "sTitle: ")
      (let ((file-name (journal-note-title title)))
        (set-buffer (get-buffer-create file-name))
        (insert (format "---\ntitle: %s\ndescription: \n---\n\n" title))
        (write-file
         (expand-file-name file-name (concat journal-site-location "notes")))
        (switch-to-buffer file-path)))
    
    (defun journal-post-title (dd title)
      "Return a file name based on TITLE for the post."
      (concat dd
       (url-safe-string title)
       ".md"))
    
    (defun journal-post-path (title yyyy mm dd)
      "Return a file path based on TITLE and date."
      (concat
       yyyy "/" mm "/" dd
       (url-safe-string title)
       ".md"))
    
    (defun journal-note-title (title)
      "Return a file name based on TITLE for the note."
      (concat
       (url-safe-string title)
       ".md"))
    
    (defun url-safe-string (title)
      "Return a URL-safe title based on TITLE."
      (replace-regexp-in-string "[:!']" ""
        (replace-regexp-in-string " " "-" (downcase title))
        )
      )
    
    
    (provide 'journal)
    ;;; hakyll.el ends here

