# Client Setup

Sets up any configuration needed on a new machine.

## First Time Setup

Run the following to set up a new system:

```sh
source ./setup.sh
```

Everything in `./dotfiles` will be symlinked, so edits to the system's config can be done from this repo.

## GUI Customisation

The `gui.sh` script installs any GUI specific customisation (icons, themes, fonts etc.). Run it with

```sh
source ./gui.sh
```

## Docker

OS specific scripts for installing Docker Engine can be found in `./docker`.
