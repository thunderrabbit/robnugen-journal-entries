---
title: "Solved illegal reflective access operation has occurred"
tags: [ "burpsuite", "ssh", "vagrant" ]
author: Rob Nugen
date: 2022-01-21T09:50:23+09:00
draft: false
---

Running burpsuite on Kali Linux, I got "An illegal reflective access operation has occurred"

    ┌──(vagrant㉿kali)-[~]
    └─$ burpsuite 
    Your JRE appears to be version 11.0.12 from Debian
    Burp has not been fully tested on this platform and you may experience problems.
    WARNING: An illegal reflective access operation has occurred
    WARNING: Illegal reflective access by burp.e9w (file:/usr/share/burpsuite/burpsuite.jar) to field javax.swing.JTree.expandedState
    WARNING: Please consider reporting this to the maintainers of burp.e9w
    WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
    WARNING: All illegal access operations will be denied in a future release
    ^C

After getting very quick support via
https://forum.portswigger.net/thread/an-illegal-reflective-access-operation-has-occured-6c59779c
I realized what was going on.

{{% img-responsive
"https://b.robnugen.com/journal/2022/screenshot_worth_a_thousand_burps.jpg"
"screenshot worth a thousand burps" %}}

I was getting an error when running burpsuite via ssh.  It had no way
to display itself.

When I ran burpsuite via a terminal in the Kali GUI, it worked fine.
