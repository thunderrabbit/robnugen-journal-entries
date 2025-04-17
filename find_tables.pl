#!/usr/bin/env perl
use strict;
use warnings;
use File::Find;

my $base_dir = "$ENV{HOME}/journal";

find(\&wanted, $base_dir);

sub wanted {
    return unless /\.md$/;
    my $file = $File::Find::name;

    open my $fh, '<', $file or warn "Could not open $file: $!" and return;

    my $in_frontmatter   = 0;
    my $in_backtick_code = 0;
    my $in_html_pre      = 0;
    my $line_number      = 0;
    my $printed_header   = 0;

    while (my $line = <$fh>) {
        $line_number++;
        chomp $line;

        # Frontmatter skip
        if ($line =~ /^---\s*$/) {
            $in_frontmatter = !$in_frontmatter;
            next;
        }
        next if $in_frontmatter;

        # Code block skips
        if ($line =~ /^```/) {
            $in_backtick_code = !$in_backtick_code;
            next;
        }
        if ($line =~ /<pre>/i) {
            $in_html_pre = 1;
            next;
        }
        if ($line =~ /<\/pre>/i) {
            $in_html_pre = 0;
            next;
        }
        next if $in_backtick_code || $in_html_pre;

        # Match table line (naive but effective)
        if ($line =~ /^\s*\|.*\|\s*$/) {
            printf "  line %4d: %s\n", $line_number, $line  unless $printed_header;
            print "\n$file\n" unless $printed_header++;
        }
    }
    close $fh;
}
