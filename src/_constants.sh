#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

export _MS_STEPS=(
  # "template/default"
  # "mac/brew"
  # "mac/power"
  # "mac/keyboard"
  # "mac/trackpad"
  "app/intellij"
)

export _MS_DRYRUN=true

# true  = output will colorize everythings
# false = never color anything
export _MS_COLOR=true

# true  = log to file
# false = log to console
export _MS_LOGGER_FILE=false

export _MS_LOGGER_LEVEL=("debug" "info" "warn" "error")

export __MS_COLOR_HIGHLIGHT="\e[36m"
export __MS_COLOR_DEBUG=""
export __MS_COLOR_INFO="\033[0;32m"
export __MS_COLOR_WARN="\033[0;33m"
export __MS_COLOR_ERROR="\033[0;31m"
