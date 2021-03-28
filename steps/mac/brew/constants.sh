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

export MODULE_KEY="brew"
export MODULE_REQUIREMENT=("network" "mac")

## install - install only if not exist
## auto    - install if not exist, upgrade if exist
## none    - ignore brew command
# export __MS_SETTINGS__BREW_MODE="install"

## enabled mac app store on cli
# export __MS_SETTINGS__BREW_MAS_ENABLED=true

## filename on assets for load bundle, empty string will be ignored
# export __MS_SETTINGS__BREW_BREWFILE="Brewfile"
