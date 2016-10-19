#!/bin/bash

BRANCH=$1
COMMIT=$2
DEPLOY_SERVER=$3
IMAGE=lauri.sokkelo.net:5002/kh
NAME=kh

docker pull $IMAGE
docker stop $NAME
docker rm $NAME
docker run -tid --name $NAME \
           --link kh-postgres:db -e KH_DB=kh \
           -e KH_DBUSER=kh \
           -e KH_DBPASS=koulu \
           -e KH_DBPORT=5432 \
           -e KH_DBHOST=db \
           -p 8001:8001 $IMAGE
