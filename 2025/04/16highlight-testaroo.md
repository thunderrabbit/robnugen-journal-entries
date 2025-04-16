---
title: "Highlight testaroo"
tags: [ "2025", "journal", "markdown", "perl" ]
author: Rob Nugen
date: 2025-04-16T17:41:00+09:30
draft: false
---

# Syntax Highlighting Test

This file includes code blocks in multiple languages to confirm Hugo's syntax highlighting.

Add this to Perl journal head tag:

## HTML

```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/github.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
<script>hljs.highlightAll();</script>
```

## Perl

```perl
my $name = "Rob";
print "Hello, $name!\n";
```

## Bash

```bash
#!/bin/bash
echo "Hello from Bash"
ls -l /home/robnugen
```

## PHP

```php
<?php
echo "Hello from PHP!";
?>
```

## JSON

```json
{
  "name": "Rob",
  "role": "Connection Coach",
  "barefoot": true
}
```

## No Language Specified

```
This is a code block with no language.

It should still render with a monospaced font,
but no syntax highlighting.
```
