#!/usr/bin/env perl
use strict;
use warnings;
use File::Find;
use File::Spec;
use Cwd 'abs_path';

my $base_dir = "$ENV{HOME}/journal";
my %markdown_elements;

find(\&wanted, $base_dir);

sub wanted {
    return unless /\.md$/;
    open my $fh, '<', $_ or warn "Could not open $_: $!" and return;

    my $in_frontmatter   = 0;
    my $in_backtick_code = 0;
    my $in_html_pre      = 0;

    while (my $line = <$fh>) {
        chomp $line;

        # Toggle frontmatter
        if ($line =~ /^---\s*$/) {
            $in_frontmatter = !$in_frontmatter;
            next;
        }
        next if $in_frontmatter;

        # Toggle triple-backtick code block
        if ($line =~ /^```/) {
            $in_backtick_code = !$in_backtick_code;
            next;
        }

        # HTML <pre> block
        if ($line =~ /<pre>/i) {
            $in_html_pre = 1;
            next;
        }
        if ($line =~ /<\/pre>/i) {
            $in_html_pre = 0;
            next;
        }

        # Skip if in any kind of code block
        if ($in_backtick_code || $in_html_pre) {
            next;
        }

        # Count indented code blocks
        if ($line =~ /^ {4,}/) {
            $markdown_elements{indented_code_block}++;
            next;
        }

        # Markdown element checks
        $markdown_elements{heading}++       if $line =~ /^#{1,6}\s/;
        $markdown_elements{ulist}++         if $line =~ /^\s*[-*+]\s/;
        $markdown_elements{olist}++         if $line =~ /^\s*\d+\.\s/;
        $markdown_elements{blockquote}++    if $line =~ /^\s*>/;
        $markdown_elements{hrule}++         if $line =~ /^\s*(?:---|\*\*\*|___)\s*$/;
        $markdown_elements{code_block}++    if $line =~ /^```/;
        $markdown_elements{table}++         if $line =~ /^\s*\|.*\|\s*$/;
        $markdown_elements{inline_code}++   if $line =~ /`[^`]+`/;
        $markdown_elements{bold}++          if $line =~ /\*\*[^*]+\*\*/;
        $markdown_elements{italic}++        if $line =~ /(?<!\*)\*[^*]+\*(?!\*)/;
        $markdown_elements{image}++         if $line =~ /!\[[^\]]*\]\([^)]+\)/;
        $markdown_elements{link}++          if $line =~ /\[[^\]]+\]\([^)]+\)/;
        $markdown_elements{footnote}++      if $line =~ /\[\^.+?\]/;
    }
    close $fh;
}

# Output results
foreach my $element (sort keys %markdown_elements) {
    print "$element: $markdown_elements{$element}\n";
}
