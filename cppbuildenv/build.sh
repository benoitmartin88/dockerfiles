#!/bin/bash

# tags from https://hub.docker.com/r/library/gcc/tags/
GCC_TAG_VERSION_ARR=( 4.6 4.8 4.9 5.2 5.4 6.5 7.5 8.3 9.2 )
DOCKER_IMAGE_NAME="benoitmartin/cppbuildenv"

# build docker image with tag
for GCC_TAG in "${GCC_TAG_VERSION_ARR[@]}"; do
	echo "Building docker image: $DOCKER_IMAGE_NAME:$GCC_TAG"
	docker build \
	    --build-arg GCC_TAG=$GCC_TAG \
	    --tag $DOCKER_IMAGE_NAME:$GCC_TAG .
done


# login and deploy to docker hub

docker login -u benoitmartin; CODE=$?
[ $CODE != 0 ] && exit 1

for GCC_TAG in "${GCC_TAG_VERSION_ARR[@]}"; do
	echo "Pushing docker image: $DOCKER_IMAGE_NAME:$GCC_TAG to Docker hub"
	docker push $DOCKER_IMAGE_NAME:$GCC_TAG
done


