---
title: 'Now I can update my site without my computer'
author: 'Rob Nugen'
date: '2021-02-22T08:15:48+09:00'
---

To update my site on Netlify required a git commit to trigger builds.

Yesterday I put the minimum viable touches on my Quill and Micropub setup which I believe will now let me not just write journal entries from my phone, but to trigger a site rebuild without doing a git commit.

I can put files on my server and call an update via a POST request, all done with OAuth(entication).

This will let me update my site close to realtime without having to keep track of which word to use in the story I have been writing backwards in the commit messages of my journal entries.

I *also* have the option to not update the site.  Actually the default in my Quill setup is to not build it.  Even using the super speedy Hugo, my site takes about a minute to build with its tens of thousands of pages, mostly my journal, going back to the stone age of The Internet.
