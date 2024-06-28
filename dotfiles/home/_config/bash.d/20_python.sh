#!/bin/bash

if which pyenv >/dev/null; then
    eval "$(pyenv init -)"
else
    echo "$(date) ERROR: 'pyenv' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
fi

export POETRY_VIRTUALENVS_IN_PROJECT=true
export POETRY_VIRTUALENVS_PREFER_ACTIVE_PYTHON=true

pyenv global system
