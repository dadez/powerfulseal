FROM alpine:3.7
MAINTAINER dadez <dadez@protonmail.com>
 
#override proxy settings
ENV http_proxy=""
ENV https_proxy=""

#ENV CFLAGS=-Qunused-arguments
#ENV CPPFLAGS=-Qunused-arguments
 
# Install tooling
RUN apk add --update \
   ca-certificates \
   git \
   python3 \
   python3-dev \
   py3-netifaces \
   build-base \
   libffi \
   libffi-dev \
# install powerseal
   && pip3 install powerfulseal 


# Remove obsolete packages
# Clean caches and tmps
RUN rm -rf /var/cache/apk/* \
    /tmp/* \
    /var/log/*
