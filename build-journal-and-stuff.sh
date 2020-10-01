#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: $0 <commit message for main site>"
    exit
fi

COMMIT_MESSAGE=$@

echo "Plan to use \"${COMMIT_MESSAGE}\" as the commit message"

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
