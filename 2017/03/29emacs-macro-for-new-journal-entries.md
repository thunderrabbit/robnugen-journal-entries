---
title: Emacs macro for new journal entries
tags: [ "emacs" ]
author: Rob Nugen
date: 2017-03-29T20:11:37+09:00
---

## 20:11 Wednesday 29 March 2017 JST

Since switching my journal to use Hugo, I wrote a little macro to help
me start new entries.  I type `C-c j` to create a new `j`ournal
entry.  It prompts me for a title, a tag, year, month, and date,
filling in the last three with today's defaults.

It creates a file, then inserts a YAML block at the top of the file,
writes the current date a couple lines below that and I'm ready to
type.

There's one change that I have often wanted, but don't want enough to
spend the time to figure it out.  How to let me type multiple tags.

Right now, this entry has YAML like this:

    title: Emacs macro for new journal entries
tags: [ "emacs" ]
    author: Rob Nugen
    date: 2017-03-29T20:11:37+09:00

I tried just comma-separating the tags, but (iirc,) they need to be
hyphen-prefixed and newline-separated.  I think something like this
will work:

    title: Emacs macro for new journal entries
    tags:
      - emacs
	  - meta
	  - journal
    author: Rob Nugen
    date: 2017-03-29T20:11:37+09:00

To create this as a user, I'd like to be prompted with `Tag:`
repeatedly until I enter an empty tag.

I am not asking my non-emacs-using reader *per se*, but just
articulating this so I can clarify for someone who can do it easily.

