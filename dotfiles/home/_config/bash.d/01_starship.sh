#!/bin/bash

if type -P starship >/dev/null; then
    eval "$(starship init bash)"
else
    echo "$(date) ERROR: 'starship' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
fi
export GUH_LOADED_STARSHIP=1
