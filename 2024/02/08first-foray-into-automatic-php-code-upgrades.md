---
title: "First foray into automatic PHP code upgrades"
tags: [ "2024", "php", "work", "upgrade", "rector", "ttwp" ]
author: Rob Nugen
date: 2024-02-08T12:06:00+09:00
draft: false
---

Travis Trigger Warning: PHP


Today I created a PR:

This is a first foray into using Rector for automatic PHP upgrades.

Rector config file rector.php controls what is upgraded.

In this PR, the rector.php rule AddVoidReturnTypeWhereNoReturnRector allows Rector to add : void to each function definition that had no return.

After Rector added : void, our linter then removed @return void from the phpdocs.

Fortunately, Rector doesn't mind the linter's change so at least they are in agreement now.

- - - 

Tex pointed out:

> After Rector added : void, our linter then removed @return void from the phpdocs.

Yes, the linter will remove all useless annotations.

In this case, @return void in conjunction with an explicit return type is considered useless, because the explicit return type is authoritative and no additional context is being added with the annotation. This is because the docs are very likely to get out of sync, and you can find many examples of this in our code.

It's basically to prevent situations like this:

```
    /**
     * @return void
     */
    function test(): int
```

If you add context to the annotation, it will not be removed.

```
    /**
     * @return void More context here!
     */
    function test(): void
```

This should be largely safe. The only place this may cause issues is where it adds the return type to a function that is implemented as part of an interface incorrectly. Particularly an untyped interface.