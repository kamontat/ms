#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

# --------------------------- #
# Variables:
#   - MODULE_NAME - <module>/<name> (e.g. template/default)

export MODULE_KEY="pw"
export MODULE_REQUIREMENT=("mac")

## standby causes kernel power management to automatically hibernate a machine after it has slept for a specified time period
## true  = turn standby feature on
## false = turn standby feature off
# export __MS_SETTINGS__PW_STANDBY_ENABLED=true

## Specify percent of battery for standby settings
## 0   - lowest
## 100 - highest
# export __MS_SETTINGS__PW_STANDBY_THRESHOLD=30

## time before standby process (second) when higher than threshold
## 3600  - 1 hour
## 86400 - 24 hours
# export __MS_SETTINGS__PW_STANDBY_DELAY_HIGH=86400

## time before standby process (second) when lower than threshold
## 3600  - 1 hour
## 86400 - 24 hours
# export __MS_SETTINGS__PW_STANDBY_DELAY_LOW=10800
