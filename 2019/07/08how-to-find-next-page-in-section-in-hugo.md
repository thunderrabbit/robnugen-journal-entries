---
title: "How to find next page in section in Hugo"
tags: [ "gohugo", "hugo", "nice" ]
author: Rob Nugen
date: 2019-07-08T15:36:42+09:00
---

##### 15:36 Monday 08 July 2019 JST

Wow Hugo rules.  Thank you, Bep!

I got my journal/ and blog/ indices separated by adding a bit of code
to the pagination.

https://github.com/thunderrabbit/purehugo-tr/commit/16559a8ffa3ec74f57af7398a90f259f41972675

And now the Prev and Next links work based on section.

https://github.com/thunderrabbit/purehugo-tr/commit/97b09a88d01a493374ba6231185bf8cb9b723e0b

```
            <div class="pager">
                 {{with .NextInSection}} <a href="{{.Permalink}}" rel="prev" style="float: left!important">❮ {{.Title}}</a>{{end}}
                 {{with .PrevInSection}} <a href="{{.Permalink}}" rel="next" style="float: right!important"> {{.Title}} ❯</a>{{end}}
            </div>
```
			
Nice!
