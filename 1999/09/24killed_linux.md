---
title: killed linu
tags: 
author: Rob Nugen
date: 1999-09-24
---

<p class=date>24 September 1999</p>

In a way it's kind of refreshing.  In a way it kind of sucks.  I wiped
out my linux drive at home. That means I also lost all my email and
stuff from before the 22nd.

(So if you sent me an email before 22 Sept, it's gone.)

So here's what happened: I began to run out of drive space on my 1.1
gig drive that was on my linux box.  I was running an 8 gig drive on
my Windows box, and certainly didn't need all that space there; I
rarely use Windows!  So I decided to switch them.

I archived the windows info that I cared about, and attempted to
install linux on the 8 gig drive, leaving the 1.1 gig drive alone.

Got it installed, but it wouldn't boot!  I think that Windows ate the
boot partition of the drive so Linux's boot manager, Lilo couldn't
function.  Grrr windows.

Tried to use my 1.1 gig linux drive to access the 8 gig linux drive,
but couldn't get them to happily coexist in the same machine.  (that
was a problem with Bios configuration; neither OS was at fault).

My dad suggested using Partition Magic, and or Boot Magic to get stuff
to work.
I drove to his house to grab the disk, and he actually had a linux 6.0
distribution.  Cool!

Got home and found that in order to install either Partition Magic or
Boot Magic, I had to have a windows partition.

I reformatted a 2 gig partition of the 8 gig linux drive to allow
windows to write to it. I was able to view the Boot Magic CD, but it
needed Windows to run.

So I installed Windows in the 2 gig partition of the 8 gig drive.
Actually had some problems with that: "Windows will now scan your
system for devices; your system could hang" It hung. Twice.  But I got
Windows installed.

I got Boot Magic installed.  Only thing was now I had a windows
partition on my drive and I didn't want that.  I want linux!

        Some of you are asking, "why go through all this trouble to
        get linux?"  (Right now I'm asking the same thing.)

        Once I get it working, the OS is way more stable; it doesn't
        crash randomly with vague error references.  If a program
        crashes, it crashes cleanly and doesn't affect the whole
        system and interface and everything.

        Linux is free. Windows is crappy bloatware that costs tons of
	money and breaks randomly.  Plus, running linux is just cool.

I focused on getting both drives to work in the system at the same
time.  With a few jumper changes, I was able to get both going.  I was
not able to figure out how to get the 1.1 gig drive to boot and simply
use the 8 gig drive for extra storage. In retrospect, I shoulda spent
more time on that.

Next thing I did was reinstall linux on the 8 gig drive and I
formatted the 1.1 gig drive in the process.  Bye bye email.  bye bye
website backup.  bye bye ftp information to update websites.

I actually have the ftp information so that's okay, but it's still a
big pain in the bootay.

Unfortunately, even though I installed the 6.0 version of linux, it
still won't boot by itself.  (I am able to boot it using a floppy)

I'm going to try a couple of more variations - the one I can think of
now is to install linux on the 1.1 gig drive and see if it will boot
by itself then.

A different unresolved issue is this: I don't like the new graphical
desktop that came with 6.0.  It's called GNOME, and I think I'd prefer
to have the 5.0 X windows desktop. GNOME looks a lot like Windows
(trying to coax mainstream people over) and I just don't like it.
GNOME also seems to have some bugs that I can't quite articulate now.

However, the 6.0 version has updated libraries and stuff.  I think
what I may do is the following: Try to get GNOME to do what I want it
to do; or get rid of GNOME and go back to X Windows; or install 5.0
and try to update the libraries.

For now, I'm doing email and website updates from work.
