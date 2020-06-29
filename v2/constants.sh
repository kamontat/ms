#!/usr/bin/env bash
# shellcheck disable=SC1000

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

export _MS_CONS_FILE="$PWD/constants.sh"
export _MS_PACKAGE_FILE="$PWD/package.yaml"

export _MS_SRC="$PWD/src"


export _MS_LIB="$PWD/libs"
export _MS_LIB_HELPER="${_MS_LIB}/helper"


export _MS_TMP="$PWD/tmp/ms"
export _MS_TMP_LOG="${_MS_TMP}/logs"