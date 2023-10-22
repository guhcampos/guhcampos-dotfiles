#!/bin/bash -x

BASE16_SHELL="$HOME/.config/base16-shell/"

_loadtheme() {

    if [[ ! -f "$BASE16_SHELL/profile_helper.sh" ]]; then return; fi
    if [[ -z "$PS1" ]]; then return; fi

    eval "$("$BASE16_SHELL/profile_helper.sh")"

    if [[ ! -z "$GUHCAMPOS_ADAPTIVE_SHELL_THEME" ]]
    then
        if [[ 10#$(date +%H) -gt 7 ]] && [[ 10#$(date +%H) -lt 17 ]]
            then eval base16_solarized-light
            else eval base16_default-dark
        fi
    else eval base16_default-dark
    fi
}

_loadtheme
