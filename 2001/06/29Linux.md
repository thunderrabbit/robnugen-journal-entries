---
title: Linux
tags: []
author: Rob Nugen
date: 2001-06-29
---

<title></title>
<p class=date>7:21am CDT Friday 29 June 2001</p>

<p>I know I've been f-in' around with linux for a while, but I've
still never really hacked into it and tried to figure shit out.  I
don't know how to use RPM, and I have no clue how to rebuild the
kernel.</p>

<p>In November, Marcel helped me set up the network configuration of
eth0, so that the system would automagically be connected to the DSL
line when it booted.  When we changed to cable modem, I was still
using DSL, but needed to use DHCP instead of setting specific IP
addresses.</p>

<p>It took me long enough to figure out how to get DHCP to work at
all.  Then I found a daemon dhcpcd which I could just run as root and
then tada! we're connected.</p>

<p>However, I still wasn't sure how to make DHCP start at boot time.
This would cause the boot process to take super way too long as
sendmail would wait for something to timeout - about 3 minutes it
seemed.  Maybe more.</p>

<p>So I trial-and-errored my way to finding the directory and config
files that Marcel worked with in November.  Found them, and then pored
over the code to see what called what with what options, etc etc until
I found the solution:</p>

<p>In the eth0 configuration file, I set the boot protocol to dhcp.</p>

<p>That was it!  Yay linux and red hat for being so precise in
configuration; yay me for figuring out how to do it!</p>

<p>PS: while I searched through the directories to find the files
Marcel had changed, I found how to change the system version number
and name when one is at the login prompt.  Now it says
(thunderrabbit) instead of (Hurricane)</p>

<p><img src='//b.robnugen.com/rob/wL-ROB.gif'/></p>

