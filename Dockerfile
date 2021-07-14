FROM debian:buster-slim

COPY install.sh /install.sh

RUN mkdir /data \
	&& mkdir /include \
	&& apt-get update \
	&& apt-get install -y wget unzip \
	&& rm -rf /var/lib/apt/lists/*	

RUN ./install.sh

WORKDIR /data

CMD ["bash"]
