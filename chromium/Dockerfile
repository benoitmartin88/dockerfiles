
#run with: 
#docker run --rm -it --net host \
#           -e DISPLAY=unix$DISPLAY \
#           -v ~/.Xauthority:/root/.Xauthority \
#           -v /tmp/.X11-unix:/tmp/.X11-unix \
#           -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
#           -v /usr/share/fonts:/usr/share/fonts \
#           -v $HOME/.config/chromium/:/data \
#           -v $HOME/Downloads:/home/chromium/Downloads \
#           --device /dev/snd \
#           --device /dev/dri \
#           --name chromium benoitmartin/chromium

FROM alpine:3.5
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"

#RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/main" >> /etc/apk/repositories && \
#    echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/community" >> /etc/apk/repositories
RUN echo "http://mirrors.2f30.org/alpine/v3.5/main" >> /etc/apk/repositories && \
    echo "http://mirrors.2f30.org/alpine/v3.5/community" >> /etc/apk/repositories

RUN apk --no-cache add xorg-server mesa-dri-ati mesa-dri-intel chromium chromium-chromedriver

# Add chrome user
RUN addgroup chrome && adduser -D -G chrome -G audio -G video chrome \
    && mkdir -p /home/chrome/Downloads && chown -R chrome:chrome /home/chrome

# Run as non privileged user
#USER chrome


ENTRYPOINT [ "chromium-browser" ]
CMD [ "--no-sandbox", "--user-data-dir=/data" ]

