FROM circleci/golang

ADD ./arduino-yaml /home/circleci/

WORKDIR /home/circleci/

RUN set -x && \
	go get -u github.com/arduino/arduino-cli && \
	arduino-cli --config-file arduino-yaml core update-index && \
	arduino-cli --config-file arduino-yaml core install arduboy:avr && \
	arduino-cli core install arduino:avr && \
	arduino-cli lib install Arduboy && \
	arduino-cli lib install Arduboy2 && \
	arduino-cli lib install ArduboyPlaytune && \
	arduino-cli lib install ArduboyTones && \
	arduino-cli lib install Arduboy-TinyFont && \
	sed -i -e "49a 0x10," Arduino/libraries/Arduboy/src/core/core.cpp && \
	sed -i -e "35a 0x10," Arduino/libraries/Arduboy2/src/Arduboy2.cpp && \
	arduino-cli sketch new sample && \
	arduino-cli compile --fqbn arduboy:avr:arduboy Arduino/sample && \
	rm -rf Arduino/sample

# Added for version 0.3
RUN go get -u github.com/cbroglie/mustache/...
