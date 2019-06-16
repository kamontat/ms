#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Mac keyboard configuration
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        15/06/2019
#/ -----------------------------------

# You have to choose between 2 behavior, when user press and hold the keys (more information https://www.howtogeek.com/267463/how-to-enable-key-repeating-in-macos)
# true  = Repeat key
# false = Special character
export _MS_KB_PRESS_HOLD=true
