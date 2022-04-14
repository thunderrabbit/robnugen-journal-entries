---
title: "timeouts on 1Password vault"
tags: [ "1password" ]
author: Rob Nugen
date: 2022-04-14T18:33:43+09:00
draft: false
---

I'm trying to edit some of my vault entries via web (using Firefox on Pop! OS).

This was the error message in a popup:


    Failed to load vault.
    
    The request took too long. Check your Internet connection and try again.
    
    ClientError: The request took too long. Check your Internet connection and try again.
    
    Session: SMSSO4WAPNDIJPGVSXCQDHSH64
    
    Time: 2022-04-14T09:22:43.592Z


----------

When I Inspect the requests, a GET request to ..../items/overviews is timing out at 32 seconds.

[![1password timing out](//b.robnugen.com/journal/2022/thumbs/1password_timing_out.png)](//b.robnugen.com/journal/2022/1password_timing_out.png)

It worked once out of about 10 times recently.
