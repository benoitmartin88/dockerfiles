ARG GCC_TAG
FROM gcc:$GCC_TAG
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"


RUN apt-get update \
    && apt-get install -yq cmake libgtest-dev \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos 'User' user

USER user
WORKDIR /home/user

#ENTRYPOINT /bin/bash

