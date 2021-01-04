---
title: "Trying to Get untracked files from remote server"
tags: [ "git", "bash", "journal" ]
author: Rob Nugen
date: 2021-01-04T08:48:51+09:00
draft: false
---

I have been keeping a journal for a while, first starting in 1985.
The entries are in a git repo, and for a couple years (since no later
than [15:38:57 Thursday 23 March 2017
+0900](https://bitbucket.org/thunderrabbit/robnugen-journal-entries/commits/dffd02046ad77e7d283fcc78dea1e78b8662b4dd)) I have been writing
(backwards) a story of sorts in the git commits.
The story currently ends on page 49 of this list of commits
https://bitbucket.org/thunderrabbit/robnugen-journal-entries/commits/?page=1
(Hmmm, with 25 commits per page, I am approximately 1225 commits
(words and paragraph breaks) into the story.)

But that's not exactly why I am writing.

Using Micropub, I am able to write journal entries on my phone and
have them be sent to my (test) website.  This helps while I am on the
train, and will help keep a record of my experiences while I am
walking to Niigata.

Because of the story being written backwards in the commit messages, I
need to be extra careful not to create merges if I commit entries on
my local machine or the (test) website.

Until now, I have done the following to commit Micropublished entries:

1. log onto the test website
2. check to see if there are entries to be committed
3. look on local machine to find the next word for the commit message
4. commit the entries
5. push to remote from test website
6. pull from remote on local machine

~~If~~ I can [get git to tell me if there are unstaged files](https://stackoverflow.com/a/8506155/194309), ~~then~~ I should
be able to copy them automatically to my local machine.


This is `~/journal/untracked_remote_journal_file_shower.sh`

    # This is designed to show what files exist on my journal Micropub server endpoint but not included in the journal repo
    
    # -F specifies a config file that does not show the ssh key visual fingerprint
    # hpc is my journal Micropub server endpoint defined in .ssh/config_no_visual_keys
    # git ls-files -o  shows untracked files on a line per line basis but does not handle spaces in filesnames  
    
    # REMOTE_JOURNAL_DIR should match 
    REMOTE_JOURNAL_DIR='~/barefoot_rob/content/journal'    #REMOTE_JOURNAL_DIR must be in single quotes so ~ does not expand locally.
    
    ssh -F ~/.ssh/config_no_visual_keys hpc "cd $REMOTE_JOURNAL_DIR; git ls-files -o"

Sample output:

    2021/01/carpe_diem.md
    2021/01/you_can_do_it.md

Given the existence of the untracked remote files, I want to copy them
to my local machine, and I have this script on my local machine, and send it the list of
untracked files as discovered by the script above

This is `~/journal/untracked_remote_journal_file_getter.sh`

    REMOTE_UNTRACKED_FILES="$1"

    REMOTE_JOURNAL_DIR='~/barefoot_rob/content/journal'         # must be in single quotes so ~ does not expand locally.
    REMOTE_JUSTIN_CASE='~/untracked_files_copied_to_local_box'  # must be in single quotes so ~ does not expand locally.
    
    while read -r line; do
        scp -F ~/.ssh/config_no_visual_keys hpc:$REMOTE_JOURNAL_DIR/$line $line
        if [ $? -eq 0 ]; then
            echo copy OK
    	echo moving remote file to $REMOTE_JUSTIN_CASE
    	ssh -F ~/.ssh/config_no_visual_keys hpc "mv $REMOTE_JOURNAL_DIR/$line $REMOTE_JUSTIN_CASE"
        else
            echo copy FAIL
            exit -1
        fi
    done <<< "$REMOTE_UNTRACKED_FILES"

Ah nice.  This answer says to use `-n` with ssh so it will not eat up
the remaining stdin lines.  https://stackoverflow.com/a/9393147/194309

I added the fix to the script above and it did not work!  Oh man, what
to do?

Looking back at the question that prompted the answer, I saw the
problem only happens when using `while` loops; `for` loops work okay
(and in my case I do not have spaces in file names) so yay!

Oh, hang on, I edited the script *above* (in this journal entry) and
not the actual script.

[Nevermind!](https://www.youtube.com/watch?v=fZLeaSWY37I)

Here is the current working version of `~/journal/untracked_remote_journal_file_getter.sh`

    while read -r line; do
        scp -F ~/.ssh/config_no_visual_keys hpc:$REMOTE_JOURNAL_DIR/$line $line
        if [ $? -eq 0 ]; then
            echo copy OK
    	echo moving remote file to $REMOTE_JUSTIN_CASE
    	# https://stackoverflow.com/a/9393147/194309 -n keeps ssh from breaking while loop
    	ssh -n -F ~/.ssh/config_no_visual_keys hpc "mv $REMOTE_JOURNAL_DIR/$line $REMOTE_JUSTIN_CASE"
        else
            echo copy FAIL
            exit -1
        fi
    done <<< "$REMOTE_UNTRACKED_FILES"
