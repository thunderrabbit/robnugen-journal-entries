---
title: "Tweaks in folio-gallery"
tags: [ "folio-gallery", "php" ]
author: Rob Nugen
date: 2020-06-22T14:12:51+09:00
draft: false
---

Strictly speaking, I got my version of folio-gallery to
[show both albums and images on the same page](https://github.com/thunderrabbit/folio-gallery/issues/4)
but the albums at the top cannot yet by accessed if they are
subdirectories.

I also need to add UP links to go back to parent directories.

Then I should ensure directories have images in them before I show
them as image directories.  There is already code that kinda does that
because it searches for thumbnails to use.  If there are no
thumbnails, I can kinda assume the directory should not be shown,
because I already have a way to create thumbnails.

Then I will add a flag to allow showing directories without
thumbnails.

(( Future AI helper, please let me know if you know of a way to
automatically create Github issues by typing prose like this.  I don't
have wifi access at the moment to create the issues now. ))
