---
title: "Hey Travis!  Are you still using RSS to read these?"
tags: [ "2025", "rss", "thoughts", "journal", "programming" ]
author: Rob Nugen
date: 2025-05-06T06:08:00+09:00
draft: false
---

I'm asymptotically preparing to having my Perl journal back in action.  I don't currently remember if it has an RSS file.

Next steps:

- [x] Write out this list of steps
- [ ] Get 'er done https://github.com/thunderrabbit/Perl_driven_calendar_journal_from_2012/milestone/1
- [ ] Ask ChatGPT about preserving URLs
- [ ] Have a good think about preserving URLs (*)
- [x] Create an issue about navigation https://github.com/thunderrabbit/Perl_driven_calendar_journal_from_2012/issues/26
- [x] Finish writing this list of steps


(*) Currently, 

- the Hugo journal sorts entries by the date in the frontmatter.
- the Hugo journal can show a single entry based on its title
- the Perl journal sorts entries by the file path (which includes date)
- the Perl journal cannot currently show a single entry based on its title

While it's easy enough to show a single entry based on its date and title, I'm not sure how I'd do prev-next links without editing the entries themselves.  I prefer to have everything in as few files as possible. I especially don't want stuff in a database because that format is way harder to read than flat files.

BUT(!) it would actually be *awesome* to have some previous and next tags actually in the HTML.

Just a matter of programming:

1. to do it all the first time
2. as entries get added to the end
3. when entries get added in between existing entries

The end result would be something like

&lt;!-- navigation -->
Want
more?

Prev: &lta href="/journal/yyyy/mm/ddtitle">title&lt;/a>
Next: &lta href="/journal/yyyy/mm/ddtitle">title&lt;/a>
&lt;!-- /navigation -->

Hmmmm...