#!/bin/bash


cp -rvf ~/bin ~/proj/github

git add .
git commit --amend
git push -u origin master
