#!/bin/bash

BRANCH=$1
COMMIT=$2
BUILD_ROOT=$3
IMAGE=lauri.sokkelo.net:5002/kh

cd $BUILD_ROOT

git pull origin $BRANCH
git checkout $BRANCH
git reset --hard $COMMIT
docker build -t $IMAGE .
docker push $IMAGE