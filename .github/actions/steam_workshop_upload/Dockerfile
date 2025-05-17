FROM ubuntu:noble@sha256:6015f66923d7afbc53558d7ccffd325d43b4e249f41a6e93eef074c9505d2233

RUN useradd -m -s /bin/bash steam

RUN add-apt-repository multiverse \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends steamcmd \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER steam

WORKDIR /home/steam

ENTRYPOINT ["/entrypoint.sh"]
