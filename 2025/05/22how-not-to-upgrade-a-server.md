---
title: "How NOT to upgrade a server"
tags: [ "2025", "oops" ]
author: Rob Nugen
date: 2025-05-22T11:48:00+09:00
draft: false
---

I was up all night last night rebuilding a server that went down for some reason.

Some reason: `root@ip-10-0-33-142:/# sudo find . -type f -mtime +1 -delete`

I meant to do it in `/var/www/cache` instead of `/`

Good news: now I got to do the server upgrade I've been wanting to to!

I'm most proud of my *internal* recovery time. Once I realized what I had done, I felt abject terror and shame for just about 15 seconds before realizing it's a good thing this happened and praying with gratitude to Spirit for this crisis+opportunity.
