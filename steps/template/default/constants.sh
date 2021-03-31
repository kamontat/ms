#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# --------------------------- #
# Variables:
#   - MODULE_NAME - <module>/<name> (e.g. template/default)

export MODULE_KEY="def"
export MODULE_REQUIREMENT=() # @see __ms_requirement (_controllers.sh)

# __MS_SETTINGS__<MODULE_KEY>_<SETTINGS_PATH>
export __MS_SETTINGS__DEF_DATA_ENABLED=f
