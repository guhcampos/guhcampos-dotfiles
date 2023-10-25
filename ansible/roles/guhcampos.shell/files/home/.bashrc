#!/bin/bash

if [ -f /etc/bashrc ]; then
    unset PATH
    export PATH=$HOME/.local/bin:/usr/bin:/sbin:/usr/sbin
    source /etc/profile /etc/bashrc
fi

if [ -e "$HOME/.config/bash.d" ]; then
    for lib in "$HOME"/.config/bash.d/*.sh; do
        # shellcheck disable=SC1090
        source "$lib"
    done
fi

if which starship >/dev/null; then
    eval "$(starship init bash)"
fi

if which direnv >/dev/null; then
    eval "$(direnv hook bash)"
fi

if which pyenv >/dev/null; then
    eval "$(pyenv init -)"
fi
