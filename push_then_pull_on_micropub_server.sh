#!/bin/bash

echo "This script ensures we push any commits that have been committed locally"
echo "to the server that my quill.plasticaddy.com site points to via Micropub."
echo
echo "At this point, it is a test server available at https://hugotest.plasticaddy.com/"
echo "And I soon want to move it to https://robnugen.com/"
echo
echo "Once the site is moved, the command below will have to point to"
echo "the Dreamhost server that runs robnugen.com..  I wonder if I should"
echo "create a new server for that."
echo
echo "When you update this file, also update file ~/journal/get_git_commits.sh"
echo
echo "pushing local commits"
git push origin master
git push norigin master &
# git push github master &

echo "pulling on Micropub server"
ssh bfr 'cd /home/barefoot_rob/barefoot_rob/content/journal/; git pull'
