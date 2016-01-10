---
title: testing local sites
tags: work
author: Rob Nugen
date: 2016-01-09T10:27:01+09:00
---

## 10:27 Saturday 09 January 2016 JST

I just bought an account on https://ngrok.com so I can use ghost inspector to
test my local machines running on virtualbox.  Sweet!

I sent a couple emails back and forth with Alan who quickly solved the
setup issue I was having.  He showed me how I can easily use ngrok to
test my site which only exists on my local virtualbox machine via a
domain which only exists in my `/etc/hosts` file:

    ./ngrok http -host-header=mylocal.exampledomain.net  mylocal.exampledomain.net:80

And now that I've signed up, I have reserved rob.ngrok.io as one of my
three reserved names for connection tunnels!

    ./ngrok http -host-header=mylocal.exampledomain.net -subdomain rob  mylocal.exampledomain.net:80

Shwiing!

I'm consdering buying an account with [ghostinspector](ghostinspector.com), but the lowest
price is a bit high for me .. $100 per month for 10,000 tests per
month.  If it were $100 per year for 1000 tests per month, then I'd
have it already.
