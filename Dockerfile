# ----------------------------------
# Pterodactyl Ntfy.Sh Dockerfile
# Environment: Ntfy.Sh
# Minimum Panel Version: 0.6.0
# ----------------------------------

# Stage 1: Use a base image that uses APT package manager to install bash
# FROM debian:bullseye as builder
# Install Bash 
# RUN apt-get update && apt-get install -y bash

# Stage 2: Rest of the script from ntfy
# FROM binwiederhier/ntfy
FROM openjdk:8-jdk-alpine

# Copy the Bash binary from the builder stage to the final image
# COPY --from=builder /bin/bash /bin/bash

MAINTAINER KamikazeJAM, <kamikazejam.yt@gmail.com>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./server.yml /server.yml
COPY ./entrypoint.sh /entrypoint.sh

# Alphine Image
CMD ["/bin/bash", "/entrypoint.sh"]
