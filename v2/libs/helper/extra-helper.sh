#!/usr/bin/env bash
# shellcheck disable=SC1000

if [[ "$MY_DEBUG" == "true" ]]; then
  set -x #DEBUG - Display commands and their arguments as they are executed.
  # set -v #VERBOSE - Display shell input lines as they are read.
  # set -n #EVALUATE - Check syntax of the script but don't execute.
fi

_ms_help() {
  echo "wip"
}

_ms_version() {
  echo "${_MS_NAME}: ${_MS_LATEST_VERSION} (${_MS_LATEST_UPDATED})"
}
