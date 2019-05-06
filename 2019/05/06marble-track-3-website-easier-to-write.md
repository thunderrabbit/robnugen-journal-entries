---
title: "Marble Track 3 website easier to write"
tags: [ "mt3.com", "mt3", "atom" ]
author: Rob Nugen
date: 2019-05-06T08:57:55+09:00
---

##### 08:57 Monday 06 May 2019 JST

[Atom](https://atom.io/) editor has a way to write my own autocomplete
rules.  I don't have a link handy, but it is handy for making links.

So I have a two part approach:

1. create a file with Emacs by entering a Title (part name), Shortcode, Image,
   Tag(s), and date.   Emacs creates the new file as part_name.md
   *and* now appends to the Atom file `~/.atom/snippets.cson` the
   information necessary to let Atom auto complete the markdown after
   I type the shortcode.
2. use Atom to edit the file and easily insert markdown via
   autocompletion.  Yay!

Here is the most recent addition to `snippets.cson`

```
      'Lower Zig Zag 3 ban Upper Base Base':
        'prefix': 'lzz3bubb'
        'body': '[Lower Zig Zag 3 ban Upper Base Base](/parts/lower-zig-zag-3-ban-upper-base-base/)'
```

With this, I can type `lzz3bubb RET` to get Atom to write

    [Lower Zig Zag 3 ban Upper Base Base](/parts/lower-zig-zag-3-ban-upper-base-base/)

Awesome.

I am headed to men's group to lead workshops all day so will probably
forget to show the code, but there is code on github.

Emacs function to create file and autocomplete
`[mt3-new-part](https://github.com/thunderrabbit/emacs-hugo-posts/blob/master/hugo.el#L219)`

```lisp

(defun mt3-new-part (title shortcode tags image yyyy mm dd)
  "Create a new track part for Marble Track 3 .com with TITLE, TAGs, and shortcode."
  (interactive
    (list
      (read-string "Title: ")
      (read-string "Shortcode: ")
      (journal-read-tags nil)
      (read-string "Image: " nil nil "/img/guest/default-guest.png")
      (read-string (format "Year (%s): " (format-time-string "%Y")) nil nil (format-time-string "%Y"))
      (read-string (format "Month (%s): " (format-time-string "%m")) nil nil (format-time-string "%m"))
      (read-string (format "Date (%s): " (format-time-string "%d")) nil nil (format-time-string "%d"))
    )
  )
  (let (
        (file-name (journal-post-title dd title))
        (file-path (journal-no-date-path title))
        )
    (switch-to-buffer (find-file-noselect location-atom-snippets))
    (end-of-buffer)
         (insert
          (format
          (get-string-from-file (expand-file-name "snippet_part.txt" location-journal-template-files))
           title
     	     shortcode
           title
     	     (file-name-sans-extension file-path)  ;; https://stackoverflow.com/a/8716106/194309
     	     ))
	 (save-buffer)
	 (kill-buffer)
    (set-buffer (get-buffer-create file-path))
    (insert
      (format
         (get-string-from-file (expand-file-name "mt3_parts_template.txt" location-journal-template-files))
         title
         (mapconcat (lambda (x) (format "\"%s\"" (downcase x)))	tags ", ")
         image
         (thumbnail-path image)
         title
         shortcode
         yyyy
         mm
         dd
         (format-time-string "%H:%M:%S+09:00")
         (format-time-string "%Y %b %d ")
      )
    )
    (write-file (expand-file-name file-path (concat mt3-site-location "parts")))
    (switch-to-buffer file-path)
    (auto-fill-mode)
  )
)
```

