#!/usr/bin/env bash
# shellcheck disable=SC1000

if [[ "$MY_DEBUG" == "true" ]]; then
  set -x #DEBUG - Display commands and their arguments as they are executed.
  # set -v #VERBOSE - Display shell input lines as they are read.
  # set -n #EVALUATE - Check syntax of the script but don't execute.
fi

export _MS_LOGTYPE="${MS_LOGTYPE:-auto}"
export _MS_LOGDIR="${MS_LOGDIR:-/${_MS_LOG_PATH}}"
export _MS_LOGFILE="${MS_LOGFILE:-main.log}"

if [[ "$_MS_LOGTYPE" == "auto" ]]; then
  _MS_LOGFILE="main-$(date +"%y%m%d").log"
fi

export MS_LOGPATH="${_MS_LOGDIR}/${_MS_LOGFILE}"

_ms_log() {
  if [[ "$_MS_LOGDIR" != "" ]] && [[ $_MS_LOGFILE != "" ]]; then
    if ! test -d "$_MS_LOGDIR"; then
      mkdir -p "$_MS_LOGDIR" >/dev/null
    fi

    local filepath="${MS_LOGPATH}"
    if ! test -f "$filepath"; then
      touch "$filepath"
    fi

    local type datetime filename

    datetime="$(date)"
    if [[ "$_MS_LOGTYPE" == "auto" ]]; then
      datetime="$(date +"%H:%M:%S")"
    fi
    filename="${_MS_CURRENT_FILENAME:-unknown}"

    type="$1"
    shift

    echo "$datetime [$type] [$filename]: $*" >>"$filepath"
  fi

  return 0
}

_ms_dump_return() {
  return "$1"
}

_ms_shell_is() {
  if [[ "$SHELL" =~ $1 ]]; then
    return 0
  else
    return 1
  fi
}

export _ms_info
_ms_info() {
  __myzs__log "INFO" "$@"
}

export _ms_warn
_ms_warn() {
  __myzs__log "WARN" "$@"
}

export _ms_error
_ms_error() {
  __myzs__log "ERROR" "$@"
}

export _ms_initial
_ms_initial() {
  if [[ "$MS_DEBUG" == "true" ]]; then
    set -x # enable DEBUG MODE
  fi

  local filename
  filename="$(basename "$1")"
  if [[ "$2" == "force" ]]; then
    export _MS_CURRENT_FILENAME="$filename"
  else
    export _MS_CURRENT_FILENAME="${_MS_CURRENT_FILENAME:-$filename}"
  fi

  _ms_info "start new modules"
}

export _ms_cleanup
_ms_cleanup() {
  _ms_info "cleanup application"
  unset _MS_CURRENT_FILENAME _MS_CURRENT_FILEPATH _MS_CURRENT_STATUS

  # for e in $(env | grep MYZS); do
  #   echo "e: $e"
  # done
}

export _ms_parse_yaml
_ms_parse_yaml() {
  local prefix=$2
  local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @ | tr @ '\034')
  sed -ne "s|^\($s\):|\1|" \
    -e "s|^\($s\)\($w\)$s:${s}[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
    -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
    awk -F"$fs" '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'"$prefix"'",vn, $2, $3);
      }
   }'
}
