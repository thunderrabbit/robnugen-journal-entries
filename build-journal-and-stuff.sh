#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: $0 <commit message for main site>"
    echo "iffn you want to actually commit stuff."
    echo "Otherwise, I will just get files from remote server"
fi

COMMIT_MESSAGE=$@

if [ -n "$COMMIT_MESSAGE" ]   # check non-zero length
    then
	echo "Plan to use \"${COMMIT_MESSAGE}\" as the commit message"
    else
	echo "No commit message so will only sync files, not build site"
fi

GET_REMOTE_FILES_BOOL="N"    ## Default to N because if we do not pull them it is the same as if they DNE

####   BEGIN get files from ~/barefoot_rob_master/content/journal

REMOTE_UNTRACKED_FILES=$(~/journal/untracked_remote_journal_file_shower.sh)
if [ -n "$REMOTE_UNTRACKED_FILES" ]   # check non-zero length
    then
	echo There are untracked remote files.
        while read -r line; do
              echo "$line"
        done <<< "$REMOTE_UNTRACKED_FILES"

	#
	#  https://ss64.com/bash/read.html
	#
        #   -e        If the standard input is coming from a terminal, readline is used to obtain the line.
        #
        #   -n nchars read returns after reading nchars characters rather than waiting for a complete line of input.
	read -e -n 1 -p "Do you want me to get them for you? " GET_REMOTE_FILES_BOOL     # reads single character into input
fi

if [ $GET_REMOTE_FILES_BOOL = "y" ]
    then
        echo Calling script to get the files, then exiting
	~/journal/untracked_remote_journal_file_getter.sh "$REMOTE_UNTRACKED_FILES"
        exit
fi

####   END get files from ~/barefoot_rob_master/content/journal
####   BEGIN get files from ~/barefoot_rob_master/content

REMOTE_UNTRACKED_FILES=$(~/barefoot_rob_master/untracked_remote_bfr_file_shower.sh)
if [ -n "$REMOTE_UNTRACKED_FILES" ]   # check non-zero length
    then
	echo There are untracked remote files.
        while read -r line; do
              echo "$line"
        done <<< "$REMOTE_UNTRACKED_FILES"

	#
	#  https://ss64.com/bash/read.html
	#
        #   -e        If the standard input is coming from a terminal, readline is used to obtain the line.
        #
        #   -n nchars read returns after reading nchars characters rather than waiting for a complete line of input.
	read -e -n 1 -p "Do you want me to get them for you? " GET_REMOTE_FILES_BOOL     # reads single character into input
fi

if [ $GET_REMOTE_FILES_BOOL = "y" ]
    then
        echo Calling script to get the files, then exiting
	~/barefoot_rob_master/untracked_remote_bfr_file_getter.sh "$REMOTE_UNTRACKED_FILES"
        exit
fi

####   END get files from ~/barefoot_rob_master/content
echo
echo "BEGIN Get commits from remote server"
~/journal/get_git_commits.sh
GOT_REMOTE_COMMITS=$?     # must get it now before the echo resets $? value to 0
echo "END Get commits from remote server"

echo "If above script exits cleanly then we got commits from remote server via nice fast-forward"
if [ $GOT_REMOTE_COMMITS -eq 0 ]; then
    echo git commits via fast-forward OK
else
    echo git commits FAILED
    exit -1
fi

echo "Now make sure the remote server has any changes we just made here locally:"
echo "BEGIN push commits to remote server"
~/journal/push_then_pull_on_micropub_server.sh
echo "END push commits to remote server"

# Now that we have all the journal files from remote and local repo, put them into the main website

if [ -z "$COMMIT_MESSAGE" ]
  then
      echo "no commit message so ending"
      exit
fi


cd ~/barefoot_rob_master/content/journal
git pull

cd ~/barefoot_rob_master/
git add content/journal/
sleep 0.1      # so git lock file can be removed

###  DO NOT SWEEP UP EDITS I HAVE NOT STAGED  cd ~/barefoot_rob_master/
###  DO NOT SWEEP UP EDITS I HAVE NOT STAGED  git add .      # add any blog entries I created with Emacs
###  DO NOT SWEEP UP EDITS I HAVE NOT STAGED  sleep 0.1      # so git lock file can be removed

git commit -m "$COMMIT_MESSAGE"
sleep 0.1     # so git lock file can be removed

git push origin master

ssh bfr '~/scripts/update_robnugen.com.sh'
