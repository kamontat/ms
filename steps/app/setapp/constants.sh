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

export MODULE_KEY="sap"                              # Setapp
export MODULE_REQUIREMENT=("network" "command:curl") # @see __ms_requirement (_controllers.sh)

# auto     - download zip on Download folder if Setapp.app is not exist on /Application
# download - always download
# none     - do nothing
export __MS_SETTINGS__SAP_MODE="auto"

export __MS_SETTINGS__SAP_APPLICATION_LOCATION="/Applications/Setapp.app"

export __MS_SETTINGS__SAP_DOWNLOAD_LOCATION="$HOME/Downloads"
