FROM debian:buster-slim

ARG os=linux

COPY install.sh /install.sh

RUN mkdir /data \
	&& mkdir /include \
	&& apt-get update \
	&& apt-get install -y wget unzip \
	&& rm -rf /var/lib/apt/lists/*	

RUN ./install.sh $os

WORKDIR /data

CMD ["bash"]
