# Client Setup

Sets up any configuration needed on a new machine.

## First Time Setup

Run the following to set up a new system:

```sh
source ./setup.sh
```

After `oh-my-zsh` is installed, run to install packages.

```sh
source ./packages.sh
```

This also runs `dotfiles.sh`, which symlinks everything in `./dotfiles` - edits to the system's config can then be made from this repo.

## GUI Customisation

The `gui.sh` script installs any GUI specific customisation (icons, themes, fonts etc.). Run it with

```sh
source ./gui.sh
```

## Docker

OS specific scripts for installing Docker Engine can be found in `./docker`.
