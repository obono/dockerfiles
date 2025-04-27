#!/bin/env bash

if [ $# -lt 2 ]
then
	echo "$0 <directory> <tag>"
	exit 1
fi

dir=$1
tag=$2
if [ ${dir: -1} == '/' ]
then
	dir=${dir/%?}
fi
DOCKERFILE_PATH=$dir/Dockerfile DOCKER_REPO=obono/$dir DOCKER_TAG=$tag,latest ./$dir/hooks/build
docker push obono/$dir:$tag
docker push obono/$dir:latest
