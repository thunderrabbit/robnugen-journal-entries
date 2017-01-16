---
title: (solved) Ansible incorrect values in usr share redmine config database.yml
tags: work
author: Rob Nugen
date: 2017-01-15T03:29:28+09:00
---

## 03:29 Sunday 15 January 2017 JST

now it's 3:29.  fuck this I'm going to bed.

for some reason I can't figure out what command added the database config file that I want on my new server

I have some old copies of the new server and on one of them the database is configured properly.  But when I ran through (what I thought were) the same steps again, the database is not configured.

tomorrow I'm going to restart all the servers I have, grab copies of their .bash_history files and try to figure out if one of the servers had an extra step added or something.
good night


## 09:38 Sunday 15 January 2017 JST

For some reason, my Ansible playbook to install redmine suddenly stopped creating  `/usr/share/redmine/config/database.yml` with the correct values.

Desired:

    ubuntu@ip-10-0-165-169:~$ sudo cat /usr/share/redmine/config/database.yml
    production:
      adapter: mysql2
      database: redmine
      host: localhost
      port:
      username: redmine
      password: U28m6gPfYrquLXOn9Sq6CSx3lgxOYwM0kajuy
      encoding: utf8

Actual:

    ubuntu@ip-10-0-204-194:~$ sudo cat /usr/share/redmine/config/database.yml
    production:
      adapter: sqlite3
      database: /var/lib/dbconfig-common/sqlite3/redmine/instances/default/redmine_default
    # host: localhost
    # port:
    # username: redmine_default
    # password:
      encoding: utf8

Using `git log -SU28m6gPfYrquLXOn9Sq6CSx3lgxOYwM0kajuy` I determined
when I had put the password in place, and therefore the max I would
have to go back in time to find the source of the problem.

So, it turns out that I incorrectly used `become` when storing values with `/usr/bin/debconf-set-selections`

As I'm writing this, I realize it's probably of zero use to anyone, but this line was the problem:

    - name: Redmine | Set debconf vars redmine root passwd
      shell: echo redmine redmine/instances/default/mysql/admin-pass password "{{ mysql_root_password }}" | /usr/bin/debconf-set-selections
        become=true
    
    - name: Redmine | Set debconf vars redmine/instances/default/db/app-user
      shell: echo redmine redmine/instances/default/db/app-user string "{{ redmine_db_login }}" | /usr/bin/debconf-set-selections
        become=true
    
    - name: Redmine | Set debconf vars redmine app-pass passwd
      shell: echo redmine redmine/instances/default/mysql/app-pass password "{{ redmine_db_passwd }}" | /usr/bin/debconf-set-selections
        become=true
    
    - name: Redmine | Set debconf vars redmine db types
      shell: echo redmine redmine/instances/default/database-type select mysql | /usr/bin/debconf-set-selections
        become=true
    
    - name: Redmine | Set debconf vars redmine db name
      shell: echo redmine redmine/instances/default/db/dbname string "{{ redmine_db_name }}" | /usr/bin/debconf-set-selections
        become=true

Replacing with these lines fixed the problem:

    - name: Redmine | Set debconf vars redmine root passwd
      shell: sudo echo redmine redmine/instances/default/mysql/admin-pass password "{{ mysql_root_password }}" | sudo /usr/bin/debconf-set-selections
    
    - name: Redmine | Set debconf vars redmine/instances/default/db/app-user
      shell: sudo echo redmine redmine/instances/default/db/app-user    string  "{{ redmine_db_login }}" | sudo /usr/bin/debconf-set-selections
    
    - name: Redmine | Set debconf vars redmine app-pass passwd
      shell: sudo echo redmine redmine/instances/default/mysql/app-pass password "{{ redmine_db_passwd }}" | sudo /usr/bin/debconf-set-selections
    
    - name: Redmine | Set debconf vars redmine db types
      shell: sudo echo redmine redmine/instances/default/database-type select mysql | sudo /usr/bin/debconf-set-selections
    
    - name: Redmine | Set debconf vars redmine db name
      shell: sudo echo redmine redmine/instances/default/db/dbname  string  "{{ redmine_db_name }}" | sudo /usr/bin/debconf-set-selections
