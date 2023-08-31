# ----------------------------------
# Pterodactyl Ntfy.Sh Dockerfile
# Environment: Ntfy.Sh
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM binwiederhier/ntfy

MAINTAINER KamikazeJAM, <kamikazejam.yt@gmail.com>

COPY server.yml /etc/ntfy/server.yml

RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

# COPY ./entrypoint.sh /entrypoint.sh
# CMD ["/bin/bash", "/entrypoint.sh"]	

ENTRYPOINT ["ntfy", "serve"]
