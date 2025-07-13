# Client Setup

Sets up any configuration needed on a new machine.

## To Do

The following tasks are still manual:

- Install Tailscale and log in
- Set up `.ssh` dir

## Bootstrapping

First, install everything in `packages.txt` using your system's package manager.

Then run the following:

```sh
source ./bootstrap.sh

# Wait for zsh to install and activate, then rerun:

source ./bootstrap.sh
```

This will install `oh-my-zsh` and `mise` along with a variety of other tools. `mise` will then install the tools defined in `./dotfiles/mise/config.toml`. Add a new tool with `mise use <tool>@latest`

## Graphical Systems

Run `mise run gui` to copy icons and fonts for use on graphical systems.
This will also copy `gui/wallpaper` to `~/.wallpaper`, which can then be used by `feh`.

`fc-list` can be used to verify the correct fonts have installed.

## Docker

OS specific scripts for installing Docker Engine can be found in `./docker`.

## Management

Run `mise tasks` to view available management tasks.
