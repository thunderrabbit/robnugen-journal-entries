---
title: pushup counter tweaks
tags: pushups
author: Rob Nugen
date: 2015-05-13T18:39:04+09:00
---

## 18:39 Wednesday 13 May 2015 JST

WIthout internet access I can't really run the pushup counter because
it's backed by parse.com and a hosted version of jquery.  I'm not sure
how to get around the parse issue, though I guess I could just store
the count in local storage and turn off the variety of stats I had
planned to display (# of pushups this day/month/year)... or heck maybe
there's a simple JS interface to a local DB.

## 19:11

hmm! I guess I'll be looking at CouchDB and PouchDB.

## 22:01

Oh cats!!!! I'm so smart to realize that although I brilliantly hid my
parse javascript keys from the github repo, they are *obviously*
available on the website on which the app is running!

Turns out, and I'm paraphrasing, "Parse keys are meant to be out in
the wild"..  it's just the master key that needs to be protected.

I'm going to go through their todo tutorial which features ACL (Access
Control something) information...  basically each of my
pushup-counters will have to log in to keep their pushup data from
being smurfed by someone else!  I'll add a guest/guest U/P so people
can try the app.

The code seemed pretty short; I can probably do it tonight.  BUT maybe
I shouldn't; I have to be up early tomorrow to teach C and A!

## 23:58

I didn't do anything regarding logins, but I converted the code I had
slopped together into a nice clean closure and now it works nicely.
Pushups are counted locally and then saved to parse when clicking
"save" at the bottom.  Still not displayed yet.

[//new.robnugen.com/samples/javascript/pushups-counter-js/](pushups counter)
