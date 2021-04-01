#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

__ms_encrypt_file() {
  local __ms_old_location="$PWD"

  local dirname="$1" # directory path of filename
  cd "$dirname" || return 1

  local fpath_raw="$2" # this is file name with extension
  local fpath_encrypted="${fpath_raw}.gpg"

  gpg \
    --sign \
    --encrypt \
    --recipient "$_MS_GPG_EMAIL" \
    --local-user "$_MS_GPG_EMAIL" \
    --output "$fpath_encrypted" "$fpath_raw"

  cd "$__ms_old_location" || return 1
}
export __ms_encrypt_file

__ms_encrypt_directory() {
  local __ms_old_location="$PWD"

  local dirbase="$1" # base directory of input folder
  cd "$dirbase" || return 1

  local fpath_raw="$2"                # dir/path/Desktop
  local fpath_tar="$fpath_raw.tar.gz" # dir/path/Desktop.tar.gz

  tar -czvf "$fpath_tar" "$fpath_raw" &&
    __ms_encrypt_file "." "$fpath_tar"

  if test -f "$fpath_tar"; then
    rm -f "$fpath_tar"
  fi

  cd "$__ms_old_location" || return 1
}
export __ms_encrypt_directory

__ms_decrypt_file() {
  local __ms_old_location="$PWD"

  local dirname="$1" # directory path of filename
  cd "$dirname" || return 1

  local fpath_raw="$2" # this is file name with extension
  local fpath_encrypted="${fpath_raw}.gpg"

  # skip if file is exist
  if test -f "$fpath_raw"; then
    return 0
  fi

  gpg --decrypt --output "$fpath_raw" "$fpath_encrypted"

  cd "$__ms_old_location" || return 1
}
export __ms_decrypt_file

__ms_decrypt_directory() {
  local __ms_old_location="$PWD"

  local dirbase="$1" # base directory of input folder
  cd "$dirbase" || return 1

  local fpath_raw="$2"                # dir/path/Desktop
  local fpath_tar="$fpath_raw.tar.gz" # dir/path/Desktop.tar.gz

  __ms_decrypt_file "." "$fpath_tar" &&
    tar -xzvf "$fpath_tar"

  if test -f "$fpath_tar"; then
    rm -f "$fpath_tar"
  fi

  cd "$__ms_old_location" || return 1
}
export __ms_decrypt_directory
