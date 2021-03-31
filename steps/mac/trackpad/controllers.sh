#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# --------------------------- #
# Variables:
#   - MODULE_NAME - <module>/<name> (e.g. template/default, mac/brew)
#   - MODULE_KEY  - <key> (e.g. def, brew)
# Functions:
#   - __ms_controller <callback> [<setting_path>, <validator>, <default>]...
#   - __ms_assets <filename.ext> - return fullpath of asset

tap_to_click() {
  if is_boolean "$1"; then
    cmd defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "$1"
    cmd defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool "$1"
    # defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 # [deprecate]
    # defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 # [deprecate]
  fi
}
__ms_controller tap_to_click \
  "tap/to/click" is_boolean ""

natural_scroll() {
  if is_boolean "$1"; then
    cmd defaults write NSGlobalDomain com.apple.swipescrolldirection -bool "$1"
  fi
}
__ms_controller natural_scroll \
  "natural/scroll" is_boolean ""

momentum_scroll() {
  if is_boolean "$1"; then
    cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool "$1"
    cmd defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool "$1"
  fi
}
__ms_controller momentum_scroll \
  "momentum/scroll" is_boolean ""

lookup_setting() {
  if is_match "$1" "force"; then
    cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
    cmd defaults write -g com.apple.trackpad.forceClick -int 1
  elif is_match "$1" "three"; then
    cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
    cmd defaults write -g com.apple.trackpad.forceClick -int 0
  elif is_match "$1" "none"; then
    cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
    cmd defaults write -g com.apple.trackpad.forceClick -int 0
  fi
}
__ms_controller lookup_setting \
  "lookup" is_lookup_string ""

enabled_drag_with_three_fingers() {
  if is_boolean "$1"; then
    cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool "$1"
    cmd defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool "$1"
  fi
}
__ms_controller enabled_drag_with_three_fingers \
  "drag/with-three-fingers" is_boolean ""

app_expose() {
  local enabled="$1" three_fingers="$2" gesture="$3"
  if is_boolean "$enabled"; then
    cmd defaults write com.apple.dock showAppExposeGestureEnabled -bool "$enabled"

    if is_match "$gesture" "three" && is_true "$three_fingers"; then
      cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
      cmd defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
    elif is_match "$gesture" "four"; then
      cmd defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
      cmd defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
    fi
  fi
}
__ms_controller app_expose \
  "app-expose/enabled" is_boolean "" \
  "drag/with-three-fingers" is_boolean "" \
  "app-expose/gesture" is_gesture_string ""
