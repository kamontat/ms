#!/usr/bin/env bash
# shellcheck disable=SC1000,SC1090

# generate by create-script-file v4.0.1
# link (https://github.com/Template-generator/create-script-file/tree/v4.0.1)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

source "${__MS_LIB}/_logger.sh" || exit 2
source "${__MS_LIB}/_source.sh" || exit 2

__ms_load_file "${__MS_ROOT}" ".env"

__ms_load_file "${__MS_LIB}" "_security.sh"
__ms_load_file "${__MS_LIB}" "_steps.sh"
__ms_load_file "${__MS_LIB}" "_settings.sh"
__ms_load_file "${__MS_LIB}" "_validate.sh"
__ms_load_file "${__MS_LIB}" "_controllers.sh"
__ms_load_file "${__MS_LIB}" "_assets.sh"
__ms_load_file "${__MS_LIB}" "_command.sh"
__ms_load_file "${__MS_LIB}" "_env.sh"
