#!/bin/bash

if [ ! -d "$HOME/.config/chromium/" ]; then
    mkdir -p $HOME/.config/chromium/
fi

docker run --rm --net host \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -e ALSA_CARD=0 \
    -v ~/.Xauthority:/root/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    -v $HOME/.config/chromium/:/data \
    -v $HOME/Downloads:/home/chromium/Downloads \
    -v /dev/snd:/dev/snd:rw \
    -v /dev/dri:/dev/dri:rw \
    --memory="8g" \
    --shm-size="512m" \
    --name chromium \
    benoitmartin/chromium:latest

