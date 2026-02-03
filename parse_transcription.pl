#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use File::Path qw(make_path);
use File::Basename;

# parse_transcription.pl
# Converts LLM-preprocessed JSON data into properly formatted journal markdown files
#
# Usage: ./parse_transcription.pl preprocessed_YYYY-MM-DD.json

my $VERSION = "0.1.0";

# Get input file from command line
my $input_file = $ARGV[0] or die "Usage: $0 <preprocessed_json_file>\n";

# Read and parse JSON
my $json_text = do {
    local $/;
    open my $fh, '<', $input_file or die "Cannot open $input_file: $!\n";
    <$fh>;
};

my $data = decode_json($json_text);

# Extract journal name and entries
my $journal_name = $data->{journal_name} || "Unknown Journal";
my $entries = $data->{entries} || [];

print "Processing " . scalar(@$entries) . " entries from $journal_name\n";

# Track created files for manifest
my @created_files;

# Get current date for transcription note in human-readable format
my $transcription_date = `date '+%-d %b %Y'`;
chomp $transcription_date;

# Process each entry
foreach my $entry (@$entries) {
    my $page = $entry->{page};
    my $pages = $entry->{pages} || [$page];
    my $date_iso = $entry->{date_iso};
    my $date_spoken = $entry->{date_spoken};
    my $timezone = $entry->{timezone} || "";
    my $content = $entry->{content} || "";
    my $title = $entry->{title} || "Untitled";
    my $filename = $entry->{filename} || "untitled.md";
    my $flags = $entry->{flags} || [];

    # Report any flags
    if (@$flags) {
        print "  WARNING: Entry '$title' has flags: " . join(", ", @$flags) . "\n";
    }

    # Extract year and month from ISO date
    my ($year, $month) = $date_iso =~ /^(\d{4})-(\d{2})/;
    unless ($year && $month) {
        warn "  ERROR: Cannot parse date from '$date_iso' for entry '$title'\n";
        next;
    }

    # Create directory if needed
    my $dir = "$year/$month";
    unless (-d $dir) {
        make_path($dir) or die "Cannot create directory $dir: $!\n";
        print "  Created directory: $dir/\n";
    }

    # Construct full file path (DD prefix from date, then filename)
    my ($day) = $date_iso =~ /^\d{4}-\d{2}-(\d{2})/;
    my $filepath = "$dir/$day$filename";

    # Build page tags
    my @page_tags = map { "page $_" } @$pages;

    # Build tags array
    my @tags = ($journal_name, @page_tags, "transcribed");
    my $tags_string = join(", ", map { "\"$_\"" } @tags);

    # Build YAML frontmatter
    my $frontmatter = <<"EOF";
---
title: "$title"
tags: [ $tags_string ]
author: Rob Nugen
date: $date_iso
draft: false
---
EOF

    # Build entry body with transcription note including source
    my $transcription_note = "Transcribed $transcription_date from $journal_name Page $page";
    my $body = <<"EOF";
<div class="note">$transcription_note</div>

#### $date_spoken

$content
EOF

    # Combine frontmatter and body
    my $file_content = $frontmatter . "\n" . $body;

    # Write file
    open my $fh, '>', $filepath or die "Cannot write to $filepath: $!\n";
    print $fh $file_content;
    close $fh;

    print "  Created: $filepath\n";
    push @created_files, $filepath;
}

# Generate manifest file
my $manifest_basename = basename($input_file, '.json');
$manifest_basename =~ s/^preprocessed_/manifest_/;
my $manifest_file = "transcriptions/$manifest_basename.txt";

open my $mfh, '>', $manifest_file or die "Cannot write manifest to $manifest_file: $!\n";
print $mfh "# Manifest for $input_file\n";
print $mfh "# Generated: $transcription_date\n";
print $mfh "# Journal: $journal_name\n";
print $mfh "# Entries processed: " . scalar(@$entries) . "\n\n";
foreach my $file (@created_files) {
    print $mfh "$file\n";
}
close $mfh;

print "\nSummary:\n";
print "  Total entries: " . scalar(@$entries) . "\n";
print "  Files created: " . scalar(@created_files) . "\n";
print "  Manifest: $manifest_file\n";
print "\nDone!\n";
