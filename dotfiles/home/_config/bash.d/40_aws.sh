#!/bin/bash

which aws_completer >>/dev/null && complete -C "$(which aws_completer)" aws

alias assume="source /opt/homebrew/bin/assume"
