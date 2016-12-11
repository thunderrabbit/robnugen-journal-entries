---
title: work
tags: work
author: Rob Nugen
date: 2016-12-11T10:20:11+09:00
---

## 10:20 Sunday 11 December 2016 JST

This weekend I've continued working on ansible playbooks to spin up
EC2 instance, update the packages, install a couple websites (these
sites are why I haven't released the playbooks), and now I'm trying to
get redmine installed.

I found
[radamanth/redmine-ansible](https://github.com/radamanth/redmine-ansible)
and tried to use it.

It depends on
[radamanth/mysql-ansible](https://github.com/radamanth/mysql-ansible)
but it doesn't work on Ubuntu 16 server.

So I'm going to see if I can get sbstrm/redmine-ansible working on top
of
[geerlingguy/ansible-role-mysql](https://github.com/geerlingguy/ansible-role-mysql),
which does work on Ubuntu 16 server.
