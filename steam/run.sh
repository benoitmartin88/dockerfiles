#!/bin/bash

DOCKER_IMAGE="benoitmartin/steam"
STEAM_HOME=$HOME/steam

if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
    docker build -t $DOCKER_IMAGE .
fi

if [ ! -d "$STEAM_HOME" ]; then
    mkdir -p $STEAM_HOME
fi

docker run --rm --net host \
    -e DISPLAY=$DISPLAY \
    -e ALSA_CARD=1 \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    -v $STEAM_HOME:/home/steam \
    --device /dev/snd \
    --device /dev/dri \
    --memory="8g" \
    --shm-size="256m" \
    --name steam \
    $DOCKER_IMAGE

