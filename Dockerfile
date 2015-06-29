# Pull base image.
FROM ubuntu:14.04

# S6 - add overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.13.0.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xvzf /tmp/s6-overlay-amd64.tar.gz -C /

ENV DEBIAN_FRONTEND noninteractive

# Install Privoxy/Tor
RUN echo "deb http://deb.torproject.org/torproject.org/ trusty main" > /etc/apt/sources.list.d/tor.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install cloud-utils tor privoxy curl

# S6 - copy configs
COPY services.d/ /etc/services.d/

# Privoxy - listen all interfaces and forward to TOR
RUN sed -i 's/^listen-address.*/listen-address    :8118/' /etc/privoxy/config
RUN echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config

# TOR - don't run as a daemon
RUN sed -i 's/^#RunAsDaemon.*/RunAsDaemon 0/' /etc/tor/torrc

ENTRYPOINT ["/init"]

# Expose Privoxy Port
EXPOSE 8118
