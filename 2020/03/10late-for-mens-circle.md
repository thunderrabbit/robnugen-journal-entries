---
title: "Late for mens circle"
tags: [ "late", "work", "rain" ]
author: Rob Nugen
date: 2020-03-10T19:37:51+09:00
draft: false
---

Right around the time I planned to start heading to men's circle, two
things happened.

1. The code I assumed was fine started throwing errors in final
   testing.  Super glad I have something of a test framework working!

2. An email we sent bounced.  We have never had emails bounce before
   so I immediately contacted our mail provider looking for infos.
   Turns out someone used an spam target email address to sign up on
   AB. When verifying that email, of course it bounced.

My brain panicked a bit but I texted men's LINE group to let them know
I'd likely be late.

Will helpfully said, "we have all the king we need," which made me
smile and took the proverbial load off my mind.

For the first issue above, I pruned the recent commits down to code I
knew was working.  Pushed it to staging and verified it's fine.

For the second issue above, I hardcoded an array of invalid email
addresses to check and not email.

Testing the array reminded me to update some old code to use the new
code for sending emails.  That update had fallen to the bottom of the
chasm of old TODOs but now it's been ressurected and completed yay!

I emailed our mail sender to tell them I had done what I can,
including screenshots of the hardcoded array and proof that it was
working with screenshots of emails received.

Tomorrow(?) I will start digging into documentation on how to detect
bounced emails and write them to a blacklist I can check.

Isn't that a microservice that should already exist?  Hmmm.  (edit to
add there are, and they all look spammy to me.)

Arriving in Yoyogi Uehara now.  I'll look for this microservice until
we arrive in Shinjuku.

