---
title: "Prepend photo names with their creation date"
tags: [ "photos", "journal", "humans", "website" ]
author: Rob Nugen
date: 2021-08-14T16:22:14+09:00
draft: false
---

(written 16:22 Saturday 14 August 2021 JST)

I like all my URLs to be as human readable as possible.

I also like having the date in the filename of my photos.

For a while I tried to solve it on my phone, but haven't found a way
to get photos named with the date instead of just DSC_nnnn.jpg for an
ever increasing value of nnnn.

Today I searched for things like `append exif date filename bash` and `add
exif date filename perl` to find this [date appending BASH one-liner](https://unix.stackexchange.com/a/43339/170430):

    for f in *; do mv -- "$f" "$f-$(stat -c %Y "$f" | date +%Y%m%d)"; done

However, for me (running Pop!OS), the above just renames the files
with today's date.  It seems that `| date` is ignoring the portion
coming from `stat`

The same question has an answer that (was updated(!) and) actually works for me.  Here is [Perl's rename used to append file date to filename](https://unix.stackexchange.com/a/43551/170430)

    rename -n 'BEGIN {use Date::Format; use File::Basename};
           die $! unless -f $_;
           my ($filename,$dirs,$suffix) = fileparse($_,qr/\.[^.]*/);
           next if (m/-\d{8}${suffix}$/);
           my $ts=(stat($_))[9];
           my $dt=time2str("%Y%m%d",$ts);
           s/${suffix}$/-${dt}${suffix}/;' *.txt

Above, `-n` means it shows us the plan.  In this case, to change DSC_1163.txt -> DSC_1165.txt-20210808

Then with a few tweaks, I made it the format I want:  DSC_1163.jpg -> 2021_aug_08_DSC_1163.jpg

    rename  'BEGIN {use Date::Format; use File::Basename};
           die $! unless -f $_;                                      # skip if file DNE
           my ($filename,$dirs,$suffix) = fileparse($_,qr/\.[^.]*/); # determine the filename
           next if (m/^d{4}_/);                                      # skip if 4 digits and underscore are already front of filename (4 digit year)
           my $ts=(stat($_))[9];                                     # get the modification date
           my $dt=lc(time2str("%Y_%b_%d",$ts));                      # convert date to lowercase yyyy_mmm_dd format
           s/${filename}/${dt}_${filename}/;' *.*                    # tell rename what to do
