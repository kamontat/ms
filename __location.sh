#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__ms_timestamp() {
  mktemp -uq "$1-$(date "+%Y%m%d%H%M%S")-XXXXXXX"
}

__ms_old_location="$PWD"

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

export __MS_ROOT="$PWD"

export __MS_LIB="${__MS_ROOT}/lib"

export __MS_CONSTANT="${__MS_ROOT}/constants"
export __MS_CONSTANT_BREW="${__MS_ROOT}/constants/brew"
export __MS_CONSTANT_MAC="${__MS_ROOT}/constants/mac"

export __MS_SRC="${__MS_ROOT}/src"
export __MS_SRC_MAC="${__MS_SRC}/mac"

export __MSTMP_ROOT="${__MS_ROOT}/tmp/ms"
mkdir -p "$__MSTMP_ROOT" 2>/dev/null

export __MSTMP_FILE_A="${__MSTMP_ROOT}/$(__ms_timestamp "mstmp").txt"
export __MSTMP_FILE_B="${__MSTMP_ROOT}/$(__ms_timestamp "mstmp").txt"
export __MSTMP_FILE_C="${__MSTMP_ROOT}/$(__ms_timestamp "mstmp").txt"

export __MSTMP_LOG_O="${__MSTMP_ROOT}/$(__ms_timestamp "mslog").log"   # output
export __MSTMP_LOG_E="${__MSTMP_ROOT}/$(__ms_timestamp "mslog").error" # error
export __MSTMP_LOG_W="${__MSTMP_ROOT}/$(__ms_timestamp "mslog").warn"  # warning

# echo "$__MSTMP_FILE_A"
# echo "$__MSTMP_FILE_B"
# echo "$__MSTMP_FILE_C"

# echo "$__MSTMP_LOG_O"
# echo "$__MSTMP_LOG_E"
# echo "$__MSTMP_LOG_W"

cd "$__ms_old_location" || exit 1
