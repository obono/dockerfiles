FROM circleci/golang

WORKDIR /home/circleci/

ENV PATH="${PATH}:/home/circleci/bin"
ENV INSTALLER_URL="https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh"
ENV ADDITIONAL_URL="https://arduboy.github.io/board-support/package_arduboy_index.json"
ENV MUSTACHE_URL="https://github.com/cbroglie/mustache/releases/download/v1.0.1/mustache_1.0.1_linux_amd64.tar.gz"

RUN set -x && \
	curl -fsSL ${INSTALLER_URL} | sh && \
	arduino-cli --additional-urls ${ADDITIONAL_URL} core update-index && \
	arduino-cli --additional-urls ${ADDITIONAL_URL} core install arduboy:avr && \
	arduino-cli core install arduino:avr && \
	arduino-cli lib install Arduboy && \
	arduino-cli lib install Arduboy2 && \
	arduino-cli lib install ArduboyPlaytune && \
	arduino-cli lib install ArduboyTones && \
	arduino-cli lib install Arduboy-TinyFont && \
	sed -i -e "49a 0x10," Arduino/libraries/Arduboy/src/core/core.cpp && \
	sed -i -e "35a 0x10," Arduino/libraries/Arduboy2/src/Arduboy2Core.cpp && \
	arduino-cli sketch new sample && \
	arduino-cli compile --fqbn arduboy:avr:arduboy sample && \
	rm -rf sample && \
	curl -L ${MUSTACHE_URL} | tar xvfz - -C bin mustache
