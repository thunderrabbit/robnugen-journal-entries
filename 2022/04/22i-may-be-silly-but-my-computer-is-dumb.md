---
title: "I may be silly but my computer is dumb"
tags: [ "oops", "funny", "script" ]
author: Rob Nugen
date: 2022-04-22T13:39:26+09:00
draft: false
---

(written 13:39 Friday 22 April 2022 JST)

Good news!

I wrote a script that helps me easily compile journal entries from
last year.   What took hours before now can be done in a couple
minutes.  Look at the how quickly I was able to finish these!

    commit 2e8e7bd1d78aa79dca39fb45ffa8207e10d56aad (HEAD -> master)
    Author: Rob Nugen
    Date:   Fri Apr 22 13:34:37 2022 +0900

        Day 24: Wow wow I made it!

    commit d766816b25db02405607b1cec8b0d3da0cf7dcec
    Author: Rob Nugen
    Date:   Fri Apr 22 13:31:18 2022 +0900

        Day 23: Met Daisuke and Hiroe and Restaurant Goo Goo

    commit 240a0c91ec4e3fe89381bb2aef824c49757230c6
    Author: Rob Nugen
    Date:   Fri Apr 22 13:27:47 2022 +0900

        Day 22: Walked Straight for Fourteen Kilometers

    commit 238b3dd76bece293b2ed957e344b837a1e122e2d
    Author: Rob Nugen
    Date:   Fri Apr 22 13:25:44 2022 +0900

        Day 21: Ugh so tired and saw a rat snake

    commit 8876875f75e5a5cf774943cab94e527fd5836aab
    Author: Rob Nugen
    Date:   Fri Apr 22 13:22:20 2022 +0900

        Day 20: feeling sad and saw Myokan Weir

    commit 4f0ed69d841c5c5247b1e739b241fee268292c7a
    Author: Rob Nugen
    Date:   Fri Apr 22 13:14:31 2022 +0900

        Day 19: lovely rivers and Canak's Pizza

    commit 303878167e57104decd0429b51371984d1dc2a8a
    Author: Rob Nugen
    Date:   Fri Apr 22 13:10:01 2022 +0900

        Append Day 18 summary to day 18

In just 24 minutes I was able to do what would have taken dayyssss to
do otherwise.  Possibly weeks given how busy life gets.

Everything finished and then suddenly realized something was weird.

If this URL works
https://github.com/thunderrabbit/barefoot_rob/tree/2e8e7bd1d78aa79dca39fb45ffa8207e10d56aad/content/books/slow-down
look at days 18-24.  They are basically the same content after the
title and first big picture.  D'oh!

Notice anything awry with [this line](https://github.com/thunderrabbit/barefoot_rob/blob/2e8e7bd1d78aa79dca39fb45ffa8207e10d56aad/rpl/Functions.pm#L70)?  Hmmmmmmmmm???

    return get_list_of_files_in_dir("/home/thunderrabbit/barefoot_rob_master/content/quests/walk-to-niigata/2021/05","03");

I [fixed the line](https://github.com/thunderrabbit/barefoot_rob/blob/75fd1dac91f710e8be5b726a5789320b2ea2a518/rpl/Functions.pm#L70).

    return get_list_of_files_in_dir($path_portion,$dd_portion);

Before I fix all the entries, I'm going to take a nap.