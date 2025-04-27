This is a build environment for [Arduboy&trade;](https://arduboy.com/) using [arduino-cli](https://github.com/arduino/arduino-cli) based on 'ubuntu' docker image.

You can compile the source code for Arduboy&trade; platform by the following command.

    $ arduino-cli compile --fqbn arduboy-homemade:avr:arduboy (path of the sketch directory)

Several commands are also available: `sudo`, `curl`, `git`, `jq` and `mustache`.

You can append a library by the following command.

    $ arduino-cli lib install (library name)

