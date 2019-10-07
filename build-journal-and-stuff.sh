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
git commit -m "$COMMIT_MESSAGE"
git push origin master
