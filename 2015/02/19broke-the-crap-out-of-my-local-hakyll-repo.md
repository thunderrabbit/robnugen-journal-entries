---
title: Broke the crap out of my local hakyll repo
tags: git
author: Rob Nugen
date: 2015-02-19T17:36:00+09:00
---

##17:36 Thursday 19 February 2015 JST##

Oops.

I thought it would be a good idea to hardcode my directory into my
Hakyll binary, so now, until I remember how to build the Hakyll
binary, I have to have it work from the ~/journal directory.  However,
I now want my ~/journal directory to be my new repo consisting of only
journal entries.

I moved the Hakyll version of ~/journal to ~/journal-hakyll and moved
my real journal to ~/journal, then added ~/journal as a subrepository
of the Hakyll journal in ~/hakyll-journal.

That required some gymnastics each time I wanted to test the repo.  To
test the Hakyll journal, I had to swap the directory names back and
then do the test.  But to import any changes from the new journal repo
into the Hakyll journal, I had to re-swap the names to their new
configuration.

Bah, so I manually replaced "journal" with "journal-real" in
~/journal/.gitmodules then did a pull to get the latest changes.

Kablam!  git pulled *itself* as its submodule and my repo got hosed
beyond what I could untangle without access to internizzle.
