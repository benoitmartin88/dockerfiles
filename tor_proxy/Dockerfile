FROM alpine:3.5
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"

RUN apk add --no-cache tor
ADD torrc /etc/tor/torrc
VOLUME "/var/lib/tor"
EXPOSE 9050
USER tor
ENTRYPOINT /usr/bin/tor -f /etc/tor/torrc

