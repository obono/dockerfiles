[![](https://images.microbadger.com/badges/image/obono/arduboy-env:latest.svg)](https://microbadger.com/images/obono/arduboy-env:latest "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/obono/arduboy-env:latest.svg)](https://microbadger.com/images/obono/arduboy-env:latest "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/obono/arduboy-env:latest.svg)](https://microbadger.com/images/obono/arduboy-env:latest "Get your own commit badge on microbadger.com")

This is a build environment for [Arduboy&trade;](https://arduboy.com/) using [arduino-cli](https://github.com/arduino/arduino-cli) based on 'ubuntu' docker image.

You can compile the source code for Arduboy&trade; platform by the following command.

    $ arduino-cli compile --fqbn arduboy:avr:arduboy (path of the sketch directory)

Several commands are also available: `sudo`, `curl`, `git`, `jq` and `mustache`.

The following libraries are installed.

* [Arduboy](https://github.com/Arduboy/Arduboy)
* [Arduboy2](https://github.com/MLXXXp/Arduboy2)
* [ArduboyPlaytune](https://github.com/Arduboy/ArduboyPlaytune)
* [ArduboyTones](https://github.com/MLXXXp/ArduboyTones)
* [Arduboy-TinyFont](https://github.com/yinkou/Arduboy-TinyFont)

You can append a library by the following command.

    $ arduino-cli lib install (library name)

