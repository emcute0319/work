#!/bin/bash

cd ~/proj/github

#... bin
cp -rvf ~/bin ~/proj/github

#... vim
cp -rvf ~/.vimrc.bundles.local ~/proj/github/vim
cp -rvf ~/.vimrc.local ~/proj/github/vim

git add .
git commit
git push origin master -f

cd -
