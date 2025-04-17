---
title: "pics coming soon"
tags: [ "travis", "pics" ]
author: Rob Nugen
date: 2020-06-24T14:15:09+09:00
draft: false
---

I have a server (https://b.robnugen.com) dedicated to serving binary
content (as opposed to text).  Basically pictures (and some PDFs and a
couple of MP3s probably).

For some years I have been poking at the idea of being able to upload
from my phone *named* images, into specific directories.  (I can settle
for hardcoding the directory to make it easier to start.)  I have
recently found [MicroPub](https://indieweb.org/Micropub/Servers) and
beginning to grok that as a possible way to help solve this.

I have just found [Known](https://withknown.com/) which apparently
runs on Dreamhost, so I'm going to check it out.

##### 18:55 Saturday 27 June 2020 JST

I abandoned Known pretty quickly when I saw it is its own website.  I
just want a server that can update my Hugo site.  I found
[skpy/micropub](https://github.com/skpy/micropub) which looks to do
what I want, to close approximation, if not exactly.

I set up [skpy/micropub](https://github.com/skpy/micropub) at
https://hugotest.plasticaddy.com/micropub and it is doing some of the
right things, but not all of them.  One reason may be that the SSL
certificate is a temporary self-signed cert.  I don't know why Let's
Encrypt is taking so long (hours now) to approve the certificate.  I
guess the new subdomain's DNS entry came through for me but not them??

##### 22:11 Saturday 27 June 2020 JST

The correct SSL certificate seemed to help, or maybe it was because I
put the correct URL in the config file.  hmmm.  I have gotten some
data files to be sent from Quill and then saved via skpy/micropub as
data files.  For some reason Indigenous is not sending the
authentication token.   Weird.

Anyway, bedtime now.
