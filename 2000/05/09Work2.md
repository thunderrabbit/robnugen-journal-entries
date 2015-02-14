---
title: Work2
tags: work
author: Rob Nugen
date: 2000-05-09
---

<title>Work</title>
<p class=date>11:33pm CDT Tuesday 9 May 2000</p>

<p>Ack.  I just got a call from Kevin.  He booted our webserver
tonight and it's not coming back up.  After it checks the memory,
finds the disks, gets past the "press spacebar to use last known good
configuration", it flashes error codes and restarts.

<p>I'm going in to work now.

<p class=date>3:45am CDT Wednesday 10 May 2000</p>

<p>Sure enough, when I arrive the server was still rebooting itself as
described above.  I didn't know what to try, except maybe reinstalling
Win NT on the machine... maybe it would allow us to refresh the system
files instead of overwriting everything.  We really didn't want to
lose any data.

<p>I asked Kevin if it was more important to save the data or just
blast through and reinstall, which would (probably) be faster.  He
said saving the data is more important.

<p>Called Microsoft support, paid $245, and the short version of the
story is that all data was safe.

<p>Mostly just in talking to the tech guy (Derek (sp)), I worked
myself through my own solution.

<p>First brainstorm: we have two drives in the machine, and they are
mirrored.  So presumably, we can take one drive out, have the copy of
the data there, fix the other drive, restore the data.

<p>Took one drive out, and magically, the other drive booted no
problem.  And all the data was there..  Except it was all one week
old.

<p>Swapped the drives, and magically, the other other drive booted no
problem.  And all the data was there.  And it was up to date.

<p>The theory is that when we had a power outage last week, one drive
was corrupted, and hadn't been written to since.  When we tried to
boot with both drives, the OS said, "hey these drives aren't
mirrored!" and wouldn't boot.

<p>Low level formatted the week-old-data drive, recreated the mirror,
everything is happy.

<p>During the low level format, I got to talk to Hillary on AOL IM.
That was great fun!  Now I'm going to bed.

<p><img src='/images/rob/wL-ROB.gif'>

