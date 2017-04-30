#!/bin/bash

if [ ! -d "$HOME/.config/chromium/" ]; then
    mkdir -p $HOME/.config/chromium/
fi

docker run --rm --net host \
    -e DISPLAY=unix$DISPLAY \
    -e ALSA_CARD=0 \
    -v ~/.Xauthority:/root/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    -v $HOME/.config/chromium/:/data \
    -v $HOME/Downloads:/home/chromium/Downloads \
    --device /dev/snd \
    --device /dev/dri \
    --memory="4g" \
    --shm-size="256m" \
    --name chromium \
    benoitmartin/chromium

