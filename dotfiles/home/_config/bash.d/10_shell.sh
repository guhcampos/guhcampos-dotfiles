#!/bin/bash

export GUHCAMPOS_ERROR_LOG="${HOME}/guhcampos-error.log"

SHARED_PATH=${HOME}/.local/bin:/usr/sbin:/sbin:$PATH

function setup_linux() {
  ##############################################################################
  # LINUX OS SPECIFIC
  ##############################################################################
  alias ls="ls --color"
  alias du="du --max-depth=1 -h"
  alias df="df -h"

  export PATH="/snap/bin:${SHARED_PATH}"
  export GTK_IM_MODULE="cedilla"

  if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

}

function setup_macos() {
  ##############################################################################
  # MAC OS SPECIFIC
  ##############################################################################
  export BASH_SILENCE_DEPRECATION_WARNING=1
  export PATH="/opt/homebrew/bin:${SHARED_PATH}"

  alias ls="ls -G"
  alias python=python3

  # detect and export brew environment variables
  # type -P brew >/dev/null && eval "$(/opt/homebrew/bin/brew shellenv)"
}

if [ "Darwin" == "$(uname -s)" ]; then
  setup_macos
elif [ "Linux" == "$(uname -s)" ]; then
  setup_linux
fi
