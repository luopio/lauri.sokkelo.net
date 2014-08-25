#!/bin/bash

GIT_ROOT=/var/www/lauri
# GIT_ROOT=/Users/lauri/code/luopio.github.io/

cd $GIT_ROOT
git pull
bundle install
jekyll build

