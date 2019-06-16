#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  ...
#/ How to:       ...
#/               ...
#/ Option:       --help | -h | -? | help | h | ?
#/                   > show this message
#/               --version | -v | version | v
#/                   > show command version
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathumrong <work@kamontat.net>
#/ Since:        16/06/2019
#/ -----------------------------------
#/ Error code    1      -- error
#/ -----------------------------------
#/ Known bug:    ...
#/ -----------------------------------
#// Version:      0.0.1   -- description
#//               0.0.2b1 -- beta-format
#//               0.0.2a1 -- alpha-format

export __MS_COLOR_RESET='\033[0m'
export __MS_COLOR_DEFAULT='\033[0;2m'

# @params - 1 - level name
#           2 - level color
#           3 - title string
#           4 - message string
#           5 - title color name
# @warning    - title shouldn't more than 15 character
__ms__log_format() {
  if [[ "$_MS_COLOR" == true ]]; then
    printf "[${2}%-5s${__MS_COLOR_RESET}]: ${5}%-15s${__MS_COLOR_RESET} %s${__MS_COLOR_RESET}\n" "$1" "$3" "$4"
  else
    printf "[%-5s]: %-10s %s\n" "$1" "$3" "$4"
  fi
}

__ms_log() {
  [[ "$_MS_LOGGER_LEVEL" == "error" ]] && return 0
  [[ "$_MS_LOGGER_LEVEL" == "warn" ]] && return 0

  if [[ "$_MS_LOGGER_FILE" == "true" ]]; then
    __ms__log_format "log" "$__MS_COLOR_LOG" "$1" "$2" "$3" >>"$__MSTMP_LOG_O"
  else
    __ms__log_format "log" "$__MS_COLOR_LOG" "$1" "$2" "$3"
  fi

}

__ms_warn() {
  [[ "$_MS_LOGGER_LEVEL" == "error" ]] && return 0

  if [[ "$_MS_LOGGER_FILE" == "true" ]]; then
    __ms__log_format "warn" "$__MS_COLOR_WARN" "$1" "$2" "$3" >>"$__MSTMP_LOG_W"
  else
    __ms__log_format "warn" "$__MS_COLOR_WARN" "$1" "$2" "$3" >&2
  fi
}

__ms_error() {
  if [[ "$_MS_LOGGER_FILE" == "true" ]]; then
    __ms__log_format "error" "$__MS_COLOR_ERROR" "$1" "$2" "$3" >>"$__MSTMP_LOG_O"
  else
    __ms__log_format "error" "$__MS_COLOR_ERROR" "$1" "$2" "$3" >&2
  fi
}

export -f __ms_log
export -f __ms_warn
export -f __ms_error
