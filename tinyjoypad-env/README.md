This is a build environment for [TinyJoypad](https://www.tinyjoypad.com/tinyjoypad_attiny85) using [arduino-cli](https://github.com/arduino/arduino-cli) based on 'ubuntu' docker image.

You can compile the source code for TinyJoypad platform by the following command.

    $ arduino-cli compile --fqbn ATTinyCore:avr:attinyx5:chip=85,clock=16pll,bod=disable,eesave=aenable,TimerClockSource=default,LTO=enable,millis=enabled (path of the sketch directory)

Several commands are also available: `sudo`, `curl`, `git`, `jq` and `mustache`.

The following library is installed.

* [ssd1306xled](https://github.com/Defragster/ssd1306xled)

You can append a library by the following command.

    $ arduino-cli lib install (library name)
