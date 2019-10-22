---
title: "playing with AWS for sbs.net"
tags: [ "aws", "work" ]
author: Rob Nugen
date: 2017-11-15T12:27:25+09:00
---

## 12:27 Wednesday 15 November 2017 JST

Not actually sbs.net, but yes actually AWS.  Using Ansible again,
thanks to Travis having suggested it to me.

Right now as I write this entry, <del>AWS</del> <ins>my wifi in this
cafe</ins> is being slow to realize that my
VPC is already created.  Not sure why, as it was fast a moment ago.

Yep it just timed out.

    The error was: ssl.SSLError: The read operation timed out

Previously, I was getting

    Invalid type for parameter AvailabilityZone, value: None

When actually I was sending no value at all.  Someone else reported
[ec2_vpc_subnet subnet creation fails due to az parameter validation error](https://github.com/ansible/ansible/issues/31905).
Thanks, OP!

Yay, now it works because I specified `az: ""`

    - name: Create subnet
      ec2_vpc_subnet:
        vpc_id: "{{ vpc.vpcs.0.id }}"
        cidr: "{{ vpc_subnet }}"
        region: "{{ ec2_region }}"
		az: ""
        tags:
          Name: "{{ vpc_subnet_name }}"
