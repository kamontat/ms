#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

is_command() {
  command -v "$1" >/dev/null 2>&1
}
export -f is_command

is_string() {
  test -n "$1" && return 0 || return 1
}
export -f is_string

# @explain    - check is input is boolean?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_boolean() {
  [[ $1 == true ]] || [[ $1 == false ]] 2>/dev/null && return 0 || return 1
}
export -f is_boolean

# @explain    - check is input is true?
# @params - 1 - variable to check
# @return     - 0 if is true; otherwise, return 1
is_true() {
  [[ $1 == true ]] 2>/dev/null && return 0 || return 1
}
export -f is_true

# @explain    - check is input is false?
# @params - 1 - variable to check
# @return     - 0 if is false; otherwise, return 1
is_false() {
  [[ $1 == false ]] 2>/dev/null && return 0 || return 1
}
export -f is_false

# @explain    - check is input is integer?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_integer() {
  [[ $1 =~ ^[0-9]+$ ]] 2>/dev/null && return 0 || return 1
}
export -f is_integer

# @explain    - check is input is sign integer (both positive and negative number)?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_sign_integer() {
  [[ $1 =~ ^-?[0-9]+$ ]] 2>/dev/null && return 0 || return 1
}
export -f is_sign_integer

# @explain    - check is input is decimal?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_decimal() {
  [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]] 2>/dev/null && return 0 || return 1
}
export -f is_decimal

# @explain    - check is input is sign decimal (both positive and negative number)?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_sign_decimal() {
  [[ $1 =~ ^-?[0-9]+([.][0-9]+)?$ ]] 2>/dev/null && return 0 || return 1
}
export -f is_sign_decimal

# @return     - 0 if has internet; 1 in otherwise
has_internet() {
  curl -s ifconfig.co/json >/dev/null 2>&1 && return 0 || return 1
}
export -f has_internet

# @explain    - check is input contains in given list
# @params - 1 - input
#           n - nth on list
# @return     - 0 if data contains in given list; otherwise, return 1
is_valid() {
  local input="$1"
  shift

  [[ "$*" =~ $input ]] && return 0 || return 1
}
export -f is_valid

# @explain    - check is input equals on given list
# @params - 1 - input
#           n - nth on list
# @return     - 0 if data is exist on given list; otherwise, return 1
is_match() {
  local input="$1"
  shift

  for i in "$@"; do
    if [[ "$i" == "$input" ]]; then
      return 0
    fi
  done

  return 1
}
export -f is_match

# @explain    - check is input code is error
# @params - 1 - input number
# @return     - 0 if non-zero number; otherwise, return 1
is_errcode() {
  [[ "$1" != 0 ]] && return 0 || return 1
}
export -f is_errcode

# @explain    - check current os (macos)
# @return     - 0 if this is macos; otherwise, return 1
is_mac() {
  uname | grep -iq "darwin"
}
export -f is_mac

# @explain    - check current os (linux)
# @return     - 0 if this is linux; otherwise, return 1
is_linux() {
  uname | grep -iq "linux"
}
export -f is_linux
