#
# Setup script - to be run on the target server.
#

# Docker setup (Debian)
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Additional setup
sudo apt -y install vim curl caddy jq
mkdir -p {{.dir}}/jellyfin/media/music

wget -O fastfetch.deb https://github.com/fastfetch-cli/fastfetch/releases/download/2.43.0/fastfetch-linux-amd64.deb
sudo apt -y install fastfetch.deb
rm fastfetch.deb
