---
title: "getting skippys minimal php micropub endpoint on my dreamhost shared hosting site"
tags: [ "skpy", "micropub", "php", "dreamhost" ]
author: Rob Nugen
date: 2020-06-28T10:12:46+09:00
draft: false
---

<div class="note">(written 10:12 Monday 29 June 2020 JST)</div>

I installed a test version of my website at
https://hugotest.plasticaddy.com/  I have not yet written how I did
that, but it wasn't too hard.

I used
[Skippy's minimal PHP Micropub endpoint](https://github.com/skpy/micropub)
on my hugotest site by cloning it into the public/ folder of the
site. (1)

Just a few tweaks to Skippy's PHP Micropub endpoint config file,
summarized with the command to rebuild the site:

    /home/dhusername/bin/hugo --quiet --config /home/dhusername/barefoot_rob/config.toml -s /home/dhusername/barefoot_rob/ -d /home/dhusername/hugotest.plasticaddy.com/

I was able to get some "stuff" posted via
[Aaron Parecki's Micropub client Quill](https://quill.p3k.io/) notes,
but I could not get the editor to work; it is apparently not sending
the token, which is pretty surprising.

I will try to install Quill tomorrow.


(1) actually it is at
`/home/dhusername/hugotest.plasticaddy.com/micropub` where
`/home/dhusername/hugotest.plasticaddy.com/` is the website root.
