---
title: "State of My Life Address"
tags: [ "nov", "2021", "soml" ]
author: Rob Nugen
date: 2021-11-03T08:48:48+09:00
draft: false
---

(written 08:48 Wednesday 03 November 2021 JST)

1. Right now I am on a voice over IP call with Fred (using
https://jitsi.org/) as he looks at his SSL setup on some servers.  We
got the first bit sorted by changing his git repo to access the
remotes via git (ssh) instead of https.

##### 09:06

2. Success!  He worked out that it was his very own laptop causing the
problems.  He apparently had a local key that had expired which made
his site SSL appear to be expired even though it was fine.

3. I have re-started working on Pop Pop Chaos.  At this point, I am
able to click circles, have the local JS guess how they should react
(increase radius by 4) and then the server gets a chance to override
(increase radius only by 1), which causes the circles to increase in
size then decrease to their correct size.  It can be hacked because
the server is told how big the radius is, so if we double-click
(before the server can tone down the radius), the server agrees with
the larger radius.

4. I am using [Slim Framework](https://www.slimframework.com/) and
going through a tutorial or two to tutor my computer to be an API for
Pop Pop Chaos.

5. I got to the word "tutor" above before leaving this SOML 15 days
ago.