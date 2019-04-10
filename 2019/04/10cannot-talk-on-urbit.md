---
title: ";join ~dopzod/urbit-help ... but still not connected to talk"
tags: [ "urbit", "talk", "first", "rabsef-linmyn" ]
author: Rob Nugen
date: 2019-04-10T23:14:08+09:00
---

##### 23:14 Wednesday 10 April 2019 JST

I tried **;join /urbit-talk**

I then followed [this tweet](https://twitter.com/zodisok/status/1115149217972887557) **;join ~dopzod/urbit-help**

But when I type in the talk> field, I do not see my posts anywhere.

Later I saw 

    [%dead-request [i=//http/0v14.urbt1/36/1 t=~]]

log is below:


    $ urbit rabsef-linmyn/
    ~
    urbit 0.7.3
    boot: home is /Users/thunderrabbit/urbit/rabsef-linmyn
    loom: mapped 2048MB
    boot: protected loom
    live: loaded: MB/254.885.888
    boot: installed 258 jets
    arvo: time: ~2019.4.10..13.36.55..1b86
    rest: checkpoint at event 13.574
    rest: old 0v14.12dmh, new 0v14.urbt1
    boot: loaded passcode from rabsef-linmyn/.urb/<snip>
    ---------------- playback starting----------------
    rest: checkpoint is up-to-date
    ---------------- playback complete----------------
    http: live (insecure, public) on 8080
    http: live (insecure, loopback) on 12321
    ames: czar zod.urbit.org: ip .35.185.212.189
    --------------| ;join /urbit-help
    ~rabsef-linmyn[hall]: failed (re)subscribe to ~binzod on
                          /circle/urbit-help/config-l/group-l/grams/~2019.4.9..13.37
                          .19..3202
                   attached: stack trace
    --------------| ;join ~dopzod/urbit-help
    ; ~dopzod not responding still trying
    --------------| :: onn ~dopzod/urbit-help
    --------------| bound '>' {[hos=~dopzod nom=%urbit-help]}
    ; ~dopzod is ok
    ; ~dopzod is your neighbor
    --------------| ;join ~dopzod/urbit-help
    ; ~binzod not responding still trying
    > (add 2 2)
    4
    [%dead-request [i=//http/0v14.urbt1/36/1 t=~]]
    ~rabsef-linmyn:talk>
