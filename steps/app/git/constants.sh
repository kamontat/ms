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

export MODULE_KEY="git"
export MODULE_REQUIREMENT=("command:git" "command:gpg") # @see __ms_requirement (_controllers.sh)

export __MS_SETTINGS__GIT_OVERRIDED=false
export __MS_SETTINGS__GIT_TMP_FILE_EXTENSION=".cache"

export __MS_SETTINGS__GIT_FILE_PATH="$HOME/.gitconfig"
