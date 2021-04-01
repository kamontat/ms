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
#   - __ms_controller_instruction <title> [<steps>]...
#   - __ms_assets <filename.ext> - return fullpath of asset

_download_setapp_zip() {
  local location="$1"

  cmd curl -Lo "$location" "https://dl.devmate.com/com.setapp.InstallSetapp/InstallSetapp.zip"

  __ms_controller_instruction "Install Setapp" \
    "Zip: $location"
}

downloading_setapp_zip() {
  local mode="$1" dest="$2" app="$3"

  if is_match "$mode" "download"; then
    _download_setapp_zip "$dest"
  elif is_match "$mode" "auto" && ! test -d "$app"; then
    _download_setapp_zip "$dest"
  fi
}

__ms_controller downloading_setapp_zip \
  "mode" is_mode "auto" \
  "download/location" is_string "$HOME/Downloads" \
  "application/location" is_string "/Applications/Setapp.app"
