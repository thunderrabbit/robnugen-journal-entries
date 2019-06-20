---
title: Getting Virtualbox Sorted
tags: [ "debian", "virtualbox" ]
author: Rob Nugen
date: 2015-05-23T11:48:01+09:00
---

## 11:48 Saturday 23 May 2015 JST

On my old computer, I did something like right-click - show this box
in Finder.  The box is in its own folder so I just copied that entire
folder over the network to my debian box overnight.  Took about 6
hours as it's maybe 38GB (more than 10% of my previously planned HD
partition, and nearly than 40% of my previously-planned-to-purchase HD
size!)

In virtualbox on the new machine, I clicked File -> Import Appliance,
but that did *not* work because I hadn't exported it from the old
computer.

So, in virtualbox on the new computer, I clicked Machine -> Add, which
features shortcut key Ctrl-A, and navigated to the folder and opened
the .vbox file.

Opened with no problem, but when I tried to power it on, I got an
error:

    Could not start the machine *NAME* because the following physical
    network interfaces were not found:

I have the option to Copy, Close VM, or Change Network Settings.

I don't really want a second copy of this VM, so I'm just going to
Change Network Settings.

---

Welp, looks like I have to create the network adapter first.  Closed
the VM and clicked File -> Preferences -> Network

then Host-only Networks tab and clicked the little plus icon to create
a new one.

It automagically created vboxnet0, which I think is the same name as I
didn't type above.

Clicked OK and then address two other issues I noted: This VM is
requesting more resources than this machine has!

Right clicked on the VM and selected settings, then tweaked some
sliders so they were in the green instead of red zones.  Wow this is
so easy!

## 12:16

Clicked start.

## 12:20

It seems to have started okay.  Now I need to see if I can get it to
serve web pages.  Hafta add to my local `/etc/hosts` file.

## 12:58

Boom.  I just added the entries to my local hosts file and the site
loaded perfectly.  Noice!

Next, I'll start copying the AB site to Dell machine, and while that's
running, get back to my more-neglected-than-usual inbox.