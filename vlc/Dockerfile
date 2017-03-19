
# Run with:
#docker run --rm -it \                                                                                                                                                                
#     -e DISPLAY=unix$DISPLAY \                                                                                 
#     -v ~/.Xauthority:/root/.Xauthority \                                                                      
#     -v /tmp/.X11-unix:/tmp/.X11-unix \                                                                        
#     -v $HOME:/home/vlc:ro \                                                                                   
#     --device /dev/snd \                                                                                       
#     --device /dev/dri \                                                                                       
#     --name vlc \                                                                                              
#     benoitmartin/vlc

FROM alpine:3.5
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"

RUN echo "http://mirrors.2f30.org/alpine/v3.5/main" >> /etc/apk/repositories && \
    echo "http://mirrors.2f30.org/alpine/v3.5/community" >> /etc/apk/repositories

RUN apk add --no-cache mesa-dri-ati mesa-dri-intel dbus-x11 vlc vlc-qt

# Add vlc user and set audio and video groups with correct gui
RUN addgroup vlc && adduser -D -G vlc vlc \
    && delgroup audio && addgroup -g 29 audio \
    && delgroup video && addgroup -g 44 video \
    && addgroup vlc audio && addgroup vlc video 

# Run as non privileged user
USER vlc

WORKDIR /home/vlc

ENTRYPOINT [ "vlc" ]
#CMD [ "--no-sandbox", "--user-data-dir=/data" ]

