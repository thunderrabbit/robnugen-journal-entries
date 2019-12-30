---
title: "Sorting out the sorting of images of my art"
tags: [ "so", "mediawiki" ]
author: Rob Nugen
date: 2019-12-29T22:36:37+09:00
---

https://webapps.stackexchange.com/questions/137501/reverse-sort-of-pages-in-mediawiki-category-listing

In MediaWiki, I want a gallery of images from a certain category, sorted by most recent first.  (I am hoping to use MediaWiki core instead of relying on extensions.)

I tagged images with Category:Art so can now display a "gallery" of the images with the category listing.

I still want to sort the images in this category by most recent first.

Per [this answer][1] 
I tried using the date as [sort key][2] for the images in my category, but the images are still [in order by oldest first][3].

One solution would be to reverse the sort order of the category listing.

I see [$wgCategoryCollation][4], but even with Numeric sorting, it cannot sort things in reverse.

Another option would be to filter by category the [Gallery of New Files][5] but there is apparently no built-in way to do that.

Is there a built-in way to show a filtered set of images, most recent first?

  [1]: https://webapps.stackexchange.com/a/57513/20025
  [2]: https://www.mediawiki.org/wiki/Help:Categories#Sort_key
  [3]: https://wiki.robnugen.com/wiki/Category:Art
  [4]: https://www.mediawiki.org/wiki/Manual:$wgCategoryCollation#Numeric_sorting
  [5]: https://www.mediawiki.org/wiki/Help:New_files
