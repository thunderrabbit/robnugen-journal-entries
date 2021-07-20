---
title: Work
tags: []
author: Rob Nugen
date: 2001-02-03
---

<p class=date>09:02:03 CST Saturday 3 February 2001</p>

<p>It's been *so long* since I've written!  Wow.  Work has just been
work work work and taking lots of energy.</p>

<p>Cool thing though - on Wednesday, I got to see Madeline!  She's a
girl that I met at the planning meetings for the Ultra Cosmic Mass
Extravaganza in October 1999.  We've been in vague email touch since
then and she called me once at KTRU about 2 months ago or so and then
we hung out at Eatzi's and then her school to see her latest website
creations and tons of art.</p>

<p>Right now I am at work, just about to install a new firewall and a
load balancer for our web servers.  Duane, our smart network guy has
just arrived on the scene.  See ya in a bit.</p>

<p class=date>09:24am</p>

<p>We just moved the 2 web servers and 1 mail server outside the
firewall while we install the new firewall.  We just checked to make
sure they all still work.</p>

<p class=date>12:07pm</p>

<p>Hmmm.  The webserver connectivity seems to be working, but one of
the webservers is not rebooting. Or it is rebooting, but the disks are
screwed up so it can't load the OS.  It had two mirrored drives and
the mirror broke and we can boot with the drive that has the old data,
but not the drive with the new data.  Worst case is we boot with the
old data drive and then restore a full restore from Thursday and then
Friday and Saturday incremental restores.</p>

<p class=date>13:16</p>

<p>We replaced the faulty disk, recreated the (software) mirroring and
are about to restore the data from tape.  Just as I had the tape
restore ready to go, Dave called and he'll come in.  I'm pretty sure I
was doing all the right stuff, but he's the expert, and I don't mind
waiting a few extra minutes to make sure it's done correctly.</p>

<p class=date>15:56</p>

<p>Bluh.  The disk mirroring and restore are all good, but now it
seems that though people (such as Will Smith) can visit our website
from outside, we can't visit it from inside.  I'm not sure why that is
not working.  We've moved the webservers to the DMZ and maybe it will
work now.  I'm really not clear on what is happening here.</p>

<p class=date>16:52</p>

<p>abort abort abort.  bluh.  The biggest snag that we couldn't
overcome today was making the backups work correctly.  The dumb thing
is that one of our webservers is also doing backups for our whole
system.  When it was moved the the DMZ, it couldn't see the rest of
the network to do backups.  So we are calling off the whole operation
until that can be resolved.  Pooh.</p>

<p><img src='//b.robnugen.com/rob/wL-ROB.gif'/></p>
