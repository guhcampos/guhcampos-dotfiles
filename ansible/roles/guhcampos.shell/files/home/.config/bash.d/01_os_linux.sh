#!/bin/bash

if [ "Linux" == "$(uname -s)" ]; then
  ############################################################################
  # BEGIN LINUX-SPECIFIC-CONFIGURATION
  ############################################################################

  alias ls="ls --color"
  alias du="du --max-depth=1 -h"
  alias df="df -h"

  export PATH=/snap/bin:/usr/local/bin:$PATH
  export GTK_IM_MODULE="cedilla"

  if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

  ############################################################################
  # END LINUX-SPECIFIC-CONFIGURATION
  ############################################################################
fi
