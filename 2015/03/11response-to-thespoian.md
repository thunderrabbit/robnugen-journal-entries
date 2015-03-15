---
title: response to Thespoian
tags: meta, md5, cheater
author: Rob Nugen
date: 2015-03-11 18:44 JST
---

##18:44 Wednesday 11 March 2015 JST##

> for each kind of nonce

What does "nonce" mean in this context?  I thought it was a single-use
secret number, but it looks like you mean token.. ??

> select the method based on tokens present

Basically that's what I did: put tokens in the string and make the
script brute force through every combination, substituting values in from
lists.

I slap all the token options into arrays and then each array is asked
for its "next" token when needed. A manager-hash keeps track of which
index each particular array is on, then loops through them because it
knows how many items are in each array.


I should make an interface(?) so each type can keep track of its own
"next"...  but even so, I think I still need an over-arching list of
how many are in each list.

Unless the token interfaces can spit back the number of items remaining each time.  (Can Perl return two variables at once?)

That reminds me..  Your version 3 script was quite simple; spin
through a counter.  But your version 2 script seemed more complex!
Loop through each upper/lower-case version of each letter?  Only way I
can think to do that is recursively.  I wonder how you did it!
(recursive or not?)  If there's a non-recursive way to do it, I
haven't thought of it yet.

 *.... thinking occured here ....*

Oh I know a good way.

    length = length of string
   
    looper =  (0 to 2^length) {
        look at each of looper's bits / and each of string's letters
        0: make lowercase letter
        1: make capital letter
        check hash
    }

Hmmm if javascript can look at bits like that, I will rewrite my
recursive online cheater.  Thanks for the inspiration!

Before this, I hadn't ever had a reason to use bit-shifting
operations.  Whoohooo!!


I think for the command-line Perl version, I'll send an optional regex
of letters that may have their capitalization changed.  It that regex
is received, I ... oh good grief that's complicated (and will spew out
soooo many matches!!!)  nevermind(?)

