#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Mac mouse configuration
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <kamontat.c@hotmail.com>
#/ Since:        15/06/2019
#/ -----------------------------------

# ----------------- #
# 1. Standby
# ----------------- #

# standby causes kernel power management to automatically hibernate a machine after it has slept for a specified time period
# true  = turn standby feature on
# false = turn standby feature off
export _MS_PM_ENABLE_STANDBY=true

# Specify high and low for standby settings (percent of battery)
# 0   - lowest
# 100 - highest
export _MS_PM_STANDBY_THRESHOLD=50

# time before standby process (second) for higher than threshold
# 3600  - 1 hour
# 86400 - 24 hours
export _MS_PM_STANDBY_DELAY_HIGH=86400

# time before standby process (second) for higher than threshold
# 3600  - 1 hour
# 86400 - 24 hours
export _MS_PM_STANDBY_DELAY_LOW=10800
