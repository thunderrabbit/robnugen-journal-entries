---
title: created security group on AWS with Ansible
tags: work
author: Rob Nugen
date: 2016-07-05T09:35:16+09:00
---

## 09:35 Tuesday 05 July 2016 JST

Thanks, Travis!

For a long time I got an error: `ERROR! 'ec2_group' is not a valid attribute for a Play`

# ERROR! 'ec2_group' is not a valid attribute for a Play

My `playbook.yml` looked fine to me:

    - name: Create security group
      ec2_group:
          name: "test_security_group"
          description: "Test security group"
          region: "ap-northeast-1"
          rules:
              - proto: tcp
                from_port: 22
                to_port: 22
                cidr_ip: 0.0.0.0/0
              - proto: tcp
                from_port: 80
                to_port: 80
                cidr_ip: 0.0.0.0/0
              - proto: tcp
                from_port: 443
                to_port: 443
                cidr_ip: 0.0.0.0/0
      register: basic_firewall

On the verge of creating a question on SO, I figured out the problem.
I had been using a portion of a role as a playbook.  So to triage and
get *something* working, my `playbook.yml`

    - hosts: localhost
      connection: local
      tasks:
        - name: Create security group
          ec2_group:
              name: "test_security_group"
              description: "Test security group"
              region: "ap-northeast-1"
              rules:
                  - proto: tcp
                    from_port: 22
                    to_port: 22
                    cidr_ip: 0.0.0.0/0
                  - proto: tcp
                    from_port: 80
                    to_port: 80
                    cidr_ip: 0.0.0.0/0
                  - proto: tcp
                    from_port: 443
                    to_port: 443
                    cidr_ip: 0.0.0.0/0
          register: basic_firewall
    
Can be run with `ansible-playbook playbook.yml`

The next step was to add a couple of variables:

    - hosts: localhost
      connection: local
      vars:
        security_group_name: testing
        aws_region: ap-northeast-1
        project_name: "test"
        my_ip: 1.2.3.4/32
      tasks:
        - name: Create security group
          ec2_group:
              name: "{{ project_name }}_security_group"
              description: "{{ project_name }} security group"
              region: "{{ aws_region }}"
              rules:
                  - proto: tcp
                    from_port: 22
                    to_port: 22
                    cidr_ip: "{{ my_ip }}"
                  - proto: tcp
                    from_port: 80
                    to_port: 80
                    cidr_ip: 0.0.0.0/0
                  - proto: tcp
                    from_port: 443
                    to_port: 443
                    cidr_ip: 0.0.0.0/0
          register: basic_firewall

Next next step will be to put it into a role, which is where the top
snippet should have been in the first place.
