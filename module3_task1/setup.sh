#!/bin/bash
# Update package lists
apt-get update

# Install required packages
apt-get install -y make wget

# Install the required version of Hugo (0.84.0)
HUGO_VERSION=0.84.0
wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb
sudo dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb
rm hugo_${HUGO_VERSION}_Linux-64bit.deb