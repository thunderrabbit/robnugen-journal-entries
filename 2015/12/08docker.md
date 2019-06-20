---
title: docker
tags: [ "hmm" ]
author: Rob Nugen
date: 2015-12-08T18:43:59+09:00
---

## 18:43 Tuesday 08 December 2015 JST

Some docker success!  I have little time, so I copied and pasted from http://core0.staticworld.net/assets/media-resource/16373/ifw_dd_docker.pdf
(which is out of date already) so used the script name 'startapache'
but I don't have internizzle access atm so I just made the script echo
'your mom'

That's amazing in its own right (a container that looks like a
machine, running on my machine!) but the next steps, I was able to
save a copy of the machine and run a new instance of the machine,
which still had the entire state of the machine inside it (well, the
history file, at least).

Very very interesting!   (N.B.  from the output of the `docker ps -a`
commands below, I have cropped the empty `PORTS` column to help the
output fit more easily without added soft linebreaks.)

    silver-monkey:journal thunderrabbit$  docker run -i -t --name= ubuntu bash
    root@b157e6812d19:/# echo "echo 'your mom'" >  /usr/local/sbin/startapache.sh
    root@b157e6812d19:/# chmod +x /usr/local/sbin/startapache.sh
    root@b157e6812d19:/# /usr/local/sbin/startapache.sh
    your mom
    root@b157e6812d19:/#
    root@b157e6812d19:/# exit
    exit
    silver-monkey:journal thunderrabbit$ docker ps -a
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                            NAMES
    b157e6812d19        ubuntu              "bash"              About a minute ago   Exited (0) 4 seconds ago          big_euclid
    1f0a9ef868c1        ubuntu              "bash"              3 minutes ago        Exited (0) 3 minutes ago          farty_cats
    7c982a2aef79        ubuntu              "/bin/bash"         4 minutes ago        Exited (0) 3 minutes ago          farty_dog
    fc56186d1077        ubuntu              "/bin/bash"         4 minutes ago        Exited (0) 4 minutes ago          farty_cat
    58dcc4a1e05a        ubuntu              "/bin/bash"         10 minutes ago       Exited (0) 10 minutes ago         hungry_kilby
    9fa98d56e382        ubuntu              "/bin/bash"         15 minutes ago       Exited (1) 12 minutes ago         mad_swirles
    fb0b33a4b72e        ubuntu              "/bin/bash"         15 minutes ago       Exited (0) 15 minutes ago         prickly_ramanujan
    e9f1c8f2ac94        hello-world         "/hello"            25 minutes ago       Exited (0) 25 minutes ago         silly_liskov
    7e02cec2cd60        hello-world         "/hello"            8 hours ago          Exited (0) 8 hours ago            trusting_wozniak
    eca6b86c5b8e        ubuntu              "bash"              43 hours ago         Exited (0) 41 hours ago           admiring_bose
    d06330bd2304        ubuntu              "bash"              44 hours ago         Exited (1) 43 hours ago           fervent_banach
    d1d45a3a8f5c        hello-world         "/hello"            44 hours ago         Exited (0) 44 hours ago           distracted_snyder
    silver-monkey:journal thunderrabbit$ docker commit big_euclid local:big_euclid
    3b7bfafc875be32a7f0dfd846e2e4945f43946e0b8cd5351348eb78cdbe3cd54
    silver-monkey:journal thunderrabbit$  docker run -i -t ubuntu bash
    root@5ea306b2538d:/# exit
    exit
    silver-monkey:journal thunderrabbit$ docker ps -a
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                                NAMES
    5ea306b2538d        ubuntu              "bash"              9 seconds ago       Exited (0) 6 seconds ago              angry_jennings
    b157e6812d19        ubuntu              "bash"              2 minutes ago       Exited (0) About a minute ago         big_euclid
    1f0a9ef868c1        ubuntu              "bash"              5 minutes ago       Exited (0) 4 minutes ago              farty_cats
    7c982a2aef79        ubuntu              "/bin/bash"         5 minutes ago       Exited (0) 5 minutes ago              farty_dog
    fc56186d1077        ubuntu              "/bin/bash"         5 minutes ago       Exited (0) 5 minutes ago              farty_cat
    58dcc4a1e05a        ubuntu              "/bin/bash"         12 minutes ago      Exited (0) 12 minutes ago             hungry_kilby
    9fa98d56e382        ubuntu              "/bin/bash"         16 minutes ago      Exited (1) 13 minutes ago             mad_swirles
    fb0b33a4b72e        ubuntu              "/bin/bash"         17 minutes ago      Exited (0) 17 minutes ago             prickly_ramanujan
    e9f1c8f2ac94        hello-world         "/hello"            27 minutes ago      Exited (0) 27 minutes ago             silly_liskov
    7e02cec2cd60        hello-world         "/hello"            8 hours ago         Exited (0) 8 hours ago                trusting_wozniak
    eca6b86c5b8e        ubuntu              "bash"              43 hours ago        Exited (0) 41 hours ago               admiring_bose
    d06330bd2304        ubuntu              "bash"              44 hours ago        Exited (1) 43 hours ago               fervent_banach
    d1d45a3a8f5c        hello-world         "/hello"            44 hours ago        Exited (0) 44 hours ago               distracted_snyder
    silver-monkey:journal thunderrabbit$  docker run -i -t local:big_euclid bash
    root@55c4471bfd74:/# /usr/local/sbin/startapache.sh
    your mom
    root@55c4471bfd74:/#
	root@55c4471bfd74:/# exit
    exit
    silver-monkey:journal thunderrabbit$ docker ps -a
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                           NAMES
    55c4471bfd74        local:big_euclid    "bash"              5 minutes ago       Exited (0) 2 seconds ago         lonely_aryabhata
    5ea306b2538d        ubuntu              "bash"              9 seconds ago       Exited (0) 6 seconds ago         angry_jennings

(snip)



