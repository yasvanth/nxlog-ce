###### Base image for nxlog service
FROM ubuntu:18.04

MAINTAINER Yasvant Babu <yasvanth.babu@heanet.ie>

ENV NXLOG_VERSION=2.10.2150
ENV NXLOG_PKG=nxlog-ce_${NXLOG_VERSION}_ubuntu_bionic_amd64.deb

RUN apt-get update \
    && apt-get install -y wget \
    && wget https://nxlog.co/system/files/products/files/348/${NXLOG_PKG} \
    && apt-get install -y ./${NXLOG_PKG} \
    && rm ${NXLOG_PKG} 


WORKDIR /etc/nxlog/

ENTRYPOINT ["nxlog", "-f", "/etc/nxlog/nxlog.conf"]
