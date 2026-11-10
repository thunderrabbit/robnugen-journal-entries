---
title: "Autonomous updates continue "
tags: [ "2026", "" ]
author: Rob Nugen
date: 2026-11-10T16:08:00+11:00
draft: false
---

[![2026 nov 10 sites with steps 1000](//b.robnugen.com/journal/2026/thumbs/2026_nov_10_sites_with_steps.png)](//b.robnugen.com/journal/2026/2026_nov_10_sites_with_steps_1000.png)

I've added several steps to my autonomous update mechanism, and realized this morning I was over engineering by tryna incorporate OS upgrades for systems I have on EC2.

I dropped that before falling into a big vacuous rabbit hole and progressed today with some scripts that collect changes made to packages' config files, and installing packages on next version of Ubuntu yayyyyy!