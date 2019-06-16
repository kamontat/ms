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
#// Version:      0.1   -- add tap to click on both bluetooth and device

__ms__load_trackpad_config() {
  __ms_load_config "mac/settings/trackpad"
}

__ms__load_trackpad_settings() {
  __ms_log "Mac trackpad" "Starting..."

  if is_variable_exist "$_MS_TP_TAP_TO_CLICK"; then
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "${_MS_TP_TAP_TO_CLICK}"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool "${_MS_TP_TAP_TO_CLICK}"
    # defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 # [deprecate]
    # defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 # [deprecate]
    __ms_log "Mac trackpad" "$(__ms_highlight "$(__ms_choose_word "$_MS_TP_TAP_TO_CLICK" "Enable" "Disable")") tap to click"
  else
    __ms_print_skip "Mac trackpad" "tap to click on trackpad"
  fi
}
