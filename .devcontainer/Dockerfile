FROM ubuntu:noble@sha256:1e622c5f073b4f6bfad6632f2616c7f59ef256e96fe78bf6a595d1dc4376ac02

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    git \
    wget \
    ca-certificates \
    shellcheck \
    && rm -rf /var/lib/apt/lists/*
RUN update-ca-certificates

# Install Nvm, Node.js and npm
ENV NVM_VERSION=v0.40.2
ENV NODE_VERSION=22
RUN wget -qO /tmp/nvm_install.sh https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh \
    && bash /tmp/nvm_install.sh \
    && rm /tmp/nvm_install.sh \
    && source "${HOME}/.nvm/nvm.sh" \
    # Install Node.js
    && nvm install ${NODE_VERSION} \
    # Verify installation
    && node -v \
    && nvm current \
    && npm -v \
    # Install Prettier
    && npm install -g prettier@3.5.3

# Install Hadolint
ENV HADOLINT_VERSION=v2.12.0
RUN wget -qP /tmp https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 \
    && wget -qP /tmp https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64.sha256 \
    # Verify file
    && sed -i 's|hadolint-Linux-x86_64|/tmp/hadolint-Linux-x86_64|' /tmp/hadolint-Linux-x86_64.sha256 \
    && sha256sum -c /tmp/hadolint-Linux-x86_64.sha256 \
    && rm /tmp/hadolint-Linux-x86_64.sha256 \
    # Make executable
    && chmod +x /tmp/hadolint-Linux-x86_64 \
    # Add to PATH
    && mv /tmp/hadolint-Linux-x86_64 /usr/local/bin/hadolint \
    # Verify installation
    && hadolint --version

# Install CK3 Tiger
ENV CK3_TIGER_VERSION=v1.7.0
RUN wget -qP /tmp https://github.com/amtep/tiger/releases/download/${CK3_TIGER_VERSION}/ck3-tiger-linux-${CK3_TIGER_VERSION}.tar.gz \
    && tar --extract --gzip --file=/tmp/ck3-tiger-linux-${CK3_TIGER_VERSION}.tar.gz --directory=/opt \
    && rm /tmp/ck3-tiger-linux-${CK3_TIGER_VERSION}.tar.gz \
    # Make executable
    && chmod +x /opt/ck3-tiger-linux-${CK3_TIGER_VERSION}/ck3-tiger \
    # Add to PATH
    && ln -s /opt/ck3-tiger-linux-${CK3_TIGER_VERSION}/ck3-tiger /usr/local/bin/ck3-tiger \
    # Verify installation
    && ck3-tiger --version
