This image comes with Meteor pre-installed, so I don't have to waste time waiting for `curl "https://install.meteor.com/" | sh` to finish every time I build the Docker image for my Meteor app.

Since this image is intended to be used as a build stage in a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) and nothing else, size is not a major concern and the base image is Ubuntu LTS for maximum adaptability.

This image uses a dedicated user `meteor` by default.

## Note

`METEOR_RELEASE` contains and should contain only the release version of Meteor. Its value is read literally so no whitespace is allowed.
