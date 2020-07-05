---
date: '2020-07-05T22:14:19+09:00'
entry_title: 'Okay this is after I fixed title'
journal: journal
posttype: journal
published: true
slug: okay-this-is-after-i-fixed-title
title: 'Okay this is after I fixed title'
---
I added this to fix the title

    // My Hugo setup requires title in YAML.  This fixes that for journal entries.
    // there may already be code that deals with that but I did not look for it
    if (isset($properties['entry_title']) && !isset($properties['title'])) {
        $properties['title'] = $properties['entry_title'];
    }

