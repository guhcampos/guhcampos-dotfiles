#!/bin/bash

GUHCAMPOS_ERROR_LOG="$HOME/guhcampos-errors.log"

# some of my setup depends on the existence of pyenv, this ensures it's properly
# detected if it's available in the system, we will setup it later in the script
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if [ -e "$HOME/.config/bash.d" ]; then
    for lib in "$HOME"/.config/bash.d/*.sh; do
        # shellcheck disable=SC1090
        source "$lib"
    done
fi

# for direnv, pyenv and starship we first check if they are available before
# enabling them, so we don't break the shell on new systems.
if which starship >/dev/null; then
    eval "$(starship init bash)"
else
    echo "$(date) ERROR: 'starship' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
fi

if which direnv >/dev/null; then
    eval "$(direnv hook bash)"
else
    echo "$(date) ERROR: 'direnv' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
fi

if which pyenv >/dev/null; then
    eval "$(pyenv init -)"
else
    echo "$(date) ERROR: 'pyenv' not found on \$PATH" >>"${GUHCAMPOS_ERROR_LOG}"
fi
