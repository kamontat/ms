#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# Load locations definition
source "$(dirname "$0")/_locations.sh" || exit 1
# Load constants definition
source "$(dirname "$0")/_constants.sh" || exit 1

# Load libraries / utilities
source "${__MS_LIB}/index.sh"

__ms_setup_env "$@"
__ms_setup_log
__ms_setup_sudoer

# should not have any log before this starting
__ms_info "index" "initial... ($(date "+%Y-%m-%d %H:%M:%S"))"

__ms_stp_new "mac" "brew"

__ms_stp_new "mac" \
  "power" \
  "keyboard" \
  "mouse" \
  "trackpad"

__ms_stp_new "app" \
  "intellij" \
  "git" \
  "ssh"

__ms_info "index" "done...    ($(date "+%Y-%m-%d %H:%M:%S"))"

# print instruction created on steps
__ms_controller_instruction_string
