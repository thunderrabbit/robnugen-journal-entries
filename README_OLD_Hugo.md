Text files from Rob Nugen's journal.

Copyright 1970 - 2070 Rob Nugen

Because I have several journal entries, it takes a while for Hugo
to compile them into a site.  So I've split my journal entries off
my main site to keep build times low for the main site (events, etc)

Main Website Repository (MWR): https://github.com/thunderrabbit/barefoot_rob/

On my DH server, this repo is a submodule in a clone of my MWR, located at `~/barefoot_rob_journal` on branch `journal`

That clone's `.git/config` looks like this:

    [core]
            repositoryformatversion = 0
            filemode = true
            bare = false
            logallrefupdates = true
    [submodule]
            active = .
    [remote "origin"]
            url = git@github.com:thunderrabbit/barefoot_rob.git
            fetch = +refs/heads/*:refs/remotes/origin/*
    [branch "master"]
            remote = origin
            merge = refs/heads/master
    [submodule "content/journal"]
            url = git@bitbucket.org:thunderrabbit/robnugen-journal-entries.git
    [submodule "themes/purehugo"]
            url = https://github.com/dplesca/purehugo.git
    [branch "journal"]
            remote = origin
            merge = refs/heads/journal

On the same server, my MWR is located at `~/barefoot_rob_master`, on branch `master`
