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

decrypting_istat_config() {
  local assets filename="istat-menus-settings.ismp"
  assets="$(__ms_assets_path)"

  cmd __ms_decrypt_file "$assets" "$filename"
  __ms_controller_instruction "iStat Menus Settings" \
    "Setting: $assets/$filename"
}

__ms_controller decrypting_istat_config
