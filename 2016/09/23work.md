---
title: work
tags: [ "work" ]
author: Rob Nugen
date: 2016-09-23T10:47:48+09:00
---

## 10:47 Friday 23 September 2016 JST

I'm working with Ansible again today.  I'm creating a set of three
repos.  One sets up a vagrant box on my local machine and then clones
the second repo inside the machine.

The second repo will set up VPC and subnet and internet gateway on AWS
then spin up a box in a public subnet.  It will clone the third repo
on that box.

The third repo will set up boxes for my other clients on AWS, on both
public and private subnet.

Right now as I write, I'm letting `vagrant up` finish for the first
time after splitting my one repo which is now the first two repos
described above.  The box has finished starting so now I need to look
inside and make sure it all looks right.

## 10:53

Awww oops. I got a bit too zealous with my extraction.  Need to move
my ansible-crypt files back to the first repo.

Actually it's fine.  It makes sense to have the AWS keys in the same
repo that will first talk to AWS.
