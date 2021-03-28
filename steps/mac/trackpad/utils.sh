#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

export const_force="force"
export const_four="four"
export const_three="three"
export const_none="none"

is_lookup_string() {
  is_valid "$1" "$const_force" "$const_three" "$const_none"
}
export -f is_lookup_string

is_gesture_string() {
  is_valid "$1" "$const_four" "$const_three"
}
export -f is_gesture_string

cleanup() {
  unset is_lookup_string
  unset const_force const_three const_none
}
