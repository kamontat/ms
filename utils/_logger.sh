#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

export __MS_COLOR_RESET='\033[0m'
export __MS_COLOR_DEFAULT='\033[0;2m'

__ms_setup_log() {
  export _MS_COLOR=${MS_SETTINGS__COLOR:-${_MS_COLOR}}
  export _MS_LOGGER_FILE=${MS_SETTINGS__LOGGER_FILE:-${_MS_LOGGER_FILE}}
  export _MS_LOGGER_LEVEL=("${MS_SETTINGS__LOGGER_LEVEL:-${_MS_LOGGER_LEVEL[@]}}")
}

# @params - 1 - level name
#           2 - level color
#           3 - title string
#           4 - message string
#           5 - title color name
# @warning    - title shouldn't more than 15 character
__ms__log_format() {
  if [[ "$_MS_COLOR" == true ]] && [[ "$_MS_LOGGER_FILE" != true ]]; then
    printf "[${2}%-5s${__MS_COLOR_RESET}]: ${5}%-19s${__MS_COLOR_RESET} %s${__MS_COLOR_RESET}\n" "$1" "$3" "$4"
  else
    if [[ "$_MS_LOGGER_FILE" == "true" ]]; then
      printf "[%-5s]: %-14s %s\n" "$1" "$3" "$4" >>"$__MSLOG_OUTPUT"
    else
      printf "[%-5s]: %-14s %s\n" "$1" "$3" "$4"
    fi
  fi
}

__ms_debug() {
  if [[ "${_MS_LOGGER_LEVEL[*]}" =~ debug ]]; then
    __ms__log_format "DEBUG" "$__MS_COLOR_DEBUG" "$1" "$2" "$3"
  fi
}
export -f __ms_debug

__ms_info() {
  if [[ "${_MS_LOGGER_LEVEL[*]}" =~ info ]]; then
    __ms__log_format "INFO" "$__MS_COLOR_INFO" "$1" "$2" "$3"
  fi
}
export -f __ms_info

__ms_warn() {
  if [[ "${_MS_LOGGER_LEVEL[*]}" =~ warn ]]; then
    __ms__log_format "WARN" "$__MS_COLOR_WARN" "$1" "$2" "$3"
  fi
}
export -f __ms_warn

__ms_error() {
  if [[ "${_MS_LOGGER_LEVEL[*]}" =~ error ]]; then
    __ms__log_format "ERROR" "$__MS_COLOR_ERROR" "$1" "$2" "$3"
  fi
}
export -f __ms_error
