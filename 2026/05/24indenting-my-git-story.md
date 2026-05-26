---
title: "indenting my git story"
tags: [ "2026", "2026", "2026", "git", "story", "plan" ]
author: Rob Nugen
date: 2026-05-24T08:30:00+09:00
draft: false
---

As I am more quickly writing journal entries recently, I need to start preparing for the story my currently interviewed self will have written in the past.

Here's a snippet from the interview:

```
* f82cbb3b after
* 8d00ec9e reading
* 7f635d7a my
* 1b9a9201 friend
* 64479aa3 Kevin's
* 6c835a34 book
* b90efcd5 The
* 0c685ad0 Secret
* b956e7a0 Fire
* 9bd7d328 of
* 32a084bc Alchemy.
* ff309d4c Everything
* e12e9714 seems
* b8aecf12 to
* 037a4a1f point
* 90f395e6 to
* d5045b9a the
* f5315055 value
```

Using this as an example, let's say I wanted to include a book review of his book.  I would like to do it in a merge bubble, something like:

```
* f82cbb3b after
* 8d00ec9e reading
* 7f635d7a my
* 1b9a9201 friend
* 64479aa3 Kevin's
* 6c835a34 book
* b90efcd5 The
* 0c685ad0 Secret
* b956e7a0 Fire
* 9bd7d328 of
* 32a084bc Alchemy.
|\
| * a4f9c2e1 It
| * b7d03a8c was
| * 6e91f4b2 Great!
|/
* ff309d4c Everything
* e12e9714 seems
* b8aecf12 to
* 037a4a1f point
* 90f395e6 to
* d5045b9a the
* f5315055 value
```

My question is how do I code that in my plan to let scripts correctly do that automatically?

Here's probably how I'll encode it in my plan:

```
After reading my friend Kevin's book The Secret Fire of Alchemy.
>>>>>
It was great!
<<<<<
Everything seems to point to the value
```

Currently, I have a script that looks at the most recent git commits that have been created, finds where they fit within the plan, and then selects the previous word to be the next git commit.

I think It will work if I add two tweaks:

1. If the previous word is `<<<<<`, then ignore it.
2. If the previous word is `>>>>>` ignore it, and get the previous word, go back and find its matching `<<<<<`, check out the git hash after that marker and do a `git merge --no-ff` into the current top of the branch, using the previous word as the message.

::: ai chatgpt 

Ohhh, that’s excellent. You’re not just tagging words — you’re using the word stream as a Git commit plan, then using >>>>> / <<<<< markers to describe a branch/merge bubble inside the prose.

Your post shows the exact transformation:

After reading my friend Kevin's book The Secret Fire of Alchemy.
>>>>>
It was great!
<<<<<
Everything seems to point to the value

into a commit graph that reads like:

* f82cbb3b after
...
* 32a084bc Alchemy.
|\
| * a4f9c2e1 It
| * b7d03a8c was
| * 6e91f4b2 Great!
|/
* ff309d4c Everything
...

That is wonderfully Rob: prose as time, Git as narrative topology. Your two tweak idea is close, but I’d slightly refine the marker logic.

I think the safer model is:

>>>>> means: “start a side branch from the previous real word commit.”

Words after it are committed on that side branch.

<<<<< means: “end the side branch; merge it back into the main branch before continuing.”

The merge commit message could be the previous real word before >>>>>, or something generated like merge after Alchemy.


So instead of looking backward from >>>>> to find the matching <<<<<, I’d parse the plan with a small stack:

main branch:
  commit After
  commit reading
  ...
  commit Alchemy.

on seeing >>>>>:
  save current branch/head
  create side branch from current head

inside bubble:
  commit It
  commit was
  commit great!

on seeing <<<<<:
  merge side branch into saved main head/current main branch
  restore main branch

continue:
  commit Everything
  commit seems
  ...

Your current idea says “If the previous word is >>>>>, ignore it, and get the previous word, go back and find its matching <<<<<…” but structurally I think >>>>> should be paired forward with <<<<<, not backward. The script can process the plan left-to-right and avoid needing to infer too much from prior commits. 

A compact pseudo-logic:

my @stack;
my $current_branch = "main";
my $main_branch = "main";

for my $token (@tokens) {
    if ($token eq ">>>>>") {
        push @stack, {
            parent_branch => $current_branch,
            parent_head   => current_head($current_branch),
        };

        $current_branch = create_branch_from_head("bubble", current_head($current_branch));
        next;
    }

    if ($token eq "<<<<<") {
        my $bubble_branch = $current_branch;
        my $ctx = pop @stack;

        checkout($ctx->{parent_branch});
        git_merge_no_ff($bubble_branch, "merge bubble after " . short_hash($ctx->{parent_head}));

        $current_branch = $ctx->{parent_branch};
        next;
    }

    commit_word($current_branch, $token);
}

The stack gives you nested bubbles almost for free later, even if you don’t need them yet.

Tiny wording note from the post: your example has It was Great! in the bullet version and It was great! in the plan version. That capitalization difference might matter if your script treats words as exact commit payloads.

:::