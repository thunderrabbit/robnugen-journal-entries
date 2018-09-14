---
title: "fixed my site"
tags: [ "site", "git", "oops" ]
author: Rob Nugen
date: 2018-09-14T16:12:02+09:00
---

##### 16:12 Friday 14 September 2018 JST

I broke my upload process, but I think it is fixed now.

Yep.  It took 65 seconds to process and upload to my server, but it
works.

When trying to get that number down, to a few seconds, I
mis-remembered how it was set up and destroyed the `public/` directory
of my Hugo-controlled site thinking Hugo can rebuild it, but since the
Hugo directory is already a Git repo, it was conflating the two, and
things got really confuzzed.  Including my brain.

I am considering removing dates from the content itself and just keep
them in the frontmatter.

What if I make them small like this:

##### 16:19 Friday 14 September 2018 JST

I<del> guess i</del>t will be an h5 tag, cause I put five # marks in front.
