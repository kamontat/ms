#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Brew configuration
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        15/06/2019
#/ -----------------------------------

# true  = use homebrew to setting and download program
# false = never use homebrew
export _MS_HOMEBREW_SETTING=false

# yes =always download/update homebrew,
# no  =never download homebrew,
# auto=download only if not exist (never update)
export _MS_GET_HOMEBREW="auto"
