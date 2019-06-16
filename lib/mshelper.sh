#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Helper method only !!
#/               __ms_load_configs
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        16/06/2019
#/ -----------------------------------
#// Version:      1.0.0   -- release helper version

# @explain    - check and source file in constants folder
# @params - 1 - path from constants folder (without extension)
__ms_load_config() {
  [ -f "${__MS_CONSTANT}/$1.sh" ] && source "${__MS_CONSTANT}/$1.sh" || return 1
}

# @explain    - check and source file in src folder
# @params - 1 - path from src folder (without extension)
__ms_load_setting() {
  [ -f "${__MS_SRC}/$1.sh" ] && source "${__MS_SRC}/$1.sh" || return 1
}

# @params - 1 - command name
#           2 - skip behavior name
__ms_print_skip() {
  __ms_warn "$1" "skip ${2}"
}

__ms_choose_word() {
  if [[ "$1" == "true" ]]; then
    echo "$2"
  else
    echo "$3"
  fi
}

__ms_highlight() {
  printf "${__MS_COLOR_HIGHLIGHT}$@${__MS_COLOR_RESET}"
}

export -f __ms_load_config
export -f __ms_load_setting

export -f __ms_print_skip

export -f __ms_highlight
