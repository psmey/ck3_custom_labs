FROM ubuntu:noble@sha256:1e622c5f073b4f6bfad6632f2616c7f59ef256e96fe78bf6a595d1dc4376ac02

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    git \
    golang-go \
    wget \
    ca-certificates \
    shellcheck \
    && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

# Install Nvm, Node.js and npm
ENV NVM_VERSION=v0.40.2
ENV NODE_VERSION=22

RUN wget -qO nvm_install.sh https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh \
    && bash nvm_install.sh \
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

RUN wget -q https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 \
    && wget -q https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64.sha256 \
    # Verify file
    && sha256sum -c hadolint-Linux-x86_64.sha256 \
    && rm hadolint-Linux-x86_64.sha256 \
    # Make executable
    && chmod +x hadolint-Linux-x86_64 \
    # Add to PATH
    && mv hadolint-Linux-x86_64 /bin/hadolint \
    # Verify installation
    && hadolint --version
