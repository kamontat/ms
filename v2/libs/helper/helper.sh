#!/usr/bin/env bash
# shellcheck disable=SC1000

if [[ "$MY_DEBUG" == "true" ]]; then
  set -x #DEBUG - Display commands and their arguments as they are executed.
  # set -v #VERBOSE - Display shell input lines as they are read.
  # set -n #EVALUATE - Check syntax of the script but don't execute.
fi

export _ms_is_command_exist
_ms_is_command_exist() {
  if command -v "$1" &>/dev/null; then
    return 0
  else
    _ms_warn "Checking command $1: MISSING"
    return 1
  fi
}

export _ms_is_file_exist
_ms_is_file_exist() {
  if test -f "$1"; then
    return 0
  else
    _ms_warn "Checking file $1: NOT_FOUND"
    return 1
  fi
}

export _ms_is_file_contains
_ms_is_file_contains() {
  local filename="$1" searching="$2"
  if grep "$searching" "$filename" >/dev/null; then
    return 0
  else
    _ms_warn "Cannot found $searching in $filename file content"
    return 1
  fi
}

export _ms_is_folder_exist
_ms_is_folder_exist() {
  if test -d "$1"; then
    return 0
  else
    _ms_warn "Checking folder $1: NOT_FOUND"
    return 1
  fi
}

export _ms_is_string_exist
_ms_is_string_exist() {
  if test -n "$1"; then
    return 0
  else
    _ms_warn "Checking string '$1': EMPTY"
    return 1
  fi
}

# @helper
export _ms_throw
_ms_throw() {
  printf '%s\n' "$1" >&2 && is_integer "$2" && exit "$2"
  return 0
}

# @helper
export _ms_throw_if_empty
_ms_throw_if_empty() {
  local text="$1"
  test -z "$text" && _ms_throw "$2" "$3"
  return 0
}

# @option
export _ms_require_argument
_ms_require_argument() {
  _ms_throw_if_empty "$LONG_OPTVAL" "'$LONG_OPTARG' require argument" 9
}

# @option
export _ms_no_argument
_ms_no_argument() {
  [[ -n $LONG_OPTVAL ]] && ! [[ $LONG_OPTVAL =~ "-" ]] && _ms_throw "$LONG_OPTARG don't have argument" 9
  OPTIND=$((OPTIND - 1))
}

# @syscall
export _ms_set_key_value_long_option
_ms_set_key_value_long_option() {
  if [[ $OPTARG =~ "=" ]]; then
    LONG_OPTVAL="${OPTARG#*=}"
    LONG_OPTARG="${OPTARG%%=$LONG_OPTVAL}"
  else
    LONG_OPTARG="$OPTARG"
    LONG_OPTVAL="$1"
    OPTIND=$((OPTIND + 1))
  fi
}
