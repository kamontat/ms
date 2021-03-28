#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__ms_old_location="$PWD"
cd "$(dirname "${BASH_SOURCE[0]}")/.." || exit 1

# --------------------------------- #
#               START               #
# --------------------------------- #

export __MS_ROOT="$PWD"

export __MS_SRC="${__MS_ROOT}/src"
export __MS_TMP="${__MS_ROOT}/tmp"
export __MS_STP="${__MS_ROOT}/steps"
export __MS_LIB="${__MS_ROOT}/utils"

# log name: ms-<type>.log
export __MSLOG_OUTPUT="${__MS_TMP}/ms-output.log"

# --------------------------------- #
#               END                 #
# --------------------------------- #

cd "$__ms_old_location" || exit 1
unset __ms_old_location
