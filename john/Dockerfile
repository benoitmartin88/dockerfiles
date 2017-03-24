
FROM alpine:3.5
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"

RUN echo "http://mirrors.2f30.org/alpine/v3.5/main" >> /etc/apk/repositories && \
    echo "http://mirrors.2f30.org/alpine/v3.5/community" >> /etc/apk/repositories

WORKDIR /tmp/removeme

RUN apk add --no-cache gcc g++ openssl openssl-dev make 
RUN wget https://github.com/magnumripper/JohnTheRipper/archive/bleeding-jumbo.zip -O john.zip && unzip -q john.zip
RUN cd JohnTheRipper-bleeding-jumbo \
    && sed src/Makefile.legacy -i -e "s/^#OMPFLAGS = -fopenmp$/OMPFLAGS = -fopenmp/g" \
    && cp -r run /opt \
    && cd src \
    && ./configure 
#    && make -sj4 
#    && make install \
#    && cd /tmp \
#    && rm -rf /tmp/removeme

# Add john user
#RUN addgroup john && adduser -D -G john john && addgroup john audio && addgroup john video \
#    && mkdir -p /home/john/Downloads && chown -R john:john /home/john

#RUN chgrp -RLv john /dev/dri /dev/snd

# Run as non privileged user
#USER john

ENTRYPOINT [ "/bin/sh" ]
#CMD [ "--no-sandbox", "--user-data-dir=/data" ]

