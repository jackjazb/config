alias docker="sudo docker"
alias gc="git commit -m"
alias cd="z"
alias vim="nvim"
alias pacman="sudo pacman"
alias vpn="sudo openvpn --config /etc/openvpn/ie-dub.prod.surfshark.com_udp.ovpn --auth-user-pass ~/.surfshark"

# Pretty printed docker ps replacement.
function dps() {
    docker ps $1 --format '{"ID":"{{ .ID }}", "Image": "{{ .Image }}", "Names":"{{ .Names }}", "Ports":"{{ .Ports }}"}' | jq
}

# Runs git status in every repo in ~/git.
function ggs() {
    for f in ~/git/*; do
        echo '->' $f
        cd $f
        git status -s
    done
}

function geoloc() {
  ip=$(curl -s https://icanhazip.com)
  curl -s http://ip-api.com/json/$ip | jq
}
