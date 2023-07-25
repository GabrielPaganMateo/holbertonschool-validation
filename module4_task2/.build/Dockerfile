FROM golang:1.15.8-buster

# Install Hugo
ENV HUGO_VERSION 0.84.0

# Use pipefail option recommended by DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https=1.8.2.3 \
    ca-certificates=20200601~deb10u2 \
    software-properties-common=0.96.20.2-2 \
    # hadolint ignore=DL3008
    curl \
    # DL3008: Pin versions in apt get install
    zip=3.0-11+b1 \
 && curl -s https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    docker-ce=5:20.10.7~3-0~debian-buster \
 && curl -sL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb -o hugo.deb \
 && dpkg -i hugo.deb \
 && rm hugo.deb \
 && curl -sL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.40.1 \
 && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
 && apt-get install -y --no-install-recommends \
    # hadolint ignore=DL3008
    nodejs \
 && npm install -g markdownlint-cli@0.27.1 \
 # DL3009: Delete the apt-get lists after installing something
 && rm -rf /var/lib/apt/lists/*

# Install other dependencies here...
COPY . /app

