FROM debian:buster-slim

RUN mkdir /data \
	&& mkdir /include \
	&& apt-get update \
	&& apt-get install -y wget unzip \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /scripting

COPY ./addons/sourcemod/scripting /scripting

WORKDIR /data

CMD ["bash"]
