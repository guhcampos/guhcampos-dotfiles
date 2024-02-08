#!/bin/bash

function setup_direnv() {
    if type -P direnv >/dev/null; then
        eval "$(direnv hook bash)"
    else
        echo "$(date) ERROR: 'direnv' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
    fi
}

setup_direnv
