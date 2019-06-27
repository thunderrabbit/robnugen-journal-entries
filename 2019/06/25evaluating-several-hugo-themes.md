---
title: "evaluating several hugo themes"
tags: [ "hugo", "themes", "blog", "journal" ]
author: Rob Nugen
date: 2019-06-25T15:19:12+09:00
---

##### 15:19 Tuesday 25 June 2019 JST

I have gone through all the themes in the repo for
[All Hugo's Themes](https://github.com/gohugoio/hugoThemes) and come
up with a list of several which do a lot of these things:

* content on top page
* list page for blog/
* list page for journal/
* paginate blog/
* paginate journal/
* show tags
* paginate tags
* show categories
* paginate categories
* nicely show Youtube videos

I don't know if a single one does all the above things, but here is my
list so far:

```
                           #  top     pagin    prevnext    /blog/   tags   ctgs

#theme = "solar-theme-hugo"#   MIX     YES      NO           YES      YES    YES
theme = "Binario"   # Pagination only journal / no prev next
#theme = "LeaveIt"   # ♥♥♥♥♥♥♥♥  pretty great but no top page
#theme = "Midnight"  # Pagination, note about sidebars   / mixed top page
#theme = "aether"    # good on mobile, but slightly weird pagination (blank boxes for next entry)
#theme = "air"          # pagination on top and bottom, but weird spacing and debug marks syou
#theme = "airspace-hugo"   # pagination MT3 top bar??
#theme = "ajonp-hugo-ionic" # day / night button.  No pagination
#theme = "alpha-church"     # no top page, has tags, light CSS, readmore, pagination, no prevnext


                          #  top     pagin    prevnext    /blog/      tags
#theme = "angels-ladder"     NO         NO       YES        YES
#theme = "anybodyhome"       YES       YES        NO          NO              fancy CSS
#theme = "base16"             tags      NO        NO
#theme = "beautifulhugo"       NO       YES      YES          YES     YES
#theme = "beg"                mixed      YES      NO         YES       YES
#theme = "bilberry-hugo-theme" mixed     YES      NO         YES       YES
#theme = "bulma"             NO        YES        NO         YES        YES
#theme = "casper"              NO       YES        NO         YES       YES
#theme = "classless-hugo"     NO    Cocoa  Plain  Festively seem okay
#theme = "crab"     #     cute  NO      YES         NO         YES       YES     cute!
#theme = "cupper-hugo-theme"   NO      NO          NO         YES       YES
#theme = "detox"     #         mixed   YES       NO          YES       YES
#theme = "docdock"  #  THIS SHOWS ALL ENTRIES AND SORTS THEM BY DIRECTORY SO THAT IS NEAT
#theme = "ghostwriter"         NO       YES        NO          YES      YES
#theme = "gochowdown"     #    NO      YES        NO        YES       YES
#theme = "hestia-pure"    #   mixed     YES       YES        YES       YES       responsive / 日本語
#theme = "hugo-alageek-theme"    #  interesting date
#theme = "hugo-bootstrap-premium"     #   nice pagination  styling
#theme = "hugo-coder"      #   NO      YES       NO         YES       YES        nice style
#theme = "hugo-dgraph-theme" # MIX    YES       NO          YES       YES     nice design annoying popup
#theme = "hugo-theme-learn"  #  THIS SHOWS ALL ENTRIES AND SORTS THEM BY DIRECTORY SO THAT IS NEAT
#theme = "hugo-theme-m10c"    #  MIX    YES      NO         YES        YES
#theme = "hugo-theme-nix"    #  NO     YES      NO         YES         YES      weird header

                             #  top     pagin    prevnext    /blog/      tags    catgs
#theme = "hugo-theme-robotico"   #  Cool date on top page
#theme = "hugo-theme-vec"     #  NO       YES       YES         YES       YES      YES    technically best but no CSS
#theme = "hugo-theme-w3css-basic" #NO     YES        NO          YES       YES      YES    has CSS but need to fix /journal
#theme = "hugo-theme-zen"      #  NO      YES       NO           YES       YES      YES
#theme = "hugo-tikva"          #  NO      YES       NO           YES      YES      YES
#theme = "hyde-y"             # NO        YES       NO           YES       YES     YES    has CSS and /journal works
#theme = "inkblotty"          # NO        YES       NO           YES       YES     YES    has CSS and /journal works
#theme = "kiss"               # NO        YES       NO           YES       YES     YES    has CSS and /journal works
#theme = "kube"              # NO        YES       NO           YES       YES     YES    has CSS and /journal works
#theme = "mainroad"           # MIXED     YES      NO           YES       YES     YES   has CSS and /journal works
#theme = "manis-hugo-theme"  # NO        YES       YES           YES       YES     YES    has CSS and /journal works
#theme = "min_night"         # NO        YES       NO           YES       YES     YES    has CSS and /journal works
#theme = "next"               #                      YES
#theme = "onepress"          #  MIXED     YES        NO           YES      YES     YES    nice CSS and DISQUS
#theme = "personal-web"      #  NO        NO        NO            YES      YES     YES     Nice Sidebar
#theme = "polymer"            #  MIXED     YES       YES          YES       YES     YES    MAY BE THE WINNER
#theme = "pristine"            #  SORTED (attempted)
#theme = "purehugo"           #  MIXED     YES       NO          YES     AUTOMAGIC YOUTUBEs  nice design but no prevnext
#theme = "redlounge"        #    Nice date design
#theme = "simple-hugo-theme"  # NO          YES       NO         YES       YES      YES
#theme = "solar-theme-hugo" # MIXED       YES       YES          YES      YES        YES    dark with red title
#theme = "spectrum"           #   MIXED       YES       NO     YES  (read more)     YES        YES   great tag CSS
#theme = "story"       # nice waves but a bit weird
#theme = "strange-case"       #     MIXED       YES       NO          YES      YES        YES    Nice blue
#theme = "tale-hugo"           #   MIXED    YES    YES        YES     YES          YES       Pretty great
#theme = "temple"           #  simple but no pagination
#theme = "type"              #   technically but not themed
#theme = "whiteplain"        #   good but no tag pagination
```

Yeah it's a mess, but it's helping me sort out the best theme.

