---
title: telnet
tags: []
author: Rob Nugen
date: 2000-09-16
---

<title></title>
<p class=date>13:41 Saturday 16 September 2000

<p>Wow!!  I called Marcel this morning for some insight/help getting
my linux box connected via DSL.  Yes, it's sad, but we've had DSL at
the house for some months, and Wende's computer is connected, but mine
is not.

<p>Marcel suggested that I look at the HCL (Hardware Compatibility
List) to see what ethernet cards are supported.  I looked and found
that my card is supported and it listed a module 3c59x.o.  Hmmm
"module" was a new thing to me, so I did man -k module and found
insmod.  I looked through that man page and found modprobe.  I man
paged that and found that I can modprobe 3c59x.o and it will install
the module if it can.

<p>I did that and *wow*!  My computer can see the ethernet card!  I
turned on the eth0 interface in X and now I am one little step away
from getting everything to work.  Right now I am able to telnet to my
router, and from my router I can telnet to the Internet.  But I cannot
telnet from my computer to the Internet directly.  Hmm

<p>So to write this entry, I have telnetted to the router and then
telnetted to my website and am writing it with emacs.  Marcel and
Kayse and fam are coming over in a bit and he and I will look at it;
I'm sure his unix knowledge will help us fix it very quickly.

<p>Thanks, Marcel!  You're the best!!!

<p><img src='//b.robnugen.com/rob/wL-ROB.gif'>

