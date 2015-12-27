---
title: Finally figured out how I want tags to be entered
tags: journal, tags
author: Rob Nugen
date: 2015-12-27T12:45:54+09:00
---

## 12:45 Sunday 27 December 2015 JST

Right now I enter tags comma separated on a single line.  They are
written as typed in the ... whatsitcalled (frontmatter?).. the text at
the top of each file, which in the case of this file, looks like this:

    ---
    title: Finally figured out how I want tags to be entered
    tags: journal, tags
    author: Rob Nugen
    date: 2015-12-27T12:45:54+09:00
    ---

There's a problem with this inasmuch as it doesn't conform to the
standard for writing tags, which would be something like this:

    ---
    title: Finally figured out how I want tags to be entered
    tags:
	   journal
	   tags
    author: Rob Nugen
    date: 2015-12-27T12:45:54+09:00
    ---

That may not be it either, but the YAML(?) standard is some variety of
having each tag separated by things including a newline, instead of a
comma.  That way it's easier to include commas and spaces in tags.

So anyway, each time I create a journal entry (in lovely Emacs, whose
macros I haven't translated for use in Sublimetext 2), I type `C-c j`
and enter the title, tags, year, month, day at separate prompts.  The
date fields are given defaults of today's date.  For dreams (`C-c d`),
the title and tags are pre-populated to 'Dream' and 'dream'
respectively.  (And for Japanese entries (remember those??) (`C-c n`),
the title and tags have defaults as well.)

Anyway, anyway, instead of entering a comma separated list of tags, I
want to end each tag with a carriage return as I enter them; the
prompts will keep asking for them as long as something is entered.

Some kind of recursive thing... if only LISP could do recursion!
(haha)

I'm writing this without net access, or I'd try to look it up now.
Something like
[emacs recursive input parameters](https://encrypted.google.com/search?hl=en&source=hp&q=emacs+recursive+input+parameters).
