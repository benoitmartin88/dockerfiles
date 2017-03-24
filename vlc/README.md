
VLC with full hardware (sound and video) acceleration. Using X11 socket forwarding.

# Run
```
docker run --rm -it \
    -e DISPLAY=unix$DISPLAY \
    -v ~/.Xauthority:/root/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/vlc:ro \
    --device /dev/snd \
    --device /dev/dri \
    --name vlc \
    benoitmartin/vlc
```

# Note
Check gid for groups audio and video. They should be 29 and 44 respectively.




