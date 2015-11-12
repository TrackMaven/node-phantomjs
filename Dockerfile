FROM ubuntu:trusty

MAINTAINER Josh Finnie <josh.finnie@trackmaven.com>

# Upgrading the new image
RUN \
  apt-get -y update && \
  apt-get install -y apt-transport-https \
                     build-essential \
                     bzip2 \
                     python2.7-dev \
                     software-properties-common \
                     wget

# Install Node.js
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 68576280 && \
  apt-add-repository 'deb https://deb.nodesource.com/node_4.x precise main' && \
  apt-get update && \
  apt-get install -y nodejs

# Install Stable NPM
RUN \
  npm install npm@3.3.12

# Install Phantom.js
ENV PHANTOMJS_VERSION 1.9.7

RUN \
  apt-get install -y libfreetype6 libfontconfig && \
  wget -q https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar xjf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  install -t /usr/local/bin phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs && \
  rm -rf phantomjs-$PHANTOMJS_VERSION-linux-x86_64 && \
  rm phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
