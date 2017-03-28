
FROM alpine:3.5
LABEL maintainer "Benoit Martin <benoitmartin88@gmail.com>"

RUN echo "http://mirrors.2f30.org/alpine/v3.5/main" >> /etc/apk/repositories && \
    echo "http://mirrors.2f30.org/alpine/v3.5/community" >> /etc/apk/repositories

WORKDIR /tmp/removeme

ENV JOHN=/opt
ENV PATH="${PATH}:${JOHN}"

RUN apk add --no-cache gcc g++ openssl openssl-dev make 
RUN wget http://www.openwall.com/john/j/john-1.8.0-jumbo-1.tar.gz -O john.tar.gz && tar xf john.tar.gz
RUN cd john-1.8.0-jumbo-1 \
    && sed src/Makefile.legacy -i -e "s/^#OMPFLAGS = -fopenmp$/OMPFLAGS = -fopenmp/g" \
    && sed src/MD5_std.c -i -e "s/^#define MAYBE_INLINE_BODY MAYBE_INLINE$/#define MAYBE_INLINE_BODY/g" \
    && cd src \
    && ./configure \ 
    && make -sj4 \ 
    && make install \
    && cp -r ../run /opt \
    && cd /tmp \
    && rm -rf /tmp/removeme

WORKDIR ${JOHN}

# Add john user
#RUN addgroup john && adduser -D -G john john && addgroup john audio && addgroup john video \
#    && mkdir -p /home/john/Downloads && chown -R john:john /home/john

# Run as non privileged user
#USER john

ENTRYPOINT [ "/opt/john" ]


