#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# Option 1
cd "$(dirname "$0")" || exit 1

source "$PWD/constants.sh" || exit 2
source "${_MS_LIB_HELPER}/init-helper.sh" || exit 2
source "${_MS_LIB_HELPER}/helper.sh" || exit 2
source "${_MS_LIB_HELPER}/extra-helper.sh" || exit 2

eval "$(_ms_parse_yaml "$_MS_PACKAGE_FILE" "_MS_")"

_ms_load_option() {
  while getopts 'Hh?Vv-:' flag; do
    case "${flag}" in
    H) _ms_help && exit 0 ;;
    h) _ms_help && exit 0 ;;
    \\?) _ms_help && exit 0 ;;
    V) _ms_version && exit 0 ;;
    v) _ms_version && exit 0 ;;
    -)
      export LONG_OPTARG
      export LONG_OPTVAL
      NEXT="${!OPTIND}"
      _ms_set_key_value_long_option "$NEXT"
      case "${OPTARG}" in
      help)
        _ms_no_argument
        _ms_help
        exit 0
        ;;
      version)
        _ms_no_argument
        _ms_version
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

_ms_load_option "$@"
