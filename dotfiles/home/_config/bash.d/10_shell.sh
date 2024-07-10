#!/bin/bash

export GUHCAMPOS_ERROR_LOG="${HOME}/guhcampos-error.log"
export SHELLCHECK_OPTS="-e SC2002"

SHARED_PATH=${HOME}/.local/bin:/usr/sbin:/sbin:$PATH

function setup_linux() {
  ##############################################################################
  # LINUX OS SPECIFIC
  ##############################################################################
  alias ls="ls --color"
  alias du="du --max-depth=1 -h"
  alias df="df -h"

  PATH="/snap/bin:${SHARED_PATH}"
  GTK_IM_MODULE="cedilla"

  if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

}

function setup_macos() {
  ##############################################################################
  # MAC OS SPECIFIC
  ##############################################################################
  BASH_SILENCE_DEPRECATION_WARNING=1
  PATH="/opt/homebrew/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${SHARED_PATH}"

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

export BASH_SILENCE_DEPRECATION_WARNING
export PATH
export GTK_IM_MODULE
