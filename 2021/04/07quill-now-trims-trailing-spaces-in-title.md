---
title: 'Quill now trims trailing spaces in title'
author: 'Rob Nugen'
date: '2021-04-07T15:20:04+09:00'
aliases: [
  "/journal/2021/04/07/forgot-to-erase-test-entries/",
]
---

As submitted, the title for this entry includes the spaces at the front and back: "&nbsp;&nbsp;&nbsp;forgot to erase test entries&nbsp;&nbsp;&nbsp;"

Earlier today, I added `.trim()` to the jQuery code which grabs the  title of the entry.

Before I had Quill trim the spaces, it was calculating the URL as having hyphens on the end.

I don't where (else) along the line those spaces were being removed, but those hyphen-terminated URLs did not make it into HTML reality once Hugo had created the site.

##### 23:37 Wednesday 07 April 2021 JST

I have now deleted the test entries and updated this entry's title to just reflect Quill's new skillset.

Thanks to Hugo, the old URL https://www.robnugen.com/journal/2021/04/07/forgot-to-erase-test-entries/ is still available and refreshes to this one.