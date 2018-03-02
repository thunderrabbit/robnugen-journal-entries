---
title: "trying to get SSL working on cloudfront (not solved)"
tags: [ "cloudfront", "ssl", "aws", "work", "moe joe" ]
author: Rob Nugen
date: 2018-03-02T15:24:27+09:00
---

## 15:24 Friday 02 March 2018 JST

We have an image server behind cloudfront.  Cloudfront can serve
everything via https when using its subdomain.  But using our own
domain with https isn't as easy as I would like.

Running Lets Encrypt on the server, I get an error like the https
request was not allowed.

So I created a certificate with AWS Certificate Manager and told
Cloudfront to use it, but I do not see how to tell the server to use
it.

Bah.
