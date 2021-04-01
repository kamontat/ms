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

_install_homebrew() {
  cmd_title "/bin/bash -c <brew/install.sh>" /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
    cmd brew analytics off
}

_upgrade_homebrew() {
  cmd brew upgrade && cmd brew update
}

install_homebrew() {
  local mode="$1"
  if is_match "$mode" "auto" "install" && ! is_command "brew"; then
    _install_homebrew
  elif is_match "$mode" "auto" && is_command "brew"; then
    _upgrade_homebrew
  else
    __ms_warn "$MODULE_NAME" "skipping homebrew installation"
  fi
}
__ms_controller install_homebrew \
  "mode" is_mode "install"

install_mas() {
  if is_true "$1" && with_brew; then
    cmd brew install mas
  fi
}
__ms_controller install_mas \
  "mas/enabled" is_boolean "true"

bundle_install() {
  if is_string "$1"; then
    brewfile="$(__ms_assets "$1")"
    cmd brew bundle install \
      --file "$brewfile" \
      --no-upgrade \
      --verbose
  fi
}
__ms_controller bundle_install \
  "brewfile" is_string ''
