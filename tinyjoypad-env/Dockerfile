FROM ubuntu:focal-20201008

MAINTAINER obono

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.name="obono/tinyjoypad-env" \
	org.label-schema.description="A build environment for TinyJoypad using arduino-cli." \
	org.label-schema.license="CC0" \
	org.label-schema.url="https://hub.docker.com/r/obono/tinyjoypad-env" \
	org.label-schema.vcs-url="https://github.com/obono/dockerfiles" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vendor="obono" \
	org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND=noninteractive
ENV MUSTACHE_BIN_URL="https://github.com/cbroglie/mustache/releases/download/v1.2.0/mustache_1.2.0_linux_amd64.tar.gz"
ENV ARDUINO_INSTALLER_URL="https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh"
ENV ARDUINO_ADDITIONAL_URL="http://drazzy.com/package_drazzy.com_index.json"

RUN set -x && \
	apt-get update && \
	apt-get install -y sudo curl git jq && \
	apt-get clean && \
	curl -fsSL ${MUSTACHE_BIN_URL} | tar xvfz - -C /usr/local/bin mustache && \
	curl -fsSL ${ARDUINO_INSTALLER_URL} | BINDIR=/usr/local/bin sh && \
	groupadd --gid 3434 circleci && \
	useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci && \
	echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci && \
	echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

USER circleci
WORKDIR /home/circleci

RUN set -x && \
	arduino-cli --additional-urls ${ARDUINO_ADDITIONAL_URL} core update-index && \
	arduino-cli --additional-urls ${ARDUINO_ADDITIONAL_URL} core install ATTinyCore:avr && \
	arduino-cli core install arduino:avr && \
	arduino-cli lib install ssd1306xled && \
	arduino-cli sketch new sample && \
	arduino-cli compile --fqbn ATTinyCore:avr:attinyx5:LTO=enable,TimerClockSource=default,chip=85,clock=16pll,eesave=aenable,bod=disable,millis=enabled sample && \
	rm -rf sample
