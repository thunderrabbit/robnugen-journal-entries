---
title: "working on AB"
tags: [ "work", "ab" ]
author: Rob Nugen
date: 2020-05-27T08:39:56+09:00
draft: false
---

After making a huge change to AB at the end of April, I have not done
any work on AB just in case something needed to be rolled back.  It
has been nearly a month so I am pretty sure we can use that version as
the newest WORKING version.

##### 11:04 Wednesday 27 May 2020 JST

Yay!  I was able to wipe our copy-pasted installation of PHPMailer in
favor of having it installed by Composer.  I had tried this before,
but had errors because I also needed to add a line to autoload
Composer's classes.

    require __DIR__ . "/vendor/autoload.php";

Now with that line, composer-installed classes can be found.  This
should let me fix another ticket for a different composer class that
wasn't working before.
