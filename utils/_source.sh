#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__MS__UTILS_SOURCE="utils/source"

__ms__load_file() {
  local type="${1:-error}" basedir="$2" moduledir="$3" filename="$4" fullpath
  local key cmd="__ms_${type}"

  if test -n "$filename"; then
    fullpath="$basedir/$moduledir/$filename"
    key="$moduledir/$filename"
  elif test -n "$moduledir"; then
    fullpath="$basedir/$moduledir"
    key="$moduledir"
  elif test -n "$basedir"; then
    fullpath="$basedir"
    key="$(basename "$basedir")"
  fi

  if ! test -f "$fullpath"; then
    "$cmd" "$__MS__UTILS_SOURCE" "cannot found file at ${fullpath}"
    return 1
  fi

  if test -f "$fullpath"; then
    # shellcheck disable=SC1090
    source "$fullpath"
    exitcode="$?"

    if [[ $exitcode != 0 ]]; then
      "$cmd" "$__MS__UTILS_SOURCE" "source '$key' return error"
    fi

    return ${exitcode}
  else
    "$cmd" "$__MS__UTILS_SOURCE" "file '$key' is not exist"
    return 1
  fi
}

__ms_load_strict_file() {
  __ms__load_file "error" "$1" "$2" "$3"
  # exitcode="$?"

  # if [[ $exitcode != 0 ]] && [[ $exitcode != 99 ]]; then
  #   exit "$exitcode"
  # fi
}
export -f __ms_load_strict_file

__ms_load_file() {
  __ms__load_file "warn" "$1" "$2" "$3"
}
export -f __ms_load_file
