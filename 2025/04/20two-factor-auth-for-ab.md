---
title: "Two Factor Auth for AB"
tags: [ "2025", "wow", "ai", "2fa" ]
author: Rob Nugen
date: 2025-04-20T16:20:00+09:00
draft: false
---

Wow yay I got a great proof of concept for AB to have 2FA in their login flow.  😁 

And with ChatGPT support, I finished in well less than half the time it would have taken otherwise.

Funny enough, it took about how much time I predicted it would take.  That prediction was two years ago, way before ChatGPT became ubiquitous.

Now I just need to fit it into their login flow.

My plan: if the user has 2FA set up, require it for them to log in.  Once they have verified 2FA on a device, set a cookie and don't require it for a while.

If they don't have 2FA set up, show them the option each time they log in, but let them skip it.
