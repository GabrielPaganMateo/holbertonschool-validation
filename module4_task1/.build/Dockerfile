FROM golang:1.15.8-buster

# Install Hugo
ENV HUGO_VERSION 0.84.0
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb \
    && dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb \
    && rm hugo_${HUGO_VERSION}_Linux-64bit.deb

# Install golangci-lint
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.40.1

# Install other dependencies here...
COPY ./module4_task1/ /app
WORKDIR /app