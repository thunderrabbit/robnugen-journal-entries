---
title: hit it with a hammer solution
tags: code, perl
author: Rob Nugen
date: 2015-03-12T17:27:00+09:00
---

##17:27 Thursday 12 March 2015 JST##

For the md5 count thing, /u/Thespoian gave me a brilliant insite.
Whereas I had been trying to go through *all* the combinations of
uppercase/lowercase, first recursively, then with a "brillian"
bitshifting method, he had just been randomly selecting letters and
changing their case pseudorandomly.

I was going for user-friendly GUI.  My way (written in Javascript,)
was bloated, slow and often locked up Chrome.  He was going for
getrdone.  His way is quick a brilliant!  He sent me some code which I
modified below to deal with changing case in two subsections of the
string.

    #!/usr/bin/perl
    
     # Functional style
    use Digest::MD5 qw(md5 md5_hex md5_base64);
    
    
    $search=154;
    
    $p1 = "The strident guy ";
    $p2 = "strode";
    $p3 = " into the bar, and the punctual girl ";
    $p4 = "punched";
    $p5 = " it!";
    
    $len2 = length($p2);
    $len4 = length($p4);
    
    while (1){
       $count++;
       $pos =  int(rand($len2));
       if ($count %2) {
          substr ($p2, $pos, 1) = ucfirst ( substr ($p2, $pos, 1));
       } else {
          substr ($p2, $pos, 1) = lcfirst ( substr ($p2, $pos, 1));
       }
    
       $pos =  int(rand($len4));
       if ($count %2) {
          substr ($p4, $pos, 1) = ucfirst ( substr ($p4, $pos, 1));
       } else {
          substr ($p4, $pos, 1) = lcfirst ( substr ($p4, $pos, 1));
       }
    
       $try = $p1 . $p2 . $p3 . $p4 . $p5;
       $res =  md5_hex($try);
    
       if ($res =~ /$search$/) {
          print "count: $count  $res  - $search - answer: $try\n";
          exit;
       }
    }

I think I'll try to incorporate some aspect of this logic in my
code... but is that just going for bloat?  bah.

Hmmm actually I'm not sure how I'd explain to the script what I
wanted.

Right now I send it two things:

    ./md5nder.pl  "This string references a ADJECTIVE NOUN."  156

"This string references a ADJECTIVE NOUN." is my target template.  The
script will place consecutive adjectives and nouns into the template,
then hash the resulting strings to see if the hash ends with 156:

    3a69cefa82802a39c4e4f9c8eaac0156    ->   This string references a vulgar word.
    a32b170aa9dc979f3abbb6d5a7542156    ->   This string references a ritzy fat.
    07a47404f80c45dd18f8f8a439909156    ->   This string references a macabre name.
    14c294fddaff19c4ce8a67e80d6af156    ->   This string references a entertaining school.
    01f9ff03f0e5c1bee3d4f16059820156    ->   This string references a old practice.
    0fec2dd2e6fb778d608c310587230156    ->   This string references a handsome sense.
    eaa7d7d510fe336d741a803201f68156    ->   This string references a observant service.
    e74ce2db215c288aa8ff7cb452c58156    ->   This string references a noiseless house.
    ff77d7da707a5d95ad92f9bd746a4156    ->   This string references a slim house.
    205a06a3aeeecd83f93a6dfddc1ca156    ->   This string references a damp page.
    02302dbf19e4247ef16766806230c156    ->   This string references a erratic page.
    d2270e34f8729becc2d11d03887bc156    ->   This string references a paltry page.
    6114a4f1b1775ea76c254345f1b84156    ->   This string references a goofy test.

Because I have a list of like 1500 adjectives and 1000 nouns or
something, it has a million combinations to check, and finds a hash
match once out of about 4000 sentences.

But sometimes I want to have a template without changing the words in
the text.

I could send an extra parameter which says changing caps is okay, or a
more complex parameter which says which caps are okay to change.

Maybe I could tell it which words are okay to change:


This

    ./md5nder.pl  "This string references a ADJECTIVE NOUN."  156  010001

could mean it's okay to change the case of "string" and whatever nouns
were used as the last word.

I think I should use named parameters if I go much further than this.
