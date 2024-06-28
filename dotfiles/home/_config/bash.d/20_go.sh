#!/bin/bash

GOBIN="${HOME}/.local/bin"
GOPATH="${HOME}/.local/go"
GOROOT="$(brew --prefix golang)/libexec"

PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GOBIN
export GOPATH
export GOROOT
export PATH
