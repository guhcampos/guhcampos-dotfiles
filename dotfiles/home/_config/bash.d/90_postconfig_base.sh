# Environment
export TERM="xterm-256color"
# Aliases
alias ap="ansible-playbook"
alias vnc="vncserver -geometry 1280x720 :42"
alias vnck="vncserver -kill :42"

# Look'n Feel
export PS1="\u@\h \W $ "
test -n "$SSH_CLIENT" && export PS1="> $PS1"
