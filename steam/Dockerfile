
# check sound card index to use: cat /proc/asound/cards
# cf: https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture

FROM debian:jessie-slim
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"

RUN dpkg --add-architecture i386 && apt-get update \
    && apt-get install -yq sudo wget \
        libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 libstdc++6:i386 libtxc-dxtn-s2tc0:i386 \
        zenity python python-apt xterm xz-utils curl pulseaudio alsa-utils \
    && rm -rf /var/lib/apt/lists/*

RUN echo options snd_hda_intel index=1 >> /etc/modprobe.d/default.conf
RUN wget http://media.steampowered.com/client/installer/steam.deb \
    && dpkg -i --force-all steam.deb \
    && rm -f steam.deb
RUN echo 'steam ALL = NOPASSWD: ALL' > /etc/sudoers.d/steam && chmod 0440 /etc/sudoers.d/steam

RUN adduser --disabled-password --gecos 'Steam' steam \
    && adduser steam video \
    && adduser steam audio

USER steam
ENV DISPLAY $DISPLAY
ENV HOME /home/steam
VOLUME /home/steam
WORKDIR /home/steam

ENTRYPOINT ["steam"]

