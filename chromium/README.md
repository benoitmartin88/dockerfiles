
Chromium with full hardware (sound and video) acceleration.

X11 socket forwarding, no VNC or SSH forwarding crap.


# Run
```
docker run --rm -it --net host \
           -e DISPLAY=unix$DISPLAY \
           -e ALSA_CARD=1 \
           -v ~/.Xauthority:/root/.Xauthority \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
           -v $HOME/.config/chromium/:/data \
           -v $HOME/Downloads:/home/chromium/Downloads \
           --device /dev/snd \
           --device /dev/dri \
           --name chromium \
           benoitmartin/chromium
```

# Configuration
The ALSA_CARD environment variable can be set to select the sound device to use.

check sound card index to use: cat /proc/asound/cards or run aplay -l

cf: https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture

# Note
- Check gid for groups audio and video. They should be 29 and 44 respectively.
- Chromium data directory is mounted into the container. If this directory does not exist on the host, 
    It will be created as root which will cause problems as the chromium user (inside the container) will
    not be able to read or write. The data directory should be created **before** running the container.

    eg: 
    ```
    if [ ! -d "$HOME/.config/chromium/" ]; then
        mkdir -p $HOME/.config/chromium/
    fi
    ```


