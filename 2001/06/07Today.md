---
title: Today
tags: 
author: Rob Nugen
date: 2001-06-07
---

<p class=date>5:59pm Thursday 7 June 2001</p>

<p>Today was a most excellent programming day.  We had
a request to accomodate Chinese names in our system
and not assume the user wants their name written as
"lastname, firstname."  Worked out a technique with
Kevin that requires only a tiny change to our username
database, allows lots of flexibility, and doesn't
require significant coding changes to the existing
programs.  (Yes, it does require a function call each
place we *used* to just write the names.)  We call a
function and it polls the database, returns a string
based on the user's preference, and based on a
parameter sent to the function call on whether to
return "firstname lastname" or "lastname, firstname." 
It basically just ignores the requested order for
Chinese and always returns "Lastname Firstname."</p>

<p>Nice.</p>

<p><img src="/images/rob/wL-ROB.gif"/></p>
