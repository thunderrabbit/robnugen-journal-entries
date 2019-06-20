---
title: productivent
tags: [ "work" ]
author: Rob Nugen
date: 2017-04-28T16:23:15+09:00
---

## 16:23 Friday 28 April 2017 JST

Last night AB was like "hey we cannot send emails."

They got a 500 error because I forgot to enable mcrypt to create
passwords for new users.

Enabled mcrypt and manually fixed some shit that didn't work due to
the 500 error.  Got everything sorted today and then ready to work but
denied because

the local VM in virtualbox does not have access to the internet.  So I
switched it to Bridged Adapter and all that, but still not access.
Fuckit.  Switched everything(*) back to how it was, and still no access.

(*) apparently not everything

damn.

Well, my box is behind the times anyway because it's Ubuntu 12 whereas
live server is now using Ubuntu 14.

So now I am trying to get Ansible to spin up a local server on
Virtualbox for me.

Starting here, cause I could not find anything else that seemed
remotely helpful.

https://atlas.hashicorp.com/geerlingguy/boxes/ubuntu1404

$ vagrant init geerlingguy/ubuntu1404; vagrant up --provider virtualbox

    Vagrant was unable to mount VirtualBox shared folders. This is usually
    because the filesystem "vboxsf" is not available. This filesystem is
    made available via the VirtualBox Guest Additions and kernel module.
    Please verify that these guest additions are properly installed in the
    guest. This is not a bug in Vagrant and is usually caused by a faulty
    Vagrant box. For context, the command attemped was:
    
    set -e
    mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant
    mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` vagrant /vagrant
    
    The error output from the command was:
    
    
    

$ vagrant plugin install vagrant-vbguest

    Installing the 'vagrant-vbguest' plugin. This can take a few minutes...
    Installed the plugin 'vagrant-vbguest (0.13.0)'!

Well okay the box is running, but I do not see how to connect to it,
much less from a sibling VM in Virtualbox.

Back when I first started messing with Vagrant and/or Ansible, I found
a Vagrantfile that would spin up multiple boxes and let them all
connect.

Smartagent, where was that tutorial?

Ah crap, you don't exist yet.

## 16:39 Friday 28 April 2017 JST

Yes yes, something like this
http://stackoverflow.com/questions/34444506/vagrant-multi-machine-provisioning

## 16:48 Friday 28 April 2017 JST

Found it.
https://github.com/jweissig/episode-45/blob/master/Vagrantfile

## 17:15 Friday 28 April 2017 JST

Now I have this gem

    (1..1).each do |i|
      config.vm.define "ab" do |node|
          node.vm.box = "ubuntu/trusty64"
          node.vm.hostname = "ab"
          node.vm.network :private_network, ip: "10.0.15.2#{i}"
          node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
          node.vm.provider "virtualbox" do |vb|
            vb.memory = "256"
          end
      end
    end

But dangit it keeps not being able to mount the directory /vagrant
inside the VM.

I am going to reboot my host machine and cross fingers and pray and
shake my head when nothing changes when it all comes back up.

## 17:29 Friday 28 April 2017 JST

Rebooted, put laundry in wash, ate a banana and some nuts.

## 18:07 Friday 28 April 2017 JST

Upgraded Vagrant, Virtualbox, vagrant-vbguest, but still cannout mount /vagrant.  I'm going to move on.

## 18:59 Friday 28 April 2017 JST

Fantastic.  Got my mgmt box talking to local new box via these handy instructions: https://sysadmincasts.com/episodes/45-learning-ansible-with-vagrant-part-2-4

## 21:03 Friday 28 April 2017 JST

Moe Joe.  Everything was going fine until install mysql.

    dependency problems prevent configuration of mysql-server:
    mysql-server depends on mysql-server-5.5; however: Package
    mysql-server-5.5 is not configured yet.

## 22:30 Friday 28 April 2017 JST

Thanks to this http://stackoverflow.com/a/32620242/194309 for getting
past that error.  (Needed to give more than 256MB memory to the
machine.  I gave it 512MB and it worked.)

          node.vm.provider "virtualbox" do |vb|
            vb.memory = "512"
          end

Downloading data from S3 now.

## 01:04 Saturday 29 April 2017 JST

Had to import a few by hand and skip some of the big historical
tables, but hooray I now have the frontend site working to the point
that it shows the site and I can log in.
