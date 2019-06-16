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
#// Version:      1.0   -- add scrolling settings, and many more gestures
#//               0.1   -- add tap to click on both bluetooth and device

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

  if is_variable_exist "$_MS_TP_NATURAL_SCROLL"; then
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool "${_MS_TP_NATURAL_SCROLL}"
    __ms_log "Mac trackpad" "$(__ms_highlight "$(__ms_choose_word "$_MS_TP_NATURAL_SCROLL" "Natural" "Reverse")") scroll"
  else
    __ms_print_skip "Mac trackpad" "scroll settings"
  fi

  if is_variable_exist "$_MS_TP_MOMENTUM_SCROLL"; then
    defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool "${_MS_TP_MOMENTUM_SCROLL}"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool "${_MS_TP_MOMENTUM_SCROLL}"
    __ms_log "Mac trackpad" "$(__ms_highlight "$(__ms_choose_word "$_MS_TP_MOMENTUM_SCROLL" "Enable" "Disable")") momentum scroll"
  else
    __ms_print_skip "Mac trackpad" "momentum scroll"
  fi

  if is_variable_exist "$_MS_TP_LOOKUP"; then
    if [[ "$_MS_TP_LOOKUP" == "force" ]]; then
      defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
      defaults write -g com.apple.trackpad.forceClick -int 1
      __ms_log "Mac trackpad" "use force click to lookup"
    elif [[ "$_MS_TP_LOOKUP" == "three" ]]; then
      defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
      defaults write -g com.apple.trackpad.forceClick -int 0
      __ms_log "Mac trackpad" "use tap by three fingers to lookup"
    else
      defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
      defaults write -g com.apple.trackpad.forceClick -int 0
      __ms_log "Mac trackpad" "never lookup"
    fi
  else
    __ms_print_skip "Mac trackpad" "lookup settings"
  fi

  if is_variable_exist "$_MS_TP_MOMENTUM_SCROLL"; then
    defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool "${_MS_TP_MOMENTUM_SCROLL}"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool "${_MS_TP_MOMENTUM_SCROLL}"
    __ms_log "Mac trackpad" "$(__ms_highlight "$(__ms_choose_word "$_MS_TP_MOMENTUM_SCROLL" "Enable" "Disable")") momentum scroll"
  else
    __ms_print_skip "Mac trackpad" "momentum scroll"
  fi

  if is_variable_exist "$_MS_TP_DRAG_WITH_THREE_FINGERS"; then
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool "${_MS_TP_DRAG_WITH_THREE_FINGERS}"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool "${_MS_TP_DRAG_WITH_THREE_FINGERS}"
    __ms_log "Mac trackpad" "$(__ms_highlight "$(__ms_choose_word "$_MS_TP_DRAG_WITH_THREE_FINGERS" "Enable" "Disable")") drag by three finger"
  else
    __ms_print_skip "Mac trackpad" "drag behavior"
  fi

  if is_variable_exist "$_MS_TP_ENABLE_APP_EXPOSE"; then
    defaults write com.apple.dock showAppExposeGestureEnabled -bool "$_MS_TP_ENABLE_APP_EXPOSE"
    __ms_log "Mac trackpad" "$(__ms_highlight "$(__ms_choose_word "$_MS_TP_DRAG_WITH_THREE_FINGERS" "Enable" "Disable")") app expose"

    if is_variable_exist "$_MS_TP_EXPOSE_GESTURE"; then
      if [[ "$_MS_TP_EXPOSE_GESTURE" == "three" ]] && [[ "$_MS_TP_DRAG_WITH_THREE_FINGERS" != true ]]; then
        defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
        defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
      else
        defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
        defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
      fi
    else
      __ms_print_skip "Mac trackpad" "app expose gesture"
    fi
  else
    __ms_print_skip "Mac trackpad" "app expose"
  fi
}
