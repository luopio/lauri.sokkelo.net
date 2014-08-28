#!/bin/bash

GIT_ROOT=/var/www/lauri
# GIT_ROOT=/Users/lauri/code/luopio.github.io/

cd $GIT_ROOT && git pull
cd $GIT_ROOT && bundle install
cd $GIT_ROOT && jekyll build