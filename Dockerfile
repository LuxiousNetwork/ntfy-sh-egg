# ----------------------------------
# Pterodactyl Ntfy.Sh Dockerfile
# Environment: Ntfy.Sh
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM binwiederhier/ntfy

MAINTAINER KamikazeJAM, <kamikazejam.yt@gmail.com>

RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

COPY ./server.yml /home/container/server.yml

WORKDIR /home/container

ENTRYPOINT ["ntfy", "serve", "--config", "server.yml"]
