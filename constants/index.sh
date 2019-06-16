#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Start configurations, every configuration will prefix with _MS_
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        15/06/2019
#/ -----------------------------------

# use as username
export _MS_USERNAME=""

# true  = output will colorize everythings
# false = never color anything
export _MS_COLOR=true

export __MS_COLOR_HIGHLIGHT="\e[36m"
export __MS_COLOR_LOG="\033[0;32m"
export __MS_COLOR_WARN="\033[0;33m"
export __MS_COLOR_ERROR="\033[0;31m"

# log   = log everything
# warn  = log only warning and error
# error = log only error
export _MS_LOGGER_LEVEL="log" # empty will be "log" level

# true  = log to file
# false = log to console
export _MS_LOGGER_FILE=false

# support only bash | zsh
# bash = bash version 4
# zsh  = zsh version 5
export _MS_SHELL_NAME="bash"
