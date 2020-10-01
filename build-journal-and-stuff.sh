#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: $0 <commit message for main site>"
    exit
fi

COMMIT_MESSAGE=$@

echo "Plan to use \"${COMMIT_MESSAGE}\" as the commit message"

~/journal/get_git_commits.sh
~/journal/push_then_pull_on_micropub_server.sh

cd ~/barefoot_rob/content/journal
git pull

cd ~/barefoot_rob/
git add content/journal/
sleep 0.1      # so git lock file can be removed

cd ~/barefoot_rob/
git add .      # add any blog entries I created with Emacs
sleep 0.1      # so git lock file can be removed

git commit -m "$COMMIT_MESSAGE"
sleep 0.1     # so git lock file can be removed

git push origin master
