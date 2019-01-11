---
title: "work and prep work"
tags: [ "work", "mkp", "ab" ]
author: Rob Nugen
date: 2019-01-10T13:55:38+09:00
---

##### 13:55 Thursday 10 January 2019 JST

One of the AB cronjobs has been throwing errors, but the job is still
running.

I am in the middle of refactoring the code to use Dependency
Injection; I don't know how I broke something, but I cannot really go
back to a previous version.  Rather, I don't know what version to go
back to, and my local dev environment cannot recreate the error.

Annoyingly, my local dev environment cannot even access Ye Olde
Interneffe so I cannot easily revert local files to a previous state
anyway.

    both frontend and backend use Localizer::getInstance in these
    classes. Inject it instead of reference Singleton

    ./Data/Unit.php
    ./DeviceHandler.php
    ./SiteHandler.php
    ./Template.php
    ./Translator.php

I am in the middle of doing `\Data\Unit`.  Perhaps once I finish that,
I can push, deploy, and pray.

There are 19 more places to change instantiations of `\Data\Unit`,
including in `\Factory\UnitFactory`.

I am curious if I misread or misunderstood the MLAPHP book which said
we are making small incremental changes.  This little change seems to
have blown up a bit, due to classes which instantiate `\Data\Unit` and
should eventually have its dependencies injected into them as well.
