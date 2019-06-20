---
title: my slice of urbit on AWS
tags: [ "urbit" ]
author: Rob Nugen
date: 2016-06-03T22:09:42+09:00
---

## 22:09 Friday 03 June 2016 JST

Instructions basically from
[urbit on github](https://github.com/urbit/urbit)

Starting with Ubuntu 14.04 on a t2.micro (free! ?):

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install libgmp3-dev libsigsegv-dev openssl libssl-dev libncurses5-dev git make exuberant-ctags automake autoconf libtool g++ ragel cmake re2c
	sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=2048
	sudo chmod 0600 /var/swap.1
	sudo /sbin/mkswap /var/swap.1
	sudo /sbin/swapon /var/swap.1
	sudo su
	echo "/var/swap.1 swap swap defaults 0 0" >> /etc/fstab
	exit
	git clone https://github.com/urbit/urbit
	cd urbit
	make
	curl -o urbit.pill https://bootstrap.urbit.org/latest.pill

something something I think that was all.

	
