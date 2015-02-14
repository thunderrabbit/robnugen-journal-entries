---
title: awesome
tags: 
author: Rob Nugen
date: 1999-11-09
---

7:20am

I wanted to name this file awesome!!!!!!!.txt but I don't think the
exclamation points would have been very well received by the shell.  I
don't actually know.

Awesome!!!!  I have written my index.pl file, which sits in my
/journal directory.  It accepts arguments on the URL: dir= and file=
to indicate which directory and file to display!!!  As Dude might say,
it's "totally supa cold dope rawkin!!"

So now I simply use a Cascading Style Sheet in my index.pl file (I may
eventually move the style sheet to its own file as it gets more
complex) and it gives a more consistent look to my journal entries!

I'm pretty flippin' pumped about the whole thing!

I still want to add a bit of security to the whole thing; make sure
people don't try to enter huge crazy long directory paths and/or file
names to try to break the server.  I think Perl will simply fail and
there won't be a security breach, but I'll add it anyway.

I've already added code that ensures no '.' '/' or '~' characters are
used at the beginning of the diretory name, so one can't dig into my
directory structure with this file.  Oh wait!!!  One could do this:
index.pl?dir=1999/../../  I'll try that now and see what happens.
Doh!

Oh my goodness!  I was able to type in
index.pl?dir=1999/../../../../../../../etc/ and get a listing of the
/etc dir on this server!!!!  As proof, here's a list of some of the
files in it:

 cron.daily 
 cron.half-hourly 
 cron.hourly 
 cron.monthly 
 cron.quarter-daily 
 cron.quarter-hourly 
 cron.weekly 

Is this a security breach?  I don't know; I didn't have read access on
anything interesting, so I think they're okay, but still it's a tad
scary!

I will disallow any ../ within the dir or file parameters.
