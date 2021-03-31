#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__MS__UTILS_ENV="utils/env"

__ms_setup_env() {
  local key value
  for i in "$@"; do
    key="MS_SETTINGS__$(__ms__build_setting "${i//=*/}")"
    value="${i##*=}"

    eval "$key='$value'"
    __ms_debug "\$$__MS__UTILS_ENV" "$key = '$value'"
  done
}
export -f __ms_setup_env
