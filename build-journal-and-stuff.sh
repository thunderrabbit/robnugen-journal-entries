#!/bin/bash
echo "pushing"
git push bitbucket master
git push norigin master &
git push github master &

echo "not pulling"
# cd ~/journal-hugo/
# git submodule foreach git pull

cd ~/journal-hugo/content/journal
git pull

cd ~/journal-hugo/
git add .
git commit -m "latest entries"
git push bb master
git push origin master
git push origin netlify

echo "building"
hugo

echo "deploying"
echo "changing directory"
cd public
echo "sleeping"
sleep 2
echo "adding"
git add .
echo "sleeping"
sleep 2
echo "committing"
git commit -m "Published on `date`"
echo "sleeping"
sleep 2
echo "pushing"
git push origin master

# cd ~/journal
# echo skipping ./g2f.sh
# echo because it needs the password which I do not have handy
