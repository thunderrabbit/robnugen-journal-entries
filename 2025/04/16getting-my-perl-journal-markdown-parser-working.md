---
title: "Getting my Perl journal markdown parser working"
tags: [ "2025", "journal", "markdown", "perl" ]
author: Rob Nugen
date: 2025-04-16T12:15:00+08:30
draft: false
---

Nearly four years ago, I wrote about my desire to get [my old Perl journal to correctly display my recent journal entries](https://perl.robnugen.com/journal.pl?type=all&date=2021/07/20) which are in markdown files.

I've consistently used `~/journal/yyyy/mm/ddtitle-here.ext` as the filename, where ext is either `txt`, `html`, or `md`.

I couldn't get the Perl markdown processors installed on Dreamhost, so I asked ChatGPT to write one for me.  This is what we've got so far:

```
# Text/RobMiniMarkdown.pm
package Text::RobMiniMarkdown;
use strict;
use warnings;

sub new { bless {}, shift }

my @para_buffer;

sub flush_paragraph {
    my $joined = join ' ', @para_buffer;
    @para_buffer = ();
    return "<p>$joined</p>\n" if $joined =~ /\S/;
    return '';
}

sub markdown {
    my ($self, $text) = @_;
    my @lines = split /\n/, $text;
    my $html = "";
    my $in_code_block = 0;
    my $in_list = 0;
    my $list_type = '';
    my $in_frontmatter = 0;
    my $in_html_block = 0;
    my $in_indented_code = 0;
    my @html_block;
    my @code_buffer;
    my @indented_buffer;

    foreach my $line (@lines) {
        # Skip YAML frontmatter
        if ($line =~ /^---\s*$/) {
            $in_frontmatter = !$in_frontmatter;
            next;
        }
        next if $in_frontmatter;

        if ($line =~ /^```/) {
            if ($in_code_block) {
                $html .= join('', @code_buffer) . "</pre>\n";
                @code_buffer = ();
            } else {
                $html .= "<pre>";
            }
            $in_code_block = !$in_code_block;
            next;
        }
        if ($in_code_block) {
            push @code_buffer, "$line\n";
            next;
        }

        # HTML block: detect opening tag
        if (!$in_html_block && $line =~ /^\s*<(\w+)[^>]*?>\s*$/) {
            $in_html_block = 1;
            @html_block = ($line);
            next;
        }

        if ($in_html_block) {
            push @html_block, $line;

            # If we detect the closing tag, flush
            if ($line =~ /<\/\w+>\s*$/) {
                $html .= join("\n", @html_block) . "\n";
                $in_html_block = 0;
                @html_block = ();
            }
            next;
        }

        # Indented code blocks
        if ($line =~ /^ {4,}/) {
            if (!$in_indented_code) {
                $in_indented_code = 1;
                @indented_buffer = ();
            }
	    $line =~ s/^ {4}//;   # remove four spaces from beginning of each line indented with four or more spaces
            push @indented_buffer, "$line\n";
            next;
        }

        if ($in_indented_code) {
            $html .= "<pre>" . join('', @indented_buffer) . "</pre>\n";
            $in_indented_code = 0;
            @indented_buffer = ();
        }

        # Headings
        if ($line =~ /^(#{1,6})\s+(.*)/) {
	    $html .= flush_paragraph();
            my $level = length($1);
            $html .= "<h$level>$2</h$level>\n";
            next;
        }

        # Horizontal rule
        if ($line =~ /^\s*(\*\*\*|---|___)\s*$/) {
	    $html .= flush_paragraph();
            $html .= "<hr/>\n";
            next;
        }

        # Blockquote
        if ($line =~ /^>\s?(.*)/) {
	    $html .= flush_paragraph();
            $html .= "<blockquote>$1</blockquote>\n";
            next;
        }

        # Unordered list
        if ($line =~ /^\s*[-+*]\s+(.*)/) {
	    $html .= flush_paragraph();
            if (!$in_list || $list_type ne 'ul') {
                $html .= "</$list_type>\n" if $in_list;
                $html .= "<ul>\n";
                $in_list = 1;
                $list_type = 'ul';
            }
            $html .= "  <li>$1</li>\n";
            next;
        }

        # Ordered list
        if ($line =~ /^\s*\d+\.\s+(.*)/) {
	    $html .= flush_paragraph();
            if (!$in_list || $list_type ne 'ol') {
                $html .= "</$list_type>\n" if $in_list;
                $html .= "<ol>\n";
                $in_list = 1;
                $list_type = 'ol';
            }
            $html .= "  <li>$1</li>\n";
            next;
        }

        # End list if current line isn't a list item
        if ($in_list and $line !~ /^\s*([-+*]|\d+\.)\s+/) {
	    $html .= flush_paragraph();
            $html .= "</$list_type>\n";
            $in_list = 0;
            $list_type = '';
        }

        # Tables (simple row)
        if ($line =~ /^\s*\|.*\|\s*$/) {
	    $html .= flush_paragraph();
            $html .= "<div class=\"table-row\">$line</div>\n";
            next;
        }

        # Inline code
        $line =~ s/`(.*?)`/<code>$1<\/code>/g;

        # Bold
        $line =~ s/\*\*(.*?)\*\*/<strong>$1<\/strong>/g;

        # Italic
        $line =~ s/(?<!\*)\*(.*?)\*(?!\*)/<em>$1<\/em>/g;

        # Links and images
        $line =~ s/!\[([^\]]*)\]\(([^\)]+)\)/<img alt="$1" src="$2" \/>/g;
        $line =~ s/\[([^\]]+)\]\(([^\)]+)\)/<a href="$2">$1<\/a>/g;

        # Paragraph (default case)
        if ($line =~ /^\s*$/) {
            $html .= flush_paragraph();
        } else {
            push @para_buffer, $line;
        }

    }

    # Close any open list
    $html .= "</$list_type>\n" if $in_list;

    # Final flush, just in case the file ends with indented code
    if ($in_indented_code) {
        $html .= "<pre>" . join('', @indented_buffer) . "</pre>\n";
    }

    return $html;
}

1;
```

And it's working pretty well!

To Do:

- Add the newer journal URL of this entry down below
- Ensure these lists show up correctly in the Hugo journal (which I plan to stop using *soon* (haha)"


1. Copy this file to my Perl journal directory
2. Confirm these lists show up correctly in my Perl journal
3. Post RobMiniMarkdown.pm on Github

* Confirm unordered lists show up correctly
* Confirm the Perl journal link to this file down below

The next **big** trick will be to allow journal entries to be visited at either URL

https://www.robnugen.com/journal/2025/04/16/getting-my-perl-journal-markdown-parser-working/

or

https://perl.robnugen.com/journal.pl?type=all&date=2025/04/16 (which can show multiple entries for that date)
