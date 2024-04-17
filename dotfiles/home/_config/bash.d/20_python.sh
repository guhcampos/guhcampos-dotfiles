#!/bin/bash

if which pyenv >/dev/null; then
    eval "$(pyenv init -)"
else
    echo "$(date) ERROR: 'pyenv' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
fi
