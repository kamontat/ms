#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__MS__REQUIREMENT_FAILED=()
__MS__UTILS_CONTROLLER="utils/controller"

__MS__INSTRUCTIONS=()

# network, zsh, bash, mac, window, linux
__ms_requirement() {
  local is_failed=false
  for i in "$@"; do
    if [[ "$i" == "network" ]]; then
      if ! has_internet; then
        is_failed=true
      fi
    elif [[ "$i" == "bash" ]]; then
      if ! [[ "$SHELL" =~ "bash" ]]; then
        is_failed=true
      fi
    elif [[ "$i" == "zsh" ]]; then
      if ! [[ "$SHELL" =~ "zsh" ]]; then
        is_failed=true
      fi
    elif [[ "$i" == "mac" ]]; then
      if ! is_mac; then
        is_failed=true
      fi
    elif [[ "$i" == "linux" ]]; then
      if ! is_linux; then
        is_failed=true
      fi
    elif [[ "$i" =~ command: ]]; then
      cmd_name="${i##*:}"
      if ! is_command "$cmd_name"; then
        is_failed=true
      fi
    fi

    if is_true $is_failed; then
      __ms_warn "$MODULE_NAME" "requirement failed ($i)"
      break
    fi
  done

  if is_true $is_failed; then
    export __MS__REQUIREMENT_FAILED+=("$MODULE_NAME")
  fi
}

__ms_controller_instruction() {
  local title="$1" steps=""
  shift
  local args=("$@")

  for ((i = 0; i < $#; i++)); do
    steps="$steps
  $((i + 1))) ${args[$i]}"
  done

  __MS__INSTRUCTIONS+=("# $title
${steps}
")
}

__ms_controller_instruction_string() {
  if [[ "${#__MS__INSTRUCTIONS[@]}" -gt 0 ]]; then
    echo
  fi

  for instruction in "${__MS__INSTRUCTIONS[@]}"; do
    echo "$instruction"
  done
}

__ms_controller() {
  local setting_path validator default_setting data exitcode
  local callback="$1" args=()
  shift
  local raw_data=("$@")

  __ms_info "$MODULE_NAME" "starting... '${callback}'"

  if is_valid "$MODULE_NAME" "${__MS__REQUIREMENT_FAILED[@]}"; then
    __ms_warn "$__MS__UTILS_CONTROLLER" "requirement failed"
    return 1
  fi

  if [[ $(($# % 3)) != 0 ]]; then
    __ms_warn "$__MS__UTILS_CONTROLLER" "invalid input, data must mod 3 == 0"
    return 1
  fi

  for ((i = 0; i < $#; i += 3)); do
    setting_path="${raw_data[$i]}"
    validator="${raw_data[$((i + 1))]}"
    default_setting="${raw_data[$((i + 2))]}"

    data="$default_setting"
    __ms_get_settings "data" "$setting_path"

    if "$validator" "$data"; then
      __ms_debug "$__MS__UTILS_CONTROLLER" "add '$data' to callback arguments"
      args+=("$data")
    else
      __ms_debug "$__MS__UTILS_CONTROLLER" "add '$default_setting' (fallback) to callback arguments"
      args+=("$default_setting")
    fi
  done

  "$callback" "${args[@]}"
  exitcode="$?"
  if is_errcode "$exitcode"; then
    __ms_error "$MODULE_NAME" "failured '${callback}'"
    return "$exitcode"
  else
    __ms_debug "$MODULE_NAME" "finished '${callback}'"
    return 0
  fi
}
export -f __ms_controller
