FROM frolvlad/alpine-glibc
MAINTAINER David Garcia <david.garcia.alvarez.93@gmail.com>


# Install basic packages
RUN apk add --update --no-cache bash git openssh curl fping glibc libcap ca-certificates openssl unzip && \
    rm -rf /var/cache/apk/* && \
    mkdir /opt