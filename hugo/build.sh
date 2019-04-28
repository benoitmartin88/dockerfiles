#!/bin/bash

# hugo submodule
cd src/

DOCKER_IMAGE_NAME="benoitmartin/hugo"
BUILD_IMAGE=1.12-alpine3.9
HUGO_GIT_VERSION=$(git describe --tags)

echo "DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME}"
echo "BUILD_IMAGE=${BUILD_IMAGE}"
echo "HUGO_GIT_VERSION=${HUGO_GIT_VERSION}"

# build docker image with tag
echo "Building docker image: $DOCKER_IMAGE_NAME:$HUGO_GIT_VERSION"
docker build --build-arg BUILD_TAGS=$DOCKER_IMAGE_NAME:$HUGO_GIT_VERSION \
	--tag $DOCKER_IMAGE_NAME:$HUGO_GIT_VERSION .

# login and deploy to docker hub
docker login -u benoitmartin; CODE=$?
[ $CODE != 0 ] && exit 1

echo "Pushing docker image: $DOCKER_IMAGE_NAME:$HUGO_GIT_VERSION to Docker hub"
docker push $DOCKER_IMAGE_NAME:$HUGO_GIT_VERSION

cd -
