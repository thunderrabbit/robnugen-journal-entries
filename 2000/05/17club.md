---
title: club
tags: []
author: Rob Nugen
date: 2000-05-17
---

<title>Investment Club</title>
<p class=date>7:20am CDT Wednesday 17 May 2000</p>

<p>Super duper special thanks to Amanda for helping me figure out the
NAIC (National Association of Investment Clubs) accounting stuff.  My
part of the accounting is now up to date.  (I hadn't recorded anything
from the first 3 meetings)

<p>(for the long-time reader, Amanda above is different from Amanda
who I dated.  Above is Amanda G, who you may have met at UH.)

<p>- - -

<p>Today is Wendesday, but not KTRU day.  My new KTRU shift if 7 to
10pm Saturday night!!  To me, this kinda means I'll be at ultimate at
UH each Saturday.  Maybe some of the ultimate peeps will listen before
the games!


<p>- - -

<p>Work yesterday was cool, but I'm stuck on one little thingy...  The
administrator of our database is allowed to change people's names and
emails in the database.  That was easy enough to code.  Now I'm adding
the simple check to see if the "new" name is already in our database.
If so, produce an error message and do not add the name.

<p>Part of the trick is handling multiple record changes at once.
Admin is allowed to select any number of names and change any or all
or none of them at once.  I need to change the ones that can be
changed, not change the ones that already exist, and if there were
some invalid names, show that list and the reason it was invalid.

<p>The way SAS passes variables between screens and from pre-processor
to processor is the trick for me..

<p>Enjoy your great day!!!!

<p><img src='//b.robnugen.com/rob/wL-ROB.gif'>

