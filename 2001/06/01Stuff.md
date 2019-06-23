---
title: Stuff
tags: []
author: Rob Nugen
date: 2001-06-01
---

<p class=date>6:15pm Friday 1 June 2001</p>

<p>Past two days have been full of programming
roadblocks - all kinds of weird problems have appeared
in the code I've been developing.  Two of these
required me to call in the Kevmeister, and he was
dumbfounded by both, and we found work-arounds for
both.</p>

<p>They were both part of G3 development: 1) was
calling a macro that had been superq'd:</p>

<pre>
%let dog = %superq(macroname);
%&dog;
</pre>

<p>The called macro would just fail at the first
apostrophe.  Very odd.</p>

<p>The other was for the response_rate screen, which
displays the response rate of people's feedback
providers and a legend that describes the color coding
used on the screen.  The legend wasn't being printed
correctly, and it was freaky because this code had
been working, *and* because we verified that the
correct string was being written to the browser.  Both
NN and IE broke in the same way.  So it must not have
been written correctly to the browser, but the string
was correct.  We verified that.</p>

<p>Bizarre, don't you think?  (Yes, so bizarre that I
know what the hell I'm talking about!)</p>

<p><img src="/images/rob/wL-ROB.gif"/></p>
