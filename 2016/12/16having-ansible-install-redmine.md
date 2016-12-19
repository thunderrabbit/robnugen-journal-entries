---
title: having Ansible install redmine
tags: work
author: Rob Nugen
date: 2016-12-16T20:01:29+09:00
---

## 20:01 Friday 16 December 2016 JST

Here's the error:

    TASK [redmine-ansible : Change admin default account] **************************
    fatal: [54.175.38.243]: FAILED! => {"changed": true, "cmd": "ruby
    script/rails runner -e production 'user = User.find(:first,
    :conditions => {:admin => true}) ;
    user.mail=\"youradmin@robnugen.com\";
    user.salt_password(\"redmine\"); user.save!'", "delta":
    "0:00:00.033956", "end": "2016-12-16 10:58:40.837395", "failed":
    true, "rc": 1, "start": "2016-12-16 10:58:40.803439", "stderr":
    "ruby: No such file or directory -- script/rails (LoadError)",
    "stdout": "", "stdout_lines": [], "warnings": []}
    to retry, use: --limit @/home/vagrant/create-server-on-aws/US_EAST_030_website_redmine.retry

Here's the line:

shell: chdir="/usr/share/redmine" ruby script/rails runner -e production 'user = User.find(:first, :conditions => {:admin => true}) ; user.mail="youradmin@robnugen.com"; user.salt_password("yourmom"); user.save!'
