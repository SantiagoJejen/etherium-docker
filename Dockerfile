FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -qy git mercurial software-properties-common
RUN apt-get install -qy libgmp3-dev libreadline6-dev
RUN apt-get install -qy build-essential
RUN apt-get install zsh -y
# golang
RUN apt-get install -qy golang

#nuevo
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update 
RUN apt-get install -y ethereum 
RUN mkdir mired
WORKDIR /mired 
RUN mkdir node1
RUN mkdir node2
COPY genesis.json /mired/

# RUN geth --datadir node1 account new
# #HACER LA COPIA DE GENESIS.JASON 
# RUN geth --identity node1 init ./genesis.json --datadir node
# RUN geth --datadir node1 --maxpeers 2 --networkid 13 --http.addr "0.0.0.0" --http.port 8545 --port 30301
# #NODE 2 
# RUN geth --identity node2 --datadir node2 init genesis.json or geth --identity node2 init genesis.json
# RUN geth --datadir node2 --maxpeers 2 --networkid 13 --http --httpcorsdomain "*" --port 30302 --httpport 8546