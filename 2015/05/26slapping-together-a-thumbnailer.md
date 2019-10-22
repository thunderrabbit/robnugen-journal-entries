---
title: slapping together a thumbnailer
tags: [ "images", "b.robnugen.com" ]
author: Rob Nugen
date: 2015-05-26T21:37:12+09:00
---

## 21:37 Tuesday 26 May 2015 JST

I've been writing some scripts to simplify publishing to my website.
Here on local computer I've got a script called
`build-journal-and-stuff.sh`, which basically pushes changes from my
local journal repo to the origin repo (for backup purposes), then
switches to my local Middleman repo's submodule for my journal, pulls
the entries from origin and then goes back to Middleman's root and
builds the site.

Today on b.robnugen.com, I've been creating a Perl script to spin
through all the image directories and create thumbnails if they don't
exist.  So far I've got it to skip the check for thumbnail
directories, and determine if the thumbnail exists for all images in
the main directories.

PerlMagick is installed on the server and it looks like it'll be
pretty easy to load the images and create thumbnails.  I might even
get it done tonight.

The next plan is to create indicies in each directory which will make
"normal" pages of thumbnails as commonly exist on image galleries.
I'm sure there must be software that does this, and I'm sure I've
loaded such software on robnugen.com, so I might look at that first.

There's a 1% chance I'll figure out how to do it with a static site
generator, a 19% chance I'll do it with a pre-made thingabobble, and
80% chance I'll hack some shit together which will work for a while
but not have nice connections between the pages, have no way to search
by tags / date / keywords and generally be crappy.

Hmm.. maybe I should rethink my percentages.

## 23:29

[Sigal](https://sigal.readthedocs.org/en/latest/) looks reasonable.

[LazyGal](https://sousmonlit.zincube.net/~niol/playa/oss/projects/lazygal/)
looks good.

[gthumb](https://wiki.gnome.org/Apps/gthumb) looks promising.

## 2:41am Wednesday 27 May 2015

bah.  couldn't get any of them to work, partially because I'm tired,
and primarily cause I don't have root access on this server.
