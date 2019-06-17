#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Index file for run this script
#/ How to:       ...
#/               ...
#/ Option:       --help | -h
#/                   > show this message
#/               --version | -v
#/                   > show command version
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        15/06/2019
#/ -----------------------------------
#/ Error code    9      -- file not file
#/ -----------------------------------
#/ -----------------------------------
#// Version:      1.0.0a1   -- start new project

# move to script directory

# Option 1
# cd "$(dirname "$0")" || exit 1

# Option 2
# cd "$(dirname "$(realpath "$0")")" || exit 1

# Option 3
# handle symlink
# real="$0"
# [ -h "$real" ] && real="$(readlink "$real")"
# cd "$(dirname "$real")" || exit 1

help() {
  grep "^#/ " "index.sh" | sed 's/#\/ //g'
}

# [[ "$1" == "--help" ]] ||
#   [[ "$1" == "-h" ]] ||
#   [[ "$1" == "-?" ]] ||
#   [[ "$1" == "help" ]] ||
#   [[ "$1" == "h" ]] ||
#   [[ "$1" == "?" ]] &&
#   help && exit 0

version() {
  grep "^#// " "index.sh" | sed 's/#\/\/ //g'
}

# [[ "$1" == "--version" ]] ||
#   [[ "$1" == "-v" ]] ||
#   [[ "$1" == "version" ]] ||
#   [[ "$1" == "v" ]] &&
#   version && exit 0

# @option
require_argument() {
  throw_if_empty "$LONG_OPTVAL" "'$LONG_OPTARG' require argument" 9
}

# @option
no_argument() {
  [[ -n $LONG_OPTVAL ]] && ! [[ $LONG_OPTVAL =~ "-" ]] && throw "$LONG_OPTARG don't have argument" 9
  OPTIND=$((OPTIND - 1))
}

# @syscall
set_key_value_long_option() {
  if [[ $OPTARG =~ "=" ]]; then
    LONG_OPTVAL="${OPTARG#*=}"
    LONG_OPTARG="${OPTARG%%=$LONG_OPTVAL}"
  else
    LONG_OPTARG="$OPTARG"
    LONG_OPTVAL="$1"
    OPTIND=$((OPTIND + 1))
  fi
}

load_option() {
  while getopts 'Hh?Vv-:' flag; do
    case "${flag}" in
    h) help && exit 0 ;;
    v) version && exit 0 ;;
    -)
      export LONG_OPTARG
      export LONG_OPTVAL
      NEXT="${!OPTIND}"
      set_key_value_long_option "$NEXT"
      case "${OPTARG}" in
      help)
        no_argument
        help
        exit 0
        ;;
      version)
        no_argument
        version
        exit 0
        ;;
      *)
        # because optspec is assigned by 'getopts' command
        # shellcheck disable=SC2154
        if [ "$OPTERR" == 1 ] && [ "${optspec:0:1}" != ":" ]; then
          echo "Unexpected option '$LONG_OPTARG', run --help for more information" >&2
          exit 9
        fi
        ;;
      esac
      ;;
    ?)
      echo "Unexpected option, run --help for more information" >&2
      exit 10
      ;;
    *)
      echo "Unexpected option $flag, run --help for more information" >&2
      exit 10
      ;;
    esac
  done
}

# ###################### #
# Variable section       #
# ###################### #

export PRODUCTION=false

# ###################### #
# Loader section         #
# ###################### #

load_option "$@"

# @explain    - source application location
[ -f "$(dirname "$0")/__location.sh" ] && source "$(dirname "$0")/__location.sh" || exit 9
[ -f "${__MS_LIB}/helper.sh" ] && source "${__MS_LIB}/helper.sh" || exit 9
[ -f "${__MS_LIB}/mshelper.sh" ] && source "${__MS_LIB}/mshelper.sh" || exit 9

[ -f "${__MS_CONSTANT}/index.sh" ] && source "${__MS_CONSTANT}/index.sh" || throw "constants index not found" 9
[ -f "${__MS_CONSTANT}/certificate.sh" ] && source "${__MS_CONSTANT}/certificate.sh" || throw "certificate not found" 9

[ -f "${__MS_CONSTANT}/mac.sh" ] && source "${__MS_CONSTANT}/mac.sh" || throw "mac constants not found" 9
[ -f "${__MS_CONSTANT}/brew.sh" ] && source "${__MS_CONSTANT}/brew.sh" || throw "homebrew constants not found" 9

# ###################### #
# Execution section      #
# ###################### #

sudo -K                               # remove previous sudo timestamp
echo "$_MS_CER_PASSWORD" | sudo -v -S # create a new one for 15 minutes

[ -f "${__MS_LIB}/logger.sh" ] && source "${__MS_LIB}/logger.sh" || throw "logger not found" 9

__ms_log "Setup" "Starting... (Mac)"
[ -f "${__MS_SRC_MAC}/index.sh" ] && source "${__MS_SRC_MAC}/index.sh" || throw "mac setup not found" 9
