---
date: '2020-07-06T06:31:22+09:00'
entry_title: 'I found a bug in my Micropub server'
journal: journal
posttype: journal
published: true
slug: i-found-a-bug-in-my-micropub-server
title: 'I found a bug in my Micropub server'
---

I found a bug in the slug creator regarding dots in the title. It seems if I include a dot somewhere in the title, the URL sent back from the server doesn't include the dot, even though the filename does.

I don't know offhand what's happening because I think I use the same sluggified path variable for both.

Mainly, I just wanted to post again to my test site via Quill.
