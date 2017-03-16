#!/bin/bash

docker run --rm -it --net host \
    -e DISPLAY=unix$DISPLAY \
    -v ~/.Xauthority:/root/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    -v /usr/share/fonts:/usr/share/fonts \
    -v $HOME/.config/chromium/:/data \
    -v $HOME/Downloads:/home/chromium/Downloads \
    --device /dev/snd \
    --device /dev/dri \
    --name chromium \
    benoitmartin/chromium

