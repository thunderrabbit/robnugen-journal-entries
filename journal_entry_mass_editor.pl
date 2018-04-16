#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;			# explains why stuff is busted
use File::Slurp;

use File::Find;

my $dir = "/Users/thunderrabbit/journal/";
my $seen = 0;

find(\&edits, $dir);

sub edits() {

    # kill any files ending with ~
    if ( /~$/ ) {
	print "Deleting backup file: $File::Find::name\n";
	unlink $_;
	return;
    }
    
    my $edited = 0;
    if ($seen < 1000 and -f and /.md/ ) {
	print "Processing file: $File::Find::name\n";
        $seen++;
	$edited = 0;
        my $file = $_;
        open FILE, $file;
        my @lines = <FILE>;
        close FILE;
        for my $line ( @lines ) {
#            if ( $line =~ /date:/  ) {
#		$edited = 1;
#	        print $line;
#            }
	    if ( $line =~ /moment 1999 arrived/ ) {
		print $File::Find::name;
	    }
        }
	if($edited) {
            open FILE, ">$file";
            print FILE @lines;
            close FILE;
	}
    }
    
}
