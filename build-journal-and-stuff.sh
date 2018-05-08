#!/bin/bash
echo "pushing"
git push bitbucket master
git push norigin master

echo "pulling"
cd ~/journal-hugo
git submodule foreach git pull

echo "building"
hugo

echo "deploying"
echo "changing directory"
cd public
git reset 72aff30
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
git push --force origin master

cd ~/journal
./g2f.sh
