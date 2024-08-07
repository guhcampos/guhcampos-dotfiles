#!/bin/bash

function cdev {
    if [[ $(uname -s) == "Darwin" ]]; then
        cdev_mac $*
    else
        cdev_linux $*
    fi
}
function cdev_linux {
    while true; do
        bash -c "${*}"
        inotifywait -e close_write -r "$(pwd)"
    done
}

function cdev_mac {
    fswatch -ro0 . \
        -e 'bin$' \
        -e '__pycache__$' \
        -e '\.git$' \
        -e 'out$' \
        -e '.pytest_cache$' \
        -e 'tmp$' |
        while read -rd "" _event; do
            echo "# $(date) > ${*}"
            bash -c "${*}"
        done
}
