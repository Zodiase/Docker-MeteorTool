
[![Docker Pulls](https://img.shields.io/docker/pulls/zodiase/meteor-tool.svg)](https://hub.docker.com/r/zodiase/meteor-tool/)
[![Docker Automated build](https://img.shields.io/docker/automated/zodiase/meteor-tool.svg)](https://hub.docker.com/r/zodiase/meteor-tool/)

----

This image comes with Meteor pre-installed, so I don't have to waste time waiting for `curl "https://install.meteor.com/" | sh` to finish every time I build the Docker image for my Meteor app.

Since this image is intended to be used as a build stage in a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) and nothing else, size is not a major concern and the base image is Ubuntu 16.04 LTS for maximum adaptability.

This image uses a dedicated user `meteor` by default.

## Usage

```Bash
docker pull zodiase/meteor-tool:1.7.0.3
```

or in a multi-stage build:

```Dockerfile
FROM zodiase/meteor-tool:1.7.0.3 AS build

# Use the Meteor tool to build the app bundle or do whatever you like.

FROM node:8.9.3-slim

# Copy the app bundle over, unpack it and setup everything else.
```

See https://hub.docker.com/r/zodiase/meteor-tool/tags/ for all available versions.

## Notes

- I'm using the automated build from Docker Cloud, but the Docker Hub page is not showing it's automated...
- `METEOR_RELEASE` contains and should contain only the release version of Meteor. Its value is read literally so no whitespace is allowed.
