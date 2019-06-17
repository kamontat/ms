#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathumrong <work@kamontat.net>
#/ Since:        17/06/2019
#/ -----------------------------------
#// Version:      0.0   --

__ms__load_power_management_config() {
  __ms_load_config "mac/settings/power_management"
}

__ms__load_power_management_settings() {
  __ms_log "Mac power" "Starting..."

  if is_variable_exist "$_MS_PM_ENABLE_STANDBY"; then
    sudo pmset -a standby "$(__ms_choose_word "$_MS_PM_ENABLE_STANDBY" "1" "0")"
    __ms_log "Mac power" "$(__ms_highlight "$(__ms_choose_word "$_MS_PM_ENABLE_STANDBY" "Enable" "Disable")") standby features"

    if is_variable_exist "$_MS_PM_STANDBY_THRESHOLD"; then
      sudo pmset -a highstandbythreshold "$_MS_PM_STANDBY_THRESHOLD"
      __ms_log "Mac power" "threshold of high and low is $(__ms_highlight "${_MS_PM_STANDBY_THRESHOLD}")"
    else
      __ms_print_skip "Mac power" "standby threshold"
    fi

    if is_variable_exist "$_MS_PM_STANDBY_DELAY_HIGH"; then
      sudo pmset -a standbydelayhigh "$_MS_PM_STANDBY_DELAY_HIGH"
      __ms_log "Mac power" "standby delay time is $(__ms_highlight "${_MS_PM_STANDBY_DELAY_HIGH}") seconds (high)"
    else
      __ms_print_skip "Mac power" "standby delay (high)"
    fi

    if is_variable_exist "$_MS_PM_STANDBY_DELAY_LOW"; then
      sudo pmset -a standbydelaylow "$_MS_PM_STANDBY_DELAY_LOW"
      __ms_log "Mac power" "standby delay time is $(__ms_highlight "${_MS_PM_STANDBY_DELAY_LOW}") seconds (low)"
    else
      __ms_print_skip "Mac power" "standby delay (low)"
    fi
  else
    __ms_print_skip "Mac power" "standby settings"
  fi
}
