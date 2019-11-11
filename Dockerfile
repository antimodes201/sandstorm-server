FROM ubuntu:18.04

MAINTAINER antimodes201

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

USER root

# Set some Variables
ENV BRANCH "public"
ENV INSTANCE_NAME "default"
ENV GAME_PORT "42433"
ENV QUERY_PORT "42434"

# dependencies
RUN dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
		lib32gcc1 \
		wget \
		unzip \
		ca-certificates && \
		rm -rf /var/lib/apt/lists/*

# add steamuser user
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steamuser && \
    usermod -G tty steamuser \
        && mkdir -p /steamcmd \
        && mkdir -p /sandstorm \
		&& mkdir -p /scripts \
        && chown steamuser:steamuser /sandstorm \
        && chown steamuser:steamuser /steamcmd \
		&& chown steamuser:steamuser /scripts 

# Install Steamcmd
USER steamuser
RUN cd /steamcmd && \
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
	tar -xf steamcmd_linux.tar.gz && \
	rm steamcmd_linux.tar.gz && \
	/steamcmd/steamcmd.sh +quit

ADD start.sh /scripts/start.sh

# Expose some port
EXPOSE ${GAME_PORT}/udp
EXPOSE ${QUERY_PORT}/udp

# Make a volume
# contains configs and world saves
VOLUME /sandstorm

CMD ["/scripts/start.sh"]
