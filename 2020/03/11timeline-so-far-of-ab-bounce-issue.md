---
title: "timeline so far of AB bounce issue"
tags: [ "work", "timeline" ]
author: Rob Nugen
date: 2020-03-11T06:39:33+09:00
draft: false
---

0. I set up email long ago, assuming we would never get bounces per
   the emails we (don't) send
1. Yesterday we got notification of a bounce
2. I could not see what email triggered the bounce
3. You guys looked up the offending email
4. I discovered that a user had signed up with that email.  I
   hardcoded the address to not have emails sent to it.
5. I tried to set up an alert to email with headers if any bounces or
   complaints happen
6. I triggered an email to bounce (6 hours ago as I write this)
7. I have not received an email regarding the bounce (6 hours later)

Receiving emails for bounces is just to make sure I have bounce
detection set up correctly.  I eventually want to process bounces
automatically.

##### 18 hours later, from AWS support

    I checked the SNS topic you have and the SNS endpoint and I see
    they are configured correctly to receive a bounces via email for
    emails sent by "sestest@rn.com " that results as bounces. So I
    started to SES logs for any bounces generated for emails sent by
    this email address "sestest@rn.com " and I couldn't see any
    bounces from this email which explains the reason you didn't
    receive any bounces on SNS endpoint "webmaster@AB".

OOOhhhhhhh that makes sense.

##### 09:13 Saturday 15 March 2020 JST

Now it's all sorted out.
