# Aliases
alias ap="ansible-playbook"
alias vnc="vncserver -geometry 1280x720 :42"
alias vnck="vncserver -kill :42"
alias docker_clean='docker rm $(docker ps -qa); docker rmi $(docker images -q) > /dev/null'
alias gdl='./gradlew'
