#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__MS__UTILS_CMD="utils/command"

bash_cmd() {
  cmd "bash" "-c" "$@"
}
export -f bash_cmd

sudo_cmd() {
  cmd "sudo" "$@"
}
export -f sudo_cmd

cmd() {
  local command="$1"
  shift
  local args=("$@")

  __ms_debug "$__MS__UTILS_CMD" "$ ${command} ${args[*]}"
  if ! is_true "$_MS_DRYRUN"; then
    "${command}" "${args[@]}"
  fi
}
export -f cmd
