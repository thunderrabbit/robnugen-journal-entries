---
title: "How to set the server key on Brother scanner"
tags: [ "brother", "scanner", "server", "key", "how to" ]
author: Rob Nugen
date: 2019-08-08T13:07:20+09:00
---

##### 13:07 Thursday 08 August 2019 JST

Dreamhosts lists their server key as something like

canyonville.dreamhost.com,64.90.48.21 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABA......

But in order to install it on my Brother printer for its scan-to-sftp
function, the key needed to start with ssh-rsa.  So I removed
"canyonville.....21" from the front of the key and it works fine.

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnJdr5AbHwfaU+F+pv4BzcgNnPBBvbCh7......

Is Dreamhost confused about how to show their server keys?  Is Brother
behind the times in accepting latest standards?

Dunno, but the printer can scan to my image server again.
