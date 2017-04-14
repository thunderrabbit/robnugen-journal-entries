---
title: plan
tags: work
author: Rob Nugen
date: 2017-04-14T10:02:07+09:00
---

## 10:02 Friday 14 April 2017 JST

Because it takes 5 hours to import the data in my reliable way, I will
not recreate the machine from scratch in Tokyo region.

I'll finish it up in California and then move it over to Tokyo.

steps

1. add cron jobs
2. change the domains to correct domains
3. make an AMI of the box
4. copy it to Tokyo
5. spin it up
6. copy latest data changes over
7. point DNS to new box
8. activate SSL

Step One requires

1. ~~copy cron scripts from live server to local machine~~
5. ~~Create role to deploy them on vagrant box~~
6. ~~create playbook to run role~~
2. ~~copy them into vagrant box (role/templates)~~
3. ~~remove them from local machine~~
4. ~~ansible-vault encrypt them on vagrant box~~
10. ~~Create new mysql backup user~~
11. ~~Create new mysql log_deleter user~~
12. ~~Save changes that created users~~
8. ~~tell role to copy scripts to server~~
9. have the role create the crontab
7. run playbook

Step Two requires a few steps for me to feel comfortable with it

1. change the domains to different test sub-domains
2. ensure I can activate SSL on them
3. run tests on the sites
4. change the domains to correct domains

Step Six requires telling Ansible to talk to servers in a different
region, which I can probably do in realtime without testing (because
I won't have activated DNS on the box yet).
