---
title: Updated hakyll.el
tags: emacs
author: Rob Nugen
date: 2015-02-12T20:49:00+09:00
---

##20:49 Thursday 12 February 2015 JST##

Though I'm no longer exclusively considering Hakyll, my emacs
extension is still called `hakyll.el`.  I've just tweaked it to add
the time to the `date:` field in the frontmatter, and set
`auto-fill-mode` for the buffer:

```
;;; hakyll.el --- Convenience functions for working with Hakyll.
;;
;;; Commentary:      
;; Convenience functions for working with Hakyll.

;;; Code:

(defvar hakyll-site-location "~/journal/"
  "The location of the Hakyll files.")

(defun hakyll-insert-image (alt-text)
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

(defun hakyll-new-post (title tags yyyy mm dd)
  "Create a new Hakyll post for today with TITLE and TAGS."
  (interactive (list
		(read-string "Title: ")
		(read-string "Tags: ")
                (read-string (format "Year (%s): " (format-time-string "%Y")) nil nil (format-time-string "%Y"))
                (read-string (format "Month (%s): " (format-time-string "%m")) nil nil (format-time-string "%m"))
                (read-string (format "Date (%s): " (format-time-string "%d")) nil nil (format-time-string "%d"))
		)
	       )
  (let (
	(file-name (hakyll-post-title title))
	(file-path (hakyll-post-path title yyyy mm dd))
	)
    (set-buffer (get-buffer-create file-path))
    (insert
     (format "---\ntitle: %s\ntags: %s\nauthor: Rob Nugen\ndate: %s-%s-%s %s\n---\n\n%s\n\n"
             title
	     (downcase tags)
	     yyyy
	     mm
	     dd
	     (format-time-string "%H:%M JST")
	     (format-time-string "##%H:%M %A %d %B %Y %Z##")
	     ))
    (write-file
     (expand-file-name file-path (concat hakyll-site-location "posts")))
    (switch-to-buffer file-name)
    (auto-fill-mode)
    ))

(defun hakyll-new-note (title)
  "Create a new Note with TITLE."
  (interactive "sTitle: ")
  (let ((file-name (hakyll-note-title title)))
    (set-buffer (get-buffer-create file-name))
    (insert (format "---\ntitle: %s\ndescription: \n---\n\n" title))
    (write-file
     (expand-file-name file-name (concat hakyll-site-location "notes")))
    (switch-to-buffer file-name)))

(defun hakyll-post-title (title)
  "Return a file name based on TITLE for the post."
  (concat
   (url-safe-string title)
   ".md"))

(defun hakyll-post-path (title yyyy mm dd)
  "Return a file path based on TITLE and date."
  (concat
   yyyy "/" mm "/" dd "/"
   (url-safe-string title)
   ".md"))

(defun hakyll-note-title (title)
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


(provide 'hakyll)
;;; hakyll.el ends here

```
