---
title: "journal not working on Netlify yet"
tags: [ "hugo", "journal" ]
author: Rob Nugen
date: 2019-03-28T08:26:34+09:00
---

##### 08:26 Thursday 28 March 2019 HST

Hmm  Hugo is erroring and not compiling my journal entries.


    Building sites … ERROR 2019/03/27 16:47:38 render of "taxonomy" failed: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/_default/list.html:5:27": execute of template failed: template: _default/list.html:35:15: executing "_default/list.html" at <partial "pagination....>: error calling partial: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/partials/pagination.html:5:27": execute of template failed: template: partials/pagination.html:5:27: executing "partials/pagination.html" at <.Paginator.NextPage....>: can't evaluate field NextPage in type *hugolib.Pager
    ERROR 2019/03/27 16:47:38 render of "taxonomy" failed: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/_default/list.html:5:27": execute of template failed: template: _default/list.html:35:15: executing "_default/list.html" at <partial "pagination....>: error calling partial: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/partials/pagination.html:5:27": execute of template failed: template: partials/pagination.html:5:27: executing "partials/pagination.html" at <.Paginator.NextPage....>: can't evaluate field NextPage in type *hugolib.Pager
    ERROR 2019/03/27 16:47:38 render of "taxonomy" failed: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/_default/list.html:11:27": execute of template failed: template: _default/list.html:35:15: executing "_default/list.html" at <partial "pagination....>: error calling partial: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/partials/pagination.html:11:27": execute of template failed: template: partials/pagination.html:11:27: executing "partials/pagination.html" at <.Paginator.PrevPage....>: can't evaluate field PrevPage in type *hugolib.Pager
    ERROR 2019/03/27 16:47:38 render of "taxonomy" failed: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/_default/list.html:5:27": execute of template failed: template: _default/list.html:35:15: executing "_default/list.html" at <partial "pagination....>: error calling partial: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/partials/pagination.html:5:27": execute of template failed: template: partials/pagination.html:5:27: executing "partials/pagination.html" at <.Paginator.NextPage....>: can't evaluate field NextPage in type *hugolib.Pager
    Total in 3248 ms
    Error: Error building site: failed to render pages: render of "taxonomy" failed: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/_default/list.html:5:27": execute of template failed: template: _default/list.html:35:15: executing "_default/list.html" at <partial "pagination....>: error calling partial: "/Users/thunderrabbit/journal-hugo/themes/purehugo-tr/layouts/partials/pagination.html:5:27": execute of template failed: template: partials/pagination.html:5:27: executing "partials/pagination.html" at <.Paginator.NextPage....>: can't evaluate field NextPage in type *hugolib.Pager
    
If I revert back a couple of commits I can get it to compile, but
still have not gotten Netlify to clone the repo and its submodules,
due to permissions on Github.
