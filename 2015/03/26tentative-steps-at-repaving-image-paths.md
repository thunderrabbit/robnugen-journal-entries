---
title: tentative steps at repaving image paths
tags: images,journal
author: Rob Nugen
date: 2015-03-26 14:22 JST
---

##14:22 Thursday 26 March 2015 JST##

Okay, The journal entry I'm writing now is in my
[journal repo](https://bitbucket.org/thunderrabbit/robnugen-journal-entries)
(or will be once I push it there).

In this repo, coming from my old journal, I think there are several
instances of URLs like /images/....  in various entries.

I would like those to keep working, but I don't want to put all my
images in this repo, or even my Middleman repo because it's more
likely to change than my images, and images take up more disk space,
generally speaking.

SO, I've created b.robnugen.com and copied from robnugen.com/images
all the directories and paths right onto the root of b.robnugen.com

Okay let's live blog this.

##14:28

I need to find an old entry with a reference to /images.

searched:
[site:robnugen.com/cgi-bin images](https://encrypted.google.com/search?hl=en&source=hp&q=site%3Arobnugen.com%2Fcgi-bin+images&btnG=Google+Search&aq=f&oq=&aqi=)

and came up with several options.

Here's the
[same search saved by archive.today ](https://archive.today/RWBWA)

##14:32

Gulp. I see "permalink" at the bottom of each of these entries. hahah
hmmm

Okay so let's see...

on old site
[19 May 2006 funny email to g](http://robnugen.com/cgi-bin/journal.pl?type=all&date=2006/05/19#Funny_email_to_g)
([same page on archive.today](https://archive.today/sKupd))

on new.robnugen.com

dang that happens to be a page I've not ported over yet.

## 14:36

Okay here's one

on old site
[10 July 2000 dream](http://robnugen.com/cgi-bin/journal.pl?type=all&date=2000/07/10#Dream)
([same page on archive.today](https://archive.today/CdomT))

on new.robnugen.com

[10 July 2000 dream](http://new.robnugen.com/journal/2000/07/10/Dream/)
([same page on archive.today](https://archive.today/i8K53))

That "with love - ROB!" signature is actually hosted on b.robnugen.com
though referenced as /images/rob/wL-ROB.gif on new.robnugen.com

See?

&lt;img src="/rob/wL-ROB.gif" /&gt;

give me this:

<img src="/rob/wL-ROB.gif" />

Hahahaha

I forgot I have to add /images

&lt;img src="/images/rob/wL-ROB.gif" /&gt;

give me this:

<img src="/images/rob/wL-ROB.gif" />
