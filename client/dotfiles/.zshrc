# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode reminder # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git rsync alias-finder)
zstyle ':omz:plugins:alias-finder' autoload yes

source $ZSH/oh-my-zsh.sh

# Set the default editor.
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_PAGER="cat"

# Add android tools to path.
export ANDROID_HOME=$HOME/Android/Sdk

# Ruby config
export GEM_HOME="$HOME/gems"

export PATH=${PATH}:$ANDROID_HOME/platform-tools/
export PATH=${PATH}:$HOME/.local/bin
export PATH="$HOME/.local/share/mise/shims:$PATH"

eval "$(zoxide init zsh)"

eval "$(mise activate zsh)"

# pnpm
export PNPM_HOME="/home/jack/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
