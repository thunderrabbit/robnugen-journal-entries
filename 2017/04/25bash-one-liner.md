---
title: bash one liner
tags: bash
author: Rob Nugen
date: 2017-04-25T08:32:34+09:00
---

## 08:32 Tuesday 25 April 2017 JST

I sent this to Fred yesterday:

    I often type `gits` to get the status of git.
    
    There is one directory on my filesystem that has a filename
    starting with 0x0x which I must not commit to git, but I need to
    see each time I get git status.
    
    I wrote this
    
        alias gits='git status; if [[ -f 0x0x* ]]; then echo; ls -1 0x0x*; fi'
    
    And it works to *not* complain if there is no 0x0x* file, but does
    not show the file if it is present.
    
    The problem is prolly small; can you fix this with just an alias?

Fred sorted it out last night.  I replied inline:

> alias gits='git status; if test -n "$(find . -maxdepth 1 -name 0x0x\*
-print -quit)"; then echo; ls -1 0x0x*; fi'

Sweet!  It works well.

> Escape the * the first time, but not the second time.

because the first one is in the $()  ?

> A couple gotchas that were emerging with your solution is that if
> there is more than one match, the -f won't work.  Maybe right now
> you never have that, but let's fix it while we're here.


Definitely going to be more than one, so thank you for solving it!  In
fact, if the ls at the end could ignore files ending with ~, that
would be great.

> We can set 'shopt -s nullglob' which "allows patterns which match no
> files (see Pathname Expansion above) to expand to a null string,
> rather than themselves."  But that's a bash-wide thing that might
> bleed into your regular commands, so that's too risky.

yeah that sounds spooky.

> I thought of writing it as a command, instead of an alias, where we
> can take the time to do a lot of checking and shit, instead of being
> short and sweet.  Then I tried some other dumb ideas that I've
> already forgotten now, and finally decided to hit stackoverflow,
> with what appeared to be the main issue: we need only to know if the
> glob matches, not what the match is, or how many there are. So I
> googled "bash if glob matches"
>
> There are a few good solutions, and a good explanation of why each
> is useful here:
>
> https://stackoverflow.com/questions/2937407/test-whether-a-glob-has-any-matches-in-bash
> 
> The one you want is probably
> 
>     if test -n "$(find . -maxdepth 1 -name 'glob*' -print -quit)"
>     then
>         echo found
>     else
>         echo not found
>     fi
>
> for portability, and familiarity with tools you already know.

Yay for tools I already know!

> To put that solution in an alias, the quoting is awkward.  The glob
> is already nested inside ", ', and $(.  The alias command wants
> another nesting, and I'm out of quotes.  So I removed the quotes
> around the glob and escaped it instead.  That worked.  (Escaping the
> quotes didn't for some reason.)

Write a new RFC to allow 「 」as quotes in bash!

> So, your solution is as at the top.


Yahoooo, as is my thanks!  Thanks for putting it at the top, cause I
gotta get back to work!
