---
title: progressing
tags: stuff
author: Rob Nugen
date: 2017-05-21T08:32:12+09:00
---

## 08:32 Sunday 21 May 2017 JST

### My Zcoin progress

I could not get Zcash to run on Debian inside virtualbox on Amazon EC2
because they do not support nested virtualization.

I tried just using AWS as the provider and using Vagrant locally, but
I kept getting an error like 「this box is not available on requested
provider」(using Japanese quotes because it is not an actual quote).

So I tried spinning up a Debian box directly on Amazon with Ansible.
It starts and then automatically shuts down.

I have not yet tried starting said box with Amazon's launch wizard.

- - - - -

### My Japanese progress

I cried yesterday during my Japanese lesson.  I could not stand not
knowing the answer because I had not studied.  Basically my teacher was
quizzing me and I kept getting answers wrong because

1. I had not studied 
2. I do not yet know the verbs
3. I do not yet grok (in)transative in Japanese (though I basically
understand the idea in English)

She suggested we switch to just reading some text and skip the grammar
until I have time+desire to study again.

- - - -

### Work progress

I got a backup script running via cron which saves tables in smaller
bundles than Entire Database at a time.  Basically it saves tables by
searching for a prefix.  Only problem (yes the *only* problem haha)
with my system is when I do *not* send a prefix, the script has to
know which prefixes to skip.
