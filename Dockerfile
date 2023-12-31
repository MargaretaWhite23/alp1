#to build this from a docker vps:
#docker image build -t alpine . -f Dockerfile
#docker run -d -i -t alpine /bin/bash
#start with different entry point for debugging:
#docker commit $CONTAINER_ID user/test_image
#docker run -ti --entrypoint=bash user/test_image
##enable ssh
#docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container-ID-or-name>

###https://docs.docker.com/guides/walkthroughs/run-a-container/
###

# Container image that runs your code
#FROM debian:unstable
#FROM ubuntu:focal-20220531
FROM alpine

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY build-kernel-github-actions.sh /build-kernel-github-actions.sh
COPY installrsakey.sh /installrsakey.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
RUN chmod +x /build-kernel-github-actions.sh
ENTRYPOINT ["/build-kernel-github-actions.sh"]
