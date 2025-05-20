sudo cp ./authorized_keys ~/.ssh/authorized_keys

sudo apt -y install vim curl caddy
sudo cp ./Caddyfile /etc/caddy/Caddyfile

curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
. ~/.bashrc
npm install -g @go-task/cli

# Jellyfin
mkdir -p ~/jellyfin/media/music

