FROM alpine:3.7
MAINTAINER dadez <dadez@protonmail.com>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="powerfulseal" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/bloomberg/powerfulseal" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
 
#override proxy settings
ENV http_proxy=""
ENV https_proxy=""

#ENV CFLAGS=-Qunused-arguments
#ENV CPPFLAGS=-Qunused-arguments
 
# Install tooling
RUN apk add --update \
   ca-certificates \
   #git \
   python3 \
   python3-dev \
   py3-netifaces \
   build-base \
   #libffi \
   libffi-dev \
   openssl-dev \
# install powerseal
   && pip3 install powerfulseal \
   && pip3 install os-client-config


# Remove obsolete packages
# Clean caches and tmps
RUN rm -rf /var/cache/apk/* \
    /tmp/* \
    /var/log/*
