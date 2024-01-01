#to build this from a docker vps:
#docker image build -t alpine . -f Dockerfile

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
