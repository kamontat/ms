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

enabling_repeat_key() {
  if is_boolean "$1"; then
    defaults write -g ApplePressAndHoldEnabled -bool "$1"
  fi
}
__ms_controller enabling_repeat_key \
  "repeat/enabled" is_boolean ""

repeat_key_rate() {
  if is_integer "$1"; then
    defaults write NSGlobalDomain KeyRepeat -int "$1"
  fi
}
__ms_controller repeat_key_rate \
  "repeat/rate" is_integer ""

delay_repeat_key() {
  if is_integer "$1"; then
    defaults write NSGlobalDomain InitialKeyRepeat -int "$1"
  fi
}
__ms_controller delay_repeat_key \
  "repeat/delay" is_integer ""
