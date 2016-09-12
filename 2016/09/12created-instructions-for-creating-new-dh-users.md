---
title: Created instructions for creating new DH users
tags: dreamhost
author: Rob Nugen
date: 2016-09-12T23:13:14+09:00
---

## 23:13 Monday 12 September 2016 JST

https://github.com/thunderrabbit/new-DH-user-account

# New Dreamhost user account

This essentially spells out the tasks I do each time I set up a new user with shell access on Dreamhost.

It sets up `git`, `emacs`, and passwordless authentication, then essentially disables password logins by creating a random 132 character password and helpfully forgetting it.

In the steps below, replace `example.com` with your new domain.

## Set up the new domain

From Dreamhost Control Panel -> Domains -> Manage Domains -> [Add Hosting to a Domain / Sub-domain](https://panel.dreamhost.com/index.cgi?tree=domain.manage&current_step=Index&next_step=ShowAddhttp&domain=)

Fill in the blanks, including create a new user.

Make note of the password created by Dreamhost.  We will need it where PASSWORD is written below.

## Give shell access to the user

Make sure the new user is a shell user at https://panel.dreamhost.com/index.cgi?tree=users.users

## On local machine, create a new `ssh` key
    ssh-keygen

Enter `example.com` as the key filename

Move the keypair to `~/.ssh`

## On local machine, set up ~/.ssh/config

Append something like the following to `~/.ssh/config`:

    Host example
        HostName example.com
        User example
        IdentityFile ~/.ssh/example.com

## scp the public key to the new account using PASSWORD:

    scp ~/.ssh/example.com.pub example:authorized_keys

## ssh to the new account using PASSWORD:

    ssh example

## While on the new account, clone this repo:

    git clone https://github.com/thunderrabbit/new-DH-user-account.git

## Set up the account and passwordless entry

    cd new-DH-user-account
    ./setup.sh

## Exit the account

    exit

## ssh to the new account without password

    ssh example

It's very very important you log in without password here!

## Basically destroy password logins

    cd $HOME/new-DH-user-account
    ./password_fix.sh

Enter PASSWORD when requested

Now your password is 132 random characters.  It can be reset in control panel (to a measly 31 characters) but the point is to never user passwords to log in.

## If everything worked, then cleanup

    cd $HOME
    $HOME/new-DH-user-account/cleanup.sh

I created these steps after my old Dreamhost account got hacked and
needed to create new accounts.
