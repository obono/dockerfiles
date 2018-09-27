FROM circleci/golang

ADD ./.cli-config.yml /home/circleci/

WORKDIR /home/circleci/

RUN set -x && \
	go get -u github.com/arduino/arduino-cli && \
	arduino-cli --config-file .cli-config.yml core update-index && \
	arduino-cli --config-file .cli-config.yml core install arduboy:avr && \
	arduino-cli core install arduino:avr && \
	arduino-cli lib install Arduboy && \
	arduino-cli lib install Arduboy2 && \
	arduino-cli lib install ArduboyPlaytune && \
	arduino-cli lib install ArduboyTones && \
	arduino-cli lib install Arduboy-TinyFont && \
	arduino-cli sketch new sample && \
	arduino-cli compile --fqbn arduboy:avr:arduboy Arduino/sample && \
	rm -rf Arduino/sample
