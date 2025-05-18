FROM ubuntu:noble@sha256:6015f66923d7afbc53558d7ccffd325d43b4e249f41a6e93eef074c9505d2233

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN useradd -m -s /bin/bash steam

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common debconf-utils \
    && rm -rf /var/lib/apt/lists/*

# Install steamcmd
RUN add-apt-repository multiverse \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && echo steam steam/license note '' | debconf-set-selections \
    && echo steam steam/question select "I AGREE" | debconf-set-selections \
    && apt-get install -y --no-install-recommends steamcmd \
    && ln -s /usr/games/steamcmd /usr/local/bin/steamcmd \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /home/steam/entrypoint.sh

RUN chmod +x /home/steam/entrypoint.sh

USER steam
WORKDIR /home/steam

ENTRYPOINT ["/home/steam/entrypoint.sh"]
