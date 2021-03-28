#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__ms_assets() {
  local module="$MODULE_NAME" filename="$1"

  filepath="${__MS_STP}/${module}/assets/${filename}"
  if test -f "$filepath"; then
    echo "$filepath"
  else
    return 1
  fi
}
export -f __ms_assets
