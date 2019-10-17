#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: $0 <commit message for main site>"
    exit
fi

COMMIT_MESSAGE=$@

echo "Will use \"${COMMIT_MESSAGE}\" as the commit message"

echo "pushing"
git push bitbucket master
git push norigin master &
git push github master &

cd ~/barefoot_rob/content/journal
git pull

cd ~/barefoot_rob/
git add content/journal/
sleep 0.1      # so git lock file can be removed

git commit -m "$COMMIT_MESSAGE"
sleep 0.1     # so git lock file can be removed

git push origin master
