---
title: Journal entry repo
tags: static, site, journal
author: Rob Nugen
date: 2015-02-14 18:22 JST
---

##18:22 Saturday 14 February 2015 JST##

For years, I have been writing my journal entries in directories based
on the date.  Originally in YYYY/MM directories, and now
(temporarily?) in YYYY/MM/DD directories.

So while recently trying to consolidate all my journal entries, I've
wanted to maintain that directory structure, lest I have several
thousand(?)  files in one directory.

Travis got me started on Hakyll, but I'm too lazy and he's too busy to
update the Haskell source with cool bells and whistles.

I started looking at Pelican, but it choked on all the entries, which
start with `---` as the first line.  Hmm lemme do a quick search.

Okay I found
[Add yaml Reader](https://github.com/getpelican/pelican/issues/607)
and
[YAML importer for Emacs org-mode posts](https://github.com/getpelican/pelican-plugins/pull/29),
so maybe it's easily possible.

Now I'm looking at Middleman, and I liked Hexo, but [blah blah blah](/journal/2015/02/12/middleman-and-hexo.md)(*)..

but in ANY case, I still have found a big annoyance with implementing
any of these static site genrators: my journal entries are the biggest
part of the repo!

SO, I've made a separate repo which just has my journal entries, in
YYYY/MM(/DD) directories.

But still, even this solution has the fatal flaw of a shload of broken
links, especially to /images directory.

(*) I've used the link "/journal/2015/02/12/middleman-and-hexo.md" but
I'm thinking now of switching to
/journal/2015/02/12middleman-and-hexo.md because its easier for me to
find....  ohhhhh I know.  I'll tell the static site generator to use
/journal/2015/02/12/middleman-and-hexo but the file will be at
/journal/2015/02/12middleman-and-hexo.md so I can find the entries a
bit more easily in my file folders.

In one month I have between 0 and maybe 100 entries, so that's fine to
have them all in one directory.  But if I add the extra DD directory,
it's harder for me to find the files because I'm 30 times less likely
to remember the date something happened than I am the month it
happened.

Now I've got to roll through all the directories and fix the filenames.
