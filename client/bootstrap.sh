#!/bin/sh
sudo apt install curl -y

# `mise` installation
curl https://mise.run | sh

# `sudo` password feedback
echo 'Defaults        pwfeedback' | sudo EDITOR='tee -a' visudo

# `omz` installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Everything else.
mise run setup

echo "Done! if this is a graphical system, run:\n  mise run gui\nto install fonts and icons."
