FROM docker.io/alpine:3.5
MAINTAINER David Garcia <david.garcia.alvarez.93@gmail.com>


# Install basic packages
RUN apk add --update --no-cache bash git openssh curl fping  libcap ca-certificates openssl unzip && \
    rm -rf /var/cache/apk/* && \
    mkdir /opt