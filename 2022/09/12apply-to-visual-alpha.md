---
title: "apply to Visual Alpha"
tags: [ "application", "job" ]
author: Rob Nugen
date: 2022-09-12T09:06:19+09:00
draft: false
---

(written 09:06 Monday 12 September 2022 JST)

Hello Visual Alpha team!

My name is Rob Nugen; I'm an American with permanent residency in
Kawasaki, Kanagawa.  https://www.robnugen.com/

Your job posting for Senior Full-stack Software Engineer looks great
to me.  I helped build and have been maintaining a PHP website for 10
years, guiding it from PHP 5.6 back in 2012 and currently testing our
code in PHP 8.1 environment before deploying it in our production
environment on AWS.

Regarding eXtreme Programming, in the process of migrating the PHP
site above, I added testing processes (static testing with PHAN, and
dynamic testing using Codeception), and set up a staging server to
test deploys.  I've also moved the client's database OFF their web
server and moved it to RDS, which greatly simplifies upgrading the web
server to new versions of Ubuntu.

Now, with Vagrant, I can spin up a VM on my local machine,
automatically have it install Ansible on the VM and clone repos for
the static test environment and for launching a new EC2 server on AWS
then deploying code there.  It's not yet a perfect one-button
solution, and I haven't yet gotten to the point of "test with each
commit," but I'm getting there.

Regarding ETL; I had to import messy data a couple of times when
putting the website together.  The first time was converting client
data from their original system based on a proprietary database (not
MySQL).  This required importing CSV files encoded with Shift-jis,
cleaning and converting to UTF-8.

Regarding design, the cleansed data was important into my custom
designed MySQL database based on their data and requirements. In that
process I made most of their data 3rd Normal, allowing much greater
functionality plus dramatically faster searches.

Another ETL process was parsing hundreds of pages of html (not with a
regex https://stackoverflow.com/a/1732454) to create a list of all
train stations and lines in Tokyo.

Regarding leadership and teamwork; I have grown a peer-counseling
group in Tokyo, sponsored by Mankind Project USA.  It's all about
learning about one's self while gaining skills for conflict resolution
and living a life of integrity and accountability.
https://www.mkpjapan.org/

I have played with Node.js and React a bit, but not really used them
professionally.  I'm excited for this chance to improve my knowledge
with these technologies.

I've also often wondered about ways I can invest money while living in
Japan.  Your desire to "disrupt investment management industry" sounds
like you have a similar focus!

I'm light on awareness of investment management, which I see at the
top of your Desired Skills.  I have a coarse overview of the basics,
but not really details of fintech.

I have a Bachelor of Science in Computer Science, and plan to live in
Japan indefinitely.

   best regards
   - Rob
