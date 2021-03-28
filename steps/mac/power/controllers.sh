#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# --------------------------- #
# Variables:
#   - MODULE_NAME - <module>/<name> (e.g. template/default, mac/brew)
#   - MODULE_KEY  - <key> (e.g. def, brew)
# Functions:
#   - __ms_controller <callback> [<setting_path>, <validator>, <default>]...
#   - __ms_assets <filename.ext> - return fullpath of asset

standby_process() {
  local enabled="$1" threshold="$2" delay_high="$3" delay_low="$4"

  if is_true "$enabled"; then
    sudo_cmd pmset -a standby 1
  elif is_false "$enabled"; then
    sudo_cmd pmset -a standby 0
  fi

  if is_integer "$threshold"; then
    sudo_cmd pmset -a highstandbythreshold "$threshold"
  fi

  if is_integer "$delay_high"; then
    sudo_cmd pmset -a standbydelayhigh "$delay_high"
  fi

  if is_integer "$delay_low"; then
    sudo_cmd pmset -a standbydelaylow "$delay_low"
  fi
}

__ms_controller standby_process \
  "standby/enabled" is_boolean "" \
  "standby/threshold" is_integer "" \
  "standby/delay-high" is_integer "" \
  "standby/delay-low" is_integer ""
