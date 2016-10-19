#!/bin/bash

GIT_ROOT=$1

cd $GIT_ROOT && git pull
cd $GIT_ROOT && bundle install
cd $GIT_ROOT && jekyll build