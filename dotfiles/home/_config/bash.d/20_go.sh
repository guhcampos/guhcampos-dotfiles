#!/bin/bash

GOPATH="${HOME}/.local/go"
GOROOT="$(brew --prefix golang)/libexec"

PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GOPATH
export GOROOT
export PATH
