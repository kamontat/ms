#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Helper method only !!
#/               is_boolean
#/               is_integer
#/               is_sign_integer
#/               is_decimal
#/               is_sign_decimal
#/               to_lower_case
#/               to_upper_case
#/               is_command_exist
#/               is_file_exist
#/               is_folder_exist
#/               get_abs_filename
#/               has_internet
#/               get_env
#/               get_env_value
#/               throw
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        16/06/2019
#/ -----------------------------------
#// Version:      1.0.0   -- release helper version

# @explain    - check is input is boolean?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_boolean() {
  [[ $1 == true ]] || [[ $1 == false ]] 2>/dev/null && return 0 || return 1
}

# @explain    - check is input is integer?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_integer() {
  [[ $1 =~ ^[0-9]+$ ]] 2>/dev/null && return 0 || return 1
}

# @explain    - check is input is sign integer (both positive and negative number)?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_sign_integer() {
  [[ $1 =~ ^-?[0-9]+$ ]] 2>/dev/null && return 0 || return 1
}

# @explain    - check is input is decimal?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_decimal() {
  [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]] 2>/dev/null && return 0 || return 1
}

# @explain    - check is input is sign decimal (both positive and negative number)?
# @params - 1 - variable to check
# @return     - 0 if is a boolean; otherwise, return 1
is_sign_decimal() {
  [[ $1 =~ ^-?[0-9]+([.][0-9]+)?$ ]] 2>/dev/null && return 0 || return 1
}

# @params - 1 - command name like ls, cd, rm, ...
# @return     - true if command exist
is_command_exist() {
  command -v "$1" >/dev/null 2>&1
}

# @params - 1 - file name
# @return     - true if file exist
is_file_exist() {
  [ -f "$1" ] && return 0 || return 1
}

# @params - 1 - folder name
# @return     - true if folder exist
is_folder_exist() {
  [ -d "$1" ] && return 0 || return 1
}

# @params - 1 - variable value
# @return     - true if variable contain some string
is_variable_exist() {
  test -n "$1" && return 0 || return 1
}

# @return     - 0 if has internet; 1 in otherwise
has_internet() {
  curl -s ifconfig.co/json >>/dev/null && return 0 || return 1
}

# @explain    - change every character to lower case
# @params - 1 - text string
# @return     - lower case of input string
to_lower_case() {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}

# @explain    - change every character to upper case
# @params - 1 - text string
# @return     - upper case of input string
to_upper_case() {
  echo "$1" | tr '[:lower:]' '[:upper:]'
}

# @params - 1 - relative file path
# @return     - absolute file path
get_abs_filename() {
  local seperator="/"
  local curr rel_filename basename absolute_dir f s l
  curr="$PWD"
  # $1 : relative filename
  rel_filename="$1"
  f="${rel_filename:0:1}"                  # first char
  s="${rel_filename:1:1}"                  # second char
  l="${rel_filename:${#rel_filename}-1:1}" # last char

  # handle if input have / in the last char, REMOVE IT!
  [[ $l == "/" ]] &&
    rel_filename="${rel_filename:0:${#rel_filename}-1}"
  # handle input is already absolute path
  [[ $f == "/" ]] &&
    echo "$rel_filename" &&
    return 0
  [[ $f == "." ]] && [[ $s == "/" ]] &&
    rel_filename="${rel_filename:2:${#rel_filename}}"

  # relative directory
  dir="$(dirname "$rel_filename")"
  mkdir -p "$dir" &>/dev/null
  # filename
  basename="$(basename "${rel_filename[*]}")"
  test -z "$basename" && seperator=""
  # absolute directory path
  absolute_dir="$(cd "$dir" && pwd)"
  # mere together
  echo "${absolute_dir}${seperator}${basename}"
  cd "$curr" || return 1
}

# @explain    - get environment from terminal
# @params - 1 - regex for variable name
# @return     - the env as format "<key>=<value>"
get_env() {
  # since 'printenv' only return the export function
  # so 'sed /BASH_FUNC/,$d' will delete the line contains 'BASH_FUNC' until end of file
  # BASH_FUNC - keyword that bash add when print function
  # shellcheck disable=SC2015
  is_command_exist env &&
    env | sed '/BASH_FUNC/,$d' | grep "$1" ||
    printenv | sed '/BASH_FUNC/,$d' | grep "$1"
}

# @explain    - get environment value from terminal
# @params - 1 - variable name
# @return     - return only the value of environment; if more than 1 this will choose the first result
get_env_value() {
  local key key2
  key="$(get_env "$1" | head -n 1)"
  echo "${key#*=}"
}

# @explain    - exit non zero code with message
# @params - 1 - error message
#           2 - error code (optional) -- log the error only if didn't specify this code
throw() {
  is_command_exist "__ms_error" && __ms_error "$1" && is_integer "$2" && exit "$2"
  printf 'Error: %s\n' "$1" >&2 && is_integer "$2" && exit "$2"
}

export -f is_boolean
export -f is_integer
export -f is_sign_integer
export -f is_decimal
export -f is_sign_decimal

export -f to_lower_case
export -f to_upper_case

export -f is_command_exist
export -f is_file_exist
export -f is_folder_exist
export -f get_abs_filename

export -f has_internet

export -f get_env
export -f get_env_value

export -f throw
