FROM ubuntu:noble-20250404

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.name="obono/arduboy-env" \
	org.label-schema.description="A build environment for Arduboy(TM) using arduino-cli." \
	org.label-schema.url="https://hub.docker.com/r/obono/arduboy-env" \
	org.label-schema.vcs-url="https://github.com/obono/dockerfiles" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vendor="obono" \
	org.label-schema.version=$VERSION \
	org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND=noninteractive
ENV MUSTACHE_BIN_URL="https://github.com/cbroglie/mustache/releases/download/v1.4.0/mustache_1.4.0_linux_amd64.tar.gz"
ENV ARDUINO_INSTALLER_URL="https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh"
ENV ARDUINO_ADDITIONAL_URL="https://raw.githubusercontent.com/MrBlinky/Arduboy-homemade-package/master/package_arduboy_homemade_index.json"

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
	arduino-cli --additional-urls ${ARDUINO_ADDITIONAL_URL} core install arduboy-homemade:avr && \
	arduino-cli core install arduino:avr && \
	sed -i -e "128i 0x10," .arduino15/packages/arduboy-homemade/hardware/avr/1.4.0/libraries/Arduboy/src/core/core.cpp && \
	sed -i -e "116i 0x10," .arduino15/packages/arduboy-homemade/hardware/avr/1.4.0/libraries/Arduboy2/src/Arduboy2Core.cpp && \
	arduino-cli sketch new sample && \
	arduino-cli compile --fqbn arduboy-homemade:avr:arduboy --build-properties "core=arduboy-core,boot=org" sample && \
	rm -rf sample
