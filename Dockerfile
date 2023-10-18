# ----------------------------------
# Pterodactyl Ntfy.Sh Dockerfile
# Environment: Ntfy.Sh
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM openjdk:8-jdk-alpine
FROM binwiederhier/ntfy

MAINTAINER KamikazeJAM, <kamikazejam.yt@gmail.com>

RUN adduser --disabled-password --home /home/container container
RUN ls /bin

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./server.yml /server.yml
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Alphine Image
CMD ["/bin/sh", "/entrypoint.sh"]
