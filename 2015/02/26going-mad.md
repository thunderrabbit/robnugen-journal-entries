---
title: going mad
tags: code, design
author: Rob Nugen
date: 2015-02-26 17:39 JST
---

##17:39 Thursday 26 February 2015 JST##

I'm not really going mad, but I realize the code I am trying to write
for the MD5 count thing is like a madlib.  I want to take a string and
replace tokens with example words.

Only difference: I want to do a combination of *all* the options.
Essentially

    foreach adjective in my list of adjectives:
        for each noun in my list of nouns:
     	    fill in the adjective and noun in template

So I end up with length-adjectives * length-nouns sentences, each of
which I will md5 and see if it can work for the next MD5 count.

I was thinking of using `map` to map my template from the list of
adjectives, but then essentially I have a shitton of memory being
used.  I don't need to keep *any* of the strings in memory; just check
each one and poop it out if it's good.

So far, I'm able to split the input string into an array on the tokens
and keep the tokens cause I need to fill them in later:

    my %files = (
    	'ADJECTIVE' => 'adjectives.txt',
    	'NOUN'	=> 'nouns.txt',
    	'VERB'  => 'verbs.txt'
    );
    
    my @replaceable_tokens = keys %files;

    # Will be 'ADJECTIVE|NOUN|VERB' for use in split regex
    my $replaceable_tokens_ORed = join('|',@replaceable_tokens);		
    
    # grab two unnamed command line parameters
    my ($string, $target) = @ARGV;		
    
    # tokenize the input string while keeping tokens
    my @tokenized_string = split(/($replaceable_tokens_ORed)/, $string);

Next I will make a variable for each of the tokens which will act as a
counter for the corresponding list of words.

I don't yet have a smart way to loop through a variable number of
loops, though I think that will have to come next.

