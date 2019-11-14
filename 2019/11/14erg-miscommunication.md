---
title: "erg miscommunication"
tags: [ "ab", "work" ]
author: Rob Nugen
date: 2019-11-14T13:37:50+09:00
---

My programming job is usually fun, especially when I successfully
upgrade their server to more stable architecture and, *ahem*, an OS
that still receives security updates.

I declared the upgrade as having been finished and let them know.

They found a couple of bugs afterward, which were due to upgrading
from PHP 5.6 to PHP 7.2.  (We had zero tests before this big upgrade
started, but I have added several.)

I fixed the bugs and charged for them, and now the client is like "We
did not expect or were not informed that certain functions would not
work after upgrading."

It was certainly not my intention for anything to not work, but I
cannot check everything; I am just one guy maintaining an old PHP
system.

I had a nice reply (with Tariq's help):


    I agree it does not make sense to have to pay for things that do
    not work after an upgrade. I believed and still believe the
    upgrade to be complete, and all the parts of the site
    working. That is always my intention that the site works as well
    or better than before.
    
    In actuality, maintaining the website and database should be at
    least a 2-person job.  One in charge of programming, and one in
    charge quality control. Due to budgetary and time constraints,
    unfortunately that is not feasible.  So I have to cover both tasks
    myself.
    
    I am working toward building an automated quality control system.
    This will reduce the amount human time needed on quality control,
    (but not completely eliminate it.  Machines are still not smart
    enough for that!)  The automated quality control system is still
    not complete.
    
    I understand your concerns, and I am continually striving to
    improve the system.  Under the current budgetary constraints, I
    cannot set a timeline for having the automated quality control
    system in place.
    
    - Rob


Boss Nate says I cannot tell them that I am just one person, because
"that is an internal thing and they don't care about that."

My *rough* draft after talking to Nate:

    Sorry. I admit that I made a mistake in communication.  I said
    that because I belived it was finished.  In reality these tasks
    were part of the overall upgrade.  I would have to do them and
    charge for them in August or September.  In this case I did not
    notice them in September and I did them in October.  So it should
    be these tasks would have to be paid already in the past.
    
    It is an ongoing project and I said it was done but it did not
    mean it is done done.  These should have been done then and should
    not be individually billed.  I am sorry I take it back that it was
    done but these things are ongoing work or job or tasks or
    whatever.

In my online men's circle today, I recognized all this is pointing to
stuff I "have to do" but do not want to do.  It reminds me of being 7
years old.

> be me
> be 7 years old
> not do homework
> teacher asks for homework
> no homework. am 7.
> teacher says to my face "I could just shoot you"
> be fucked up rest of life

So today I proverbially brought her into the circle and shredded some
papers while yelling at her stuff like "you can't fucking say that to
little kids!  You should not be teaching!  I passed your stupid class
without doing the homework so obviously it was not necessary!  You
want the homework?  Here you go!" and ripped paper to pieces and threw
it around like confetti.

So what am I going to do now?  Not worry about the email.

Okay, now that is out of the way, here it goes:

    I am sorry I made a mistake in communication.  I said the server
    upgrade was complete because I belived it was finished.  It is always
    my intention that the site works as well or better than before.
    Otherwise I will let you know as soon as possible.
    
    The tasks billed in October should have been done as part of the
    overall upgrade.  I would have to do them and charge for them in
    August or September.  In this case, I am sorry, but they were done and
    charged in October.
    
    The server upgrade is an ongoing project and I said it was done
    because the rest of the upgrade can wait.  I got the server upgraded
    to Ubuntu 18 using PHP 7.2.
    
    The rest of the upgrade is to have a system that knows how to check
    itself and never changes once it is deployed. That is my goal, but it
    takes time to make that possible. Because we don't have a system that
    completely checks itself, I try my best to check everything.  I am
    sorry these few things were missed.

I just sent that to Nate for review.  I look forward to having a
project manager.
