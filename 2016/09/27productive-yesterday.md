---
title: productive yesterday
tags: [ "work" ]
author: Rob Nugen
date: 2016-09-27T04:57:58+09:00
---

## 04:57 Tuesday 27 September 2016 JST

After teaching in the morning, I pretty much spent all day playing
with Ansible.  I now have a vagrant installation that sets up ansible,
git, and
emacs on a vagrant box on my local machine which creates an ssh
keypair (half of which I manually copy to bitbucket).  I run setup and
it pulls in a git repo and runs setup on that, which asks for an
ansible-vault passphrase to unlock my AWS keys and gives me ansible
playbooks which I can run to set up VPC + subnet + internet gateway on
AWS, launch an ubuntu instance in the subnet, and install git on it.

Next steps will be to set up git the way I like (.aliases for gitl,
gitd, gits), install apache2 (to replicate existing box), set up a
couple of websites, including redmine.

At that point, (I will have to get from backup my redmine data, and
*then*) I will have replicated a box on AWS with Ansible!  Thank you,
Travis, for the initial idea, and thank you, Ansible team, for
Ansible, and thank you Justin for helping me set up Ansible on
vagrant!
https://sysadmincasts.com/episodes/43-19-minutes-with-ansible-part-1-4

I hereby promise to release the repos once I've cleansed all the
references to my workplace! (hopefully someone will still find it
useful by then!)
from Ansible by then hahaha)
