---
title: Work
tags: []
author: Rob Nugen
date: 2000-08-23
---

<p class=date>5 pm Thursday 23 August 2000

<p>Work was okay today.  Actually it was pretty fine compared to
yesterday and the day before.  I finished the latest requested changes
to my latest project; I almost feel like I'm back on schedule with it
again.

<p>We had an interesting data collection error yesterday.  A person
had filled out a survey and then went back to change the answers
(which is perfectly legal) and then was shocked when they found 1/2
their answers missing when they went in again.

<p>What happened?  Well, on this survey, we have multiple [Save and Go
To #] buttons which will save the user's input and return them to the
screen at the next question.  While the survey had been previously
filled out, the person clicked Save and Go To *before* the screen had
loaded all the way.  Therefore the bottom 1/2 of the responses hadn't
been drawn to the screen, and therefore showed as blank when saved for
the second time.

<p>I added a fix today.  I set a variable called pageLoaded to NOPE
when the page begins to be loaded.  When the page is loaded, I set the
value of pageLoaded to YEP.  Then when Save and Go To is pressed, the
button calls a function that checks the value of pageLoaded.  If it's
NOPE, a warning is given "please wait.." and if it's YEP, then the
page is saved.

<p>Yay!

<p><img src="//b.robnugen.com/rob/wL-ROB.gif">


