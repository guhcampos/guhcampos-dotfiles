#!/bin/bash

if [ "Darwin" == "$(uname -s)" ]; then
    ############################################################################
    # BEGIN MACOS-SPECIFIC-CONFIGURATION
    ############################################################################
    alias ls="ls -G"
    alias python=python3
    export PATH=$HOME/Library/Python/2.7/bin:$PATH
    export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH
    export BASH_SILENCE_DEPRECATION_WARNING=1

    if [[ -f /opt/homebrew/etc/bash_completion ]]; then
        source /opt/homebrew/etc/bash_completion
    fi
################################################################################
# END MACOS-SPECIFIC-CONFIGURATION
################################################################################
fi
