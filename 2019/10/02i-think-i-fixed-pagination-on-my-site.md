---
title: "I think I fixed pagination on my site"
tags: [ "pagination", "hugo" ]
author: Rob Nugen
date: 2019-10-02T14:13:45+09:00
---

(written 14:13 Wednesday 02 October 2019 JST)

Well it has taken longer than I wanted, but I learned that I can get
lots of code samples by searching GitHub.  For some reason dredging
through the documentation did not work for me.  It's like there's tons
of pieces and various similar words and my little brain is like
ummmmmmmmmmmmm

but digging through Github like
https://github.com/search?p=6&q=where+site.RegularPages+%22Type%22+%22in%22+.Site.Params.mainSections&type=Code

or
https://github.com/search?q=paginator+Paginate+internal+pagination&type=Code

and boom lots of examples and I got it sorted in less than an hour.

Compared to days and days and weeks omg I would say that is worth
doing first next time.

HOPPEEEFFFUllYyyy I can get my site up before I leave for the US.

ps thanks to this page for cracking it open for me.

https://github.com/sizucca/sizucca.com/blob/ab66fae0008761e890460d482dea0f1e9b238c1e/themes/blog-theme/layouts/index.html

Using $paginator instead of $pages as the variable name helped a lot.
I guess Hugo looks for that variable by default in the pagination
bits.

##### 13:02 Thursday 03 October 2019 JST

The site is failing on Netlify for some reason, but I set up a new
Netlify site that will hopefully get me sorted.

But that's not why I'm writing.

I wondered why my existing server was not serving the site; I set it
up to be updated whenever I push the public directory to the server.

(check check check) ohhh there's your problem!

It makes a difference if I WIPE THE `.git/` DIRECTORY by WIPING the
`public/` directory to debug all this. hahah oops.

But that's not why I'm writing ...
