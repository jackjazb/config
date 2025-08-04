#!/usr/bin/env python
# MISE description="Symlinks dotfiles"
import os
import subprocess


# Returns the full path of a file in `dotfiles`.
def dotfile(path: str):
    return f"{os.getcwd()}/dotfiles/{path}"


# Returns a path with ~ and env variables expanded.
def system(path: str):
    p = os.path.expanduser(path)
    p = os.path.expandvars(p)
    return p


# Prints dest -> src
def print_link(src: str, dest: str, all_dest: list[str]):
    width = max(map(len, all_dest))
    print(f"{dest:<{width}} → {src}")


# Dotfile links are defined here - { src: dest }
links = {
    dotfile(".gitconfig"): system("~/.gitconfig"),
    dotfile(".vimrc"): system("~/.vimrc"),
    dotfile(".zshrc"): system("~/.zshrc"),
    dotfile("aliases.zsh"): system("$ZSH/custom/aliases.zsh"),
    dotfile("alacritty.toml"): system("~/.config/alacritty/alacritty.toml"),
    dotfile("mise.config.toml"): system("~/.config/mise/config.toml"),
    dotfile("i3.config"): system("~/.config/i3/config"),
    dotfile("sway.config"): system("~/.config/sway/config"),
    dotfile("qutebrowser.config.py"): system("~/.config/qutebrowser/config.py"),
    dotfile("zellij.config.kdl"): system("~/.config/zellij/config.kdl"),
    dotfile("gtk-3.0.settings.ini"): system("~/.config/gtk-3.0/settings.ini"),
    dotfile("fonts.conf"): system("~/.config/fontconfig/fonts.conf"),
}

for src, dest in links.items():
    print_link(src, dest, list(links.values()))

    path = os.path.normpath(dest)
    split = path.split(os.sep)
    dir = os.sep.join(split[:-1])
    # Create any paths required by the link and force symlink it.
    subprocess.run(["mkdir", "-p", dir])
    subprocess.run(["ln", "-sf", src, dest])

print("")
dirs = {"nvim": system("~/.config/")}

for src, dest in dirs.items():
    print_link(src, dest + src, list(dirs.values()))
    subprocess.run(["cp", "-frs", f"{os.getcwd()}/{src}", f"{system(dest)}"])
