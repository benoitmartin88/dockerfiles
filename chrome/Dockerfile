FROM alpine:3.5


#RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/main" >> /etc/apk/repositories && \
#    echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/community" >> /etc/apk/repositories

RUN echo "http://mirrors.2f30.org/alpine/v3.5/main" >> /etc/apk/repositories && \
    echo "http://mirrors.2f30.org/alpine/v3.5/community" >> /etc/apk/repositories

RUN apk --no-cache add xorg-server mesa-dri-ati chromium chromium-chromedriver

# Add chrome user
RUN addgroup chrome && adduser -D -G chrome -G audio -G video chrome \
    && mkdir -p /home/chrome/Downloads && chown -R chrome:chrome /home/chrome

# Run as non privileged user
#USER chrome


ENTRYPOINT [ "chromium-browser" ]
CMD [ "--no-sandbox", "--user-data-dir=/data" ]

