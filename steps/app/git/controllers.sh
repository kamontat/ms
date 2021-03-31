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

moving_gitconfig() {
  local overrided="$1" tmp="$2" file_path="$3"

  if test -f "$file_path"; then
    if is_true "$overrided"; then
      mv "$file_path" "${file_path}${tmp}"
    else
      __ms_info "$MODULE_NAME" "stop because gitconfig is exist"
      return 0
    fi
  fi

  __ms_decrypt_file "$(__ms_assets_path)" ".gitconfig"
  __ms_assets_mv ".gitconfig" "$file_path"
}

__ms_controller moving_gitconfig \
  "overrided" is_boolean "false" \
  "tmp/file-name" is_string ".tmp" \
  "file-path" is_string "$HOME/.gitconfig"
