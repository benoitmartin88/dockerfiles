#!/bin/bash

DOCKER_IMAGE="benoitmartin/gcc"

if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
    echo "image not found locally, building..."
    docker build -t $DOCKER_IMAGE .
fi

docker run --rm -it \
    -v $(pwd):/home/user/ \
    --name gcc \
    $DOCKER_IMAGE

