alias python="python3"
alias docker="sudo docker"
alias gc="git commit -m"
alias cd="z"

function dps() {
    docker ps $1 --format '{"ID":"{{ .ID }}", "Image": "{{ .Image }}", "Names":"{{ .Names }}", "Ports":"{{ .Ports }}"}' | jq
}
