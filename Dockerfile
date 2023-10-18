# ----------------------------------
# Pterodactyl Ntfy.Sh Dockerfile
# Environment: Ntfy.Sh
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM binwiederhier/ntfy

MAINTAINER KamikazeJAM, <kamikazejam.yt@gmail.com>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./server.yml /server.yml
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
