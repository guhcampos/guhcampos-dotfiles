#!/bin/bash

function cdev {
    # this is my poor-man-version of a live-reload to leave running on a directory
    # while I change its contents, so I can see the results in realtime
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

function clean_envrc_backups {
    # some of my own ansible scripts leave a bunch of backups of `.envrc` files
    # when they update these from dynamic contents - this should cleanup most
    # of these backup files
    find ~/workspace -type f -maxdepth 3 -name '.envrc.*' -delete
}
