#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__MS__UTILS_SETTINGS="utils/settings"

__ms__build_setting() {
  echo "$1" | tr '[:lower:]' '[:upper:]' | tr '/' '_' | tr '-' '_'
}

__ms__get_settings() {
  local module="$MODULE_KEY" varname="$1" prefix="$2" name="$3" nolog="$4"
  local setting_path="$module/${name}" setting_name

  setting_name="${prefix}$(__ms__build_setting "${setting_path}")"

  if ! is_string "$nolog"; then
    __ms_debug "$__MS__UTILS_SETTINGS" "querying ${setting_path} (\$$setting_name)"
  fi

  eval "$varname=\${${setting_name}:-\${$varname}}"

  if ! is_string "$nolog"; then
    eval "__ms_debug '$__MS__UTILS_SETTINGS' \"$varname = \${${setting_name}:-\${$varname}}\""
  fi
}

__ms_get_settings() {
  __ms__get_settings "$1" "__MS_SETTINGS__" "$2" "disabled-log"
  __ms__get_settings "$1" "MS_SETTINGS__" "$2" # MS_SETTINGS__ will override everything
}
