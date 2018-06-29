# This Dockerfile is used to build the production bundle for a Meteor app.

FROM ubuntu:16.04 AS build
LABEL maintainer="Xingchen Hong <hello@xc-h.com>"

RUN apt-get update \
    && apt-get install -y -q build-essential \
                             libssl-dev curl git \
                             python-dev \
    && apt-get install -y -q locales \
    && locale-gen en_US.UTF-8 \
    && localedef -i en_GB -f UTF-8 en_US.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash meteor
ENV HOME="/home/meteor"
WORKDIR $HOME
USER meteor

# Install Meteor.
ADD ./METEOR_RELEASE /usr/share/METEOR_RELEASE
#! `$(</usr/share/METEOR_RELEASE)` did not work.
RUN METEOR_RELEASE=`cat /usr/share/METEOR_RELEASE` \
    && curl "https://install.meteor.com/?release=$METEOR_RELEASE" | sh
ENV METEOR_PATH="$HOME/.meteor"
ENV PATH="$PATH:$METEOR_PATH"

ENTRYPOINT bash
