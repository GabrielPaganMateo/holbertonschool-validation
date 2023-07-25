FROM golang:1.15.8-buster

# Install Hugo
ENV HUGO_VERSION 0.84.0
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb \
    && dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb \
    && rm hugo_${HUGO_VERSION}_Linux-64bit.deb
RUN apt-get update && apt-get install -y zip
# Install golangci-lint
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.40.1

# Install other dependencies here...
COPY . /app
