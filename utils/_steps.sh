#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__MS__UTILS_STEPS="utils/steps"

__ms_stp_validate() {
  local module="$1" name="$2"
  [[ "${_MS_STEPS[*]}" =~ $module/$name ]]
}
export -f __ms_stp_validate

__ms__stp_new() {
  local module="$1" name="$2"

  if __ms_stp_validate "$module" "$name"; then
    __ms_debug "$__MS__UTILS_STEPS" "starting.. $module ($name)"

    export MODULE_NAME="${module}/${name}"

    __ms_load_file "${__MS_STP}" "${MODULE_NAME}" "constants.sh"

    __ms_load_file "${__MS_STP}" "${MODULE_NAME}" "utils.sh"

    __ms_requirement "${MODULE_REQUIREMENT[@]}"
    __ms_load_strict_file "${__MS_STP}" "${MODULE_NAME}" "controllers.sh"

    unset MODULE_NAME MODULE_KEY __MS__REQUIREMENT_FAILED
    if is_command "cleanup"; then
      __ms_debug "$__MS__UTILS_STEPS" "cleaning.. $module ($name)"
      cleanup

      unset cleanup
    fi
  else
    __ms_warn "$__MS__UTILS_STEPS" "skipping.. $module ($name)"
  fi
}

__ms_stp_new() {
  local module="$1"
  shift

  for name in "$@"; do
    if is_string "$name"; then
      __ms__stp_new "$module" "$name"
    fi
  done
}
export -f __ms_stp_new

__ms_stp_wait() {
  echo
  printf "Waiting user input [Y|n]"
  read -rn 1 ans
  echo
  echo

  if [[ $ans != "y" ]] && [[ $ans != "Y" ]]; then
    __ms_info "$__MS__UTILS_STEPS" "[STOP] I will not continue setup ($ans) thank you."
    exit 0
  fi
}
