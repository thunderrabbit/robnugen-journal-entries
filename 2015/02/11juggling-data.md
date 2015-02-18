---
title: juggling data
tags: aws, ab
author: Rob Nugen
date: 2015-02-11
---

##09:33 Thursday 12 February 2015 JST##

Yesterday I worked several hours trying to get my AWS instance to talk
to an RDS instance on a VPC.  I set "Publically accessable" to true,
set the Security group to (wide open/allow the AWS instance security
group), but I still couldn't connect.

My great idea now is to create an AMI based on the AWS instance, then
spin up a new instance of the AMI in the same VPC as the RDS.  I'm 99%
sure that will solve the problem (for the major bulk of the data,
which doesn't change); then I just have to toss over a couple of
tables via PHPMyAdmin.

I hope that maintainer is making money; I've used the shit out of
PHPMyAdmin and never paid a bit.
