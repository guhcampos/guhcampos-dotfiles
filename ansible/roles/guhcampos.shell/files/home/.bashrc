#!/bin/bash

<<<<<<< Updated upstream:ansible/roles/guhcampos.shell/files/home/.bashrc
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f /etc/bashrc ]; then
    unset PATH
    export PATH=$HOME/.local/bin:/usr/bin:/sbin:/usr/sbin
    source /etc/profile /etc/bashrc
fi
=======
GUHCAMPOS_ERROR_LOG="$HOME/guhcampos-errors.log"

# some of my setup depends on the existence of pyenv, this ensures it's properly
# detected if it's available in the system, we will setup it later in the script
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
>>>>>>> Stashed changes:ansible/roles/guhcampos.shell/files/home/bashrc

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
