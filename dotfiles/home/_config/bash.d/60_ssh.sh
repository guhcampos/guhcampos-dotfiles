#!/bin/bash

# ensure ssh-agent is running if we can't find an instance in the background
[[ $(pgrep ssh-agent) ]] || eval "$(ssh-agent)"
