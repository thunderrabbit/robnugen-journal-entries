---
title: setting up Netbeans
tags: [ "hmm" ]
author: Rob Nugen
date: 2015-07-07T17:16:20+09:00
---

## 17:16 Tuesday 07 July 2015 JST

I don't remember how I did this on the Debian box, and can't seem to
quickly find notes, but here are new notes.

I downloaded Netbeans from
https://download.oracle.com/otn-pub/java/jdk-nb/8u45-8.0.2/jdk-8u45-nb-8_0_2-macosx-x64.dmg

but it doesn't have PHP as an option when I click New Project, so I'm going to try downoading
https://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-php-macosx.dmg

~~Crud.  That didn't seem to help.~~

That worked after restarting Netbeans!   I wonder if I didn't need to
download the second thing and just needed to restart Netbeans...

Headed to Mutsumis' lessons now.

At comveni after solving the puzzle I couldn't solve last week at the
toy store!  Photos were taken to commemerate the moment.

1. Clone the source code locally
1. Create new project
1. Choose PHP
1. Choose PHP Application with Existing Source
1. Click Next
1. Cut-n-paste path to repo in Sources Folder
1. Confirm Put NetBeans metadata... is selected
1. Click next
1. Configure Run As Remote Web Site
1. Create entry in /etc/hosts file
1. Copy /etc/hosts url into Project URL
1. Create new Remote Connection (if necessary)
1. Choose existing Remote Connection (otherwise)
1. Choose "On Save" for Upload Files
1. Check that the Upload Directory matches that on virtual box
1. Click Finish

## 0:54am Wednesday 8 July 2015

Make sure virtualbox settings has a Host Only adapter
Use that Host only adapter in the machine specific settings

