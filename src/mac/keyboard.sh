#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathumrong <work@kamontat.net>
#/ Since:        16/06/2019
#/ -----------------------------------
#// Version:      1.1   -- add repeat rate and delay time
#//               1.0   -- add press and hold behavior to keyboard settings

__ms__load_keyboard_config() {
  __ms_load_config "mac/settings/keyboard"
}

__ms__load_keyboard_settings() {
  __ms_log "Mac keyboard" "Starting..."

  if is_variable_exist "$_MS_KB_PRESS_HOLD"; then
    defaults write -g ApplePressAndHoldEnabled -bool "${_MS_KB_PRESS_HOLD}"
    __ms_log "Mac keyboard" "Change press and hold to $(__ms_highlight "${_MS_KB_PRESS_HOLD}")"
  else
    __ms_print_skip "Mac keyboard" "press and hold behavior"
  fi

  if is_variable_exist "$_MS_KB_REPEAT_RATE"; then
    defaults write NSGlobalDomain KeyRepeat -int "${_MS_KB_REPEAT_RATE}"
    __ms_log "Mac keyboard" "repeat key rate is $(__ms_highlight "${_MS_KB_REPEAT_RATE}")"
  else
    __ms_print_skip "Mac keyboard" "repeat rate"
  fi

  if is_variable_exist "$_MS_KB_DELAY_REPEAT"; then
    defaults write NSGlobalDomain InitialKeyRepeat -int"${_MS_KB_DELAY_REPEAT}"
    __ms_log "Mac keyboard" "set delay to $(__ms_highlight "${_MS_KB_DELAY_REPEAT}") before repeat key"
  else
    __ms_print_skip "Mac keyboard" "delay before repeat key"
  fi
}
