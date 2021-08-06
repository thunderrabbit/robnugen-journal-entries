---
title: "Finishing todo items in Emacs"
tags: [ "emacs", "check", "macro", "todo" ]
author: Rob Nugen
date: 2021-08-02T09:44:05+09:00
draft: false
---

    (fset 'insert-checkmark-after-space
       (kmacro-lambda-form [?\C-a ?\C-s ?  return ?✓ ?  down ?\C-a] 0 "%d"))

    (global-set-key (kbd "<C-return>") 'insert-checkmark-after-space)

Now if I have a checklist like this

1. item one
2. item two
3. item three

I can type ctrl-enter from any part of any line, and Emacs will insert
a checkmark in the first space (ascii 32), so it looks like this:

1. ✓ item one
2. ✓ item two
3. ✓ item three

Thanks to Workflowy for the shortcut.  Thanks to Emacs for the macro.
Thanks to https://emacs.stackexchange.com/a/31376/16333 for the
"<C-return>".
Thanks to DuckDuckGo for the "utf8 checkmark" search results.  Thanks
to https://www.utf8icons.com/character/10003/check-mark for the
check mark.

