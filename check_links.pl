#!/usr/bin/env perl

# https://dev.to/thibaultduponchelle/check-links-with-http-simple-perl-3bhh

use strict;
use warnings;
use diagnostics;			# explains why stuff is busted
use open ':std', ':encoding(UTF-8)';
use Term::ANSIColor;
use HTTP::Simple;

my ($TRASH,$ERROR);
open($TRASH, '>', '/dev/null');
open($ERROR, '>', '/home/thunderrabbit/shhhhyourmom.txt');

$| = 1;

while(<>) {
    chomp;
    my $link = $_;
    print "Checking [$link]...";

    select $TRASH;     ## bin response from page we get with getprint
    my $status = getprint($link);
    if(! is_success($status)) {
	select $ERROR;
        print $link . color('red') . " \x{2717} --> $status\n" . color('reset');
    } else {
        print $link . color('green') . " \x{2713}\n" . color('reset');
    }
}
