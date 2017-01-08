---
title: worked
tags: work
author: Rob Nugen
date: 2017-01-08T09:32:24+09:00
---

## 09:32 Sunday 08 January 2017 JST

Yesterday I worked on SB, trying to get Ansible to install Redmine on
a server.  radamanth.redmine-ansible installed a self-signed SSL key,
but I couldn't get that to work, so I manually converted the HTTPS
version of the site to HTTP version.  I got something to load, but
it mentions a 500 error, and I can't see anything in the log.

Oh wait, after that I told the config to treat all requests as local,
so it spit out the error message, something like "can't find this
function" when referencing something like use default language for
anon.

The only reference to this error said "help me," and got a response
linking to "how to ask questions..."
