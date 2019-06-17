---
title: "rewrote history of journal entry commit messages"
tags: [ "git", "journal" ]
author: Rob Nugen
date: 2019-06-17T06:22:49+09:00
---

##### 06:22 Monday 17 June 2019 JST

I wanted to swap the commas a bit so I rewrote the commit messages
with `git rebase 68a8c08`.  Now the top of `git log --oneline --graph --decorate
--all` looks like this (sans colorization):

    * 7dc0917 (HEAD -> master) back
    * 10b1b54 some,
    * 35be077 well,
    * 0bd1c8b several
    | * 84efab7 (norigin/master, github/master, bitbucket/master) some
    | * 143640e well,
    | * a8b25db several,
    |/
    * 68a8c08 years
    * 34b1460 ago
    * b62b05e when
    * 8f33818 he
    * 7ce3602 was

After writing this, I started composing a message on [english.stackexchange.com](https://english.stackexchange.com/)

    I am writing a story in which an US American man is being
    interviewed.  The man is relaying a story which happened in the
    past.  To describe how long ago it happened, he uses the word
    "some" and then wants to revise it to "several (years ago)."
    
    Without punctuation, it would be transcribed as
    
    ... that was back some well several years ago when he was still ...
    
    I am debating between adding commas to indicate pauses either as
    
    A. that was back some, well, several years ago when he was still ...
    
    or
    
    B. that was back some well, several, years ago when he was still ...

but ended up not posting it as there are several answers already.

* https://english.stackexchange.com/questions/199471/is-using-a-comma-as-a-pause-correct
* https://english.stackexchange.com/questions/402440/is-the-old-saying-put-a-comma-where-you-pause-a-reliable-way-to-punctuate-sent
