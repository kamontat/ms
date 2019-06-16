#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

#/ -----------------------------------
#/ Description:  Mac trackpad configuration
#/ -----------------------------------
#/ Create by:    Kamontat Chantrachirathunrong <work@kamontat.net>
#/ Since:        15/06/2019
#/ -----------------------------------

# Enable tap to click for this user and for the login screen
# true  = enable tap to click
# false = disable tap to click on trackpad
export _MS_TP_TAP_TO_CLICK=true

# natural scroll https://jessequinnlee.com/2015/07/25/natural-scrolling-vs-reverse-scrolling/
# true  = Natural scroll
# false = Reverse scroll
export _MS_TP_NATURAL_SCROLL=true

# Momentum scroll; After your finger has stopped moving, the page continues to scroll in the intended direction until it slowly stops
# true  = enable momentum scroll
# false = disable momentum scroll
export _MS_TP_MOMENTUM_SCROLL=true

# lookup gesture
# force  = use force click as lookup
# three  = use tap three fingers to lookup
# none   = never perform lookup
export _MS_TP_LOOKUP="force"

# Making drag window AND select text with three fingers gesture.
# true  = enable drag by three finger
# false = disable drag by three finger
export _MS_TP_DRAG_WITH_THREE_FINGERS=true

# app expose (see all windows of the app you're using) gesture.
# true  = enable expose gesture
# false = disable expose gesture
export _MS_TP_ENABLE_APP_EXPOSE=true

# the gesture to setup for expose gesture
# three = use by swipe down with three fingers (WARN: cannot use with DRAG_WITH_THREE_FINGERS)
# four  = use by swipe down with four fingers
export _MS_TP_EXPOSE_GESTURE="four"
