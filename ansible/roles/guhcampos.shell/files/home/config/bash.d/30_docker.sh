dls() {
    docker ps --filter "status=running" --format="{{.ID}} {{.Image}} {{.Ports}}"
}

dclean() {
    docker rm $(docker ps -qa) > /dev/null
    docker rmi $(docker images -qa) > /dev/null
}

alias dc='docker-compose' 
