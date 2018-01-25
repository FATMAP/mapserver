#!/bin/sh

##
# Build the image.
#

set -e

# Everything happens under here.
cd /tmp

# Install the web server configuration.
cp ./lighttpd.conf /lighttpd.conf

# Install the Mapserver dependencies.
apt-get update -y
apt-get install -y \
        lighttpd \
        libfcgi-dev \
        libfreetype6-dev \
        libfribidi-dev \
        libharfbuzz-dev \
        libcairo2-dev

# Get Mapserver.
wget -nv http://download.osgeo.org/mapserver/mapserver-7.0.7.tar.gz
tar -xzf mapserver-7.0.7.tar.gz
cd mapserver-7.0.7
mkdir build
cd build

# Build and install Mapserver.
cmake -DWITH_CLIENT_WFS=ON \
      -DWITH_CLIENT_WMS=ON \
      -DWITH_CURL=ON \
      ../
make install

# Clean up.
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/partial/* /tmp/* /var/tmp/*
