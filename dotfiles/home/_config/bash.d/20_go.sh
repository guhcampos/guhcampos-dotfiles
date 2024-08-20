#!/bin/bash

function get_go_root() {
    if type -P brew >/dev/null; then
        echo "$(brew --prefix golang)/libexec"
    fi
}

GOBIN="${HOME}/.local/bin"
GOPATH="${HOME}/.local/go"
GOROOT=$(get_go_root)

PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GOBIN
export GOPATH
export GOROOT
export PATH
