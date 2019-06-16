#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  ...
#/ How to:       ...
#/               ...
#/ Option:       --help | -h | -? | help | h | ?
#/                   > show this message
#/               --version | -v | version | v
#/                   > show command version
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathumrong <work@kamontat.net>
#/ Since:        16/06/2019
#/ -----------------------------------
#/ Error code    1      -- error
#/ -----------------------------------
#/ Known bug:    ...
#/ -----------------------------------
#// Version:      0.0.1   -- Add keyboard setting

__ms__load_setting() {
  local type="$1"
  __ms_load_setting "mac/${type}" || return 1

  "__ms__load_${type}_config" || return 1
  "__ms__load_${type}_settings" || return 1
}

__ms__load_mac_settings() {
  __ms__load_setting "keyboard" || throw "cannot load keyboard config"
  __ms__load_setting "mouse" || throw "cannot load mouse config"
  __ms__load_setting "trackpad" || throw "cannot load trackpad config"
}

if [[ "$_MS_ENABLE_MAC_SETTING" == true ]]; then
  __ms_log "Hello" "This is mac setup files"
  __ms__load_mac_settings "$@"
else
  __ms_warn "Mac settings" "skip this settings; due to configuration"
fi
