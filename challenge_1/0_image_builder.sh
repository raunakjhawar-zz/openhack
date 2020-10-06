#!/bin/bash

source config.sh

git clone $repo_url

cp $dir_root"dockerfiles/Dockerfile_0" $dir_root"src/user-java/DockerFile"
cp $dir_root"dockerfiles/Dockerfile_1" $dir_root"src/tripviewer/DockerFile"
cp $dir_root"dockerfiles/Dockerfile_2" $dir_root"src/userprofile/DockerFile"
cp $dir_root"dockerfiles/Dockerfile_3" $dir_root"src/poi/DockerFile"
cp $dir_root"dockerfiles/Dockerfile_4" $dir_root"src/trips/DockerFile"
set -x
cd $dir_root"src/user-java/"
docker build -f DockerFile -t $IMAGE_PREFIX"/user_java:v1" .

cd $dir_root"src/tripviewer/"

docker build -f DockerFile -t $IMAGE_PREFIX"/trip_viewer:v1" .

cd $dir_root"src/userprofile/"
docker build -f DockerFile -t $IMAGE_PREFIX"/user_profile:v1" .

cd $dir_root"src/poi/"
docker build -f DockerFile -t $IMAGE_PREFIX"/poi:v1" .

cd $dir_root"src/trips/"
docker build -f DockerFile -t $IMAGE_PREFIX"/trip:v1" .