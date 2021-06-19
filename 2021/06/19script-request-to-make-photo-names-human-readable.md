---
title: "script request to make photo names human readable"
tags: [ "script", "fred" ]
author: Rob Nugen
date: 2021-06-19T08:59:44+09:00
draft: false
---

Hey Fred, can you make a Perl or BASH script for this?

### User story:

1. Be me.
2. Take photos with (phone) camera.
3. They magically go up to photos.google.com
4. Visit photos.google.com and checkbox the ones I want in a zip file
5. Download zipfile photos.zip
6. Rename zipfile to 2021_jun_21_my_cool_topic.zip
7. unzip zipfile
8. Photos magically end up in 2021_jun_21_my_cool_topic/
9. Photos still have stupid filenames.
10. Rename photos to 2021_jun_21_my_cool_topic_variant_foo.jpg

Can you create a script that helps with steps 6-10, given the following inputs?

### Human inputs:

1.  location of photos.zip
2.  value of $my_cool_topic

### Computer inputs:

1. unique filenames inside zip.

### Script pseudocode:

$TODAY = YYYY_mmm_dd format of today's date

Look for 4 digits at beginning of $my_cool_topic

If 4 digits are NOT there, prepend $TODAY to $my_cool_topic
(comment) Now $my_cool_topic has a date prepended either by human at script starttime or by script during runtime

Rename photos.zip to $my_cool_topic.zip

Unzip $my_cool_topic.zip into $my_cool_topic/

visit $my_cool_topic/

prepend each filename with $my_cool_topic

DONE
