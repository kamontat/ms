#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# --------------------------- #
# Variables:
#   - MODULE_NAME - <module>/<name> (e.g. template/default)

export MODULE_KEY="KB"
export MODULE_REQUIREMENT=("mac")

## You have to choose between 2 behavior, when user press and hold the keys (more information https://www.howtogeek.com/267463/how-to-enable-key-repeating-in-macos)
## true  = Special character
## false = Repeat key
export __MS_SETTINGS__KB_ACCENTED_CHARACTER_ENABLED=false

## keyboard repeat rate
## [1] = 15ms
export __MS_SETTINGS__KB_REPEAT_RATE=3

## Set a time Delay until key repeat
## [1] = 15ms
export __MS_SETTINGS__KB_REPEAT_DELAY=10
