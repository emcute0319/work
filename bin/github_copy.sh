#!/bin/bash

cd ~/proj/github

cp -rvf ~/bin ~/proj/github

git add .
git commit
git push origin master -f
