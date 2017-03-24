#!/bin/bash

docker run --rm -it \
    -e DISPLAY=unix$DISPLAY \
    -v ~/.Xauthority:/root/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/vlc:ro \
    --device /dev/snd \
    --device /dev/dri \
    --name vlc \
    benoitmartin/vlc

