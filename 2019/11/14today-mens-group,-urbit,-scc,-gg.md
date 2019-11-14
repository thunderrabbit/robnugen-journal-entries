---
title: "today: mens group, urbit, scc, gg"
tags: [ "variety" ]
author: Rob Nugen
date: 2019-11-14T14:11:33+09:00
---

#### MKP

Men's group this morning outlined above.

#### urbit

In Urbit news, I am doing assignments in Hoon 101.  The first is
apparently to see if we have everything set up okay, which I think I
do, but cannot figure out how to write this function ("gate" in Urbit).

This is my attempt at creating a hoon script which writes a number in
a different format.  If I run this with input 0, I expect the output
to be `~zod`, which is galaxy number 0

    |=  a=*
    `@ub`a
     
But when I run it via `+aura 0` it fails as below:

    > |commit %sandbox
    >=
    : /~bus/sandbox/25/gen/aura/hoon
    > +aura "fffhbhbhbhbbgffxfcgv"
    /~zod/home/~2019.11.8..13.39.06..44bf/sys/vane/ford:<[4.828 18].[4.828 59]>
    /~bus/sandbox/0/gen/aura/hoon::[1 1].[2 7]>
    /~bus/sandbox/0/gen/aura/hoon::[2 1].[2 7]>
    /~bus/sandbox/0/gen/aura/hoon::[2 6].[2 7]>
    nest-fail
    ford: %slim failed:
    ford: %ride failed to compute type:
    ford: %plan failed:
    ford: %core on /~bus/sandbox/0/gen/aura/hoon failed:

#### SCC

Instead of jumping over a glass wall, I asked SCC staff to send
someone to retrieve my hat which fell on the other side of the wall as
I draped my jacket on the glass wall.  Gosh that took a lot of
~~will~~ wont power to not jump over the wall and get it myself!  XD

Lessons were fine.  First Yasu practiced clockwork dolls, weather
radar, BEMS, and Smart Eye Sensor.  Then Azusa asked me to doublecheck
her spript (sic) for the history zone (firsts of their kinds).

#### Soness!

I am really grateful to get to work with
[Soness for presentation](https://www.yourspeakingjourney.com/)
support this coming week!  She and I have been working together for
years, and I am always amazed with how she helps me find just what I
want to say, even if I don't always know it!

#### GG

Next is GG lesson here in Akihabara.  It's my third-to-last lesson
with them.  :-(

#### urbit (23:57pm)

Yay I solve the first week's assignment.

    |=  a=*
	`@p`a

I am not sure why I did not get it sooner.
