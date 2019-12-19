---
title: "finished first version of Robarty Mcartyarter"
tags: [ "art", "code" ]
author: Rob Nugen
date: 2019-12-19T13:08:16+09:00
---

I finished the first version of
[Robarty Mcartyarter](https://arty.robnugen.com/arty/) last night pretty late.

[![2019 dec 19 robarty mcartyarter](//b.robnugen.com/journal/2019/thumbs/2019_dec_19_robarty_mcartyarter.png)](//b.robnugen.com/journal/2019/2019_dec_19_robarty_mcartyarter.png)

Based on a few values, it produces text designed to be used for an [Art
page on my MediaWiki site](https://wiki.robnugen.com/wiki/Special:AllPages?from=&to=&namespace=100).

[![2019 dec 19 robarty mcartyarter with data](//b.robnugen.com/journal/2019/thumbs/2019_dec_19_robarty_mcartyarter_with_data.png)](//b.robnugen.com/journal/2019/2019_dec_19_robarty_mcartyarter_with_data.png)

I used
[PHP for Robarty Mcartyarter](https://github.com/thunderrabbit/Robarty-Mcartyarter),
trying to think about dependency injection along the way, including
not relying on the REQUEST variables being "superglobals".  I also
used types in function declarations and the PHP 7.4 feature of typed
variables in class instances.

I have *not* done things such as document the code nor get the *html*,
*head*, *style*, and *body* tags out of PHP code, but I have some
ideas for how to make it more useful, including displaying a link that
will recreate as a GET url the page created after POSTing the data.

That will allow me to document the source for my wiki (though Robarty
Mcartyarter does not have version-proof responses) and revisit or
tweak the data relatively easily.

Oh, to that end, I might make it refill the form fields with the
request data.

Next will be to autofill the date values with current date by default.
