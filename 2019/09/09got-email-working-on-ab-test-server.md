---
title: "Got email working on AB test server"
tags: [ "work", "ses", "ubuntu" ]
author: Rob Nugen
date: 2019-09-09T19:52:33+09:00
---

(written 19:52 Wednesday 11 September 2019 JST)

On Monday I got email working with AWS SES.  It was pretty much
plug-n-play level of easy since I already had a site set up that had
been using [PHPMailer](https://github.com/PHPMailer/PHPMailer).

But eff me I could not figure out what was different from the setup on
our old server which was sending emails from itself using Exim no
problem.

