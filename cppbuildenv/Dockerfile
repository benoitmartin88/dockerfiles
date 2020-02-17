ARG GCC_TAG
FROM gcc:$GCC_TAG
LABEL maintainer "Benoit Martin <benoitmartin88.pro@gmail.com>"

RUN apt-get update --fix-missing \
    && apt-get install -yq apt-transport-https ca-certificates gnupg software-properties-common wget
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - \
    && apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN apt-get install -yq cmake ninja-build libgtest-dev \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos 'User' user

USER user
WORKDIR /home/user

#ENTRYPOINT /bin/bash

