#!/usr/bin/env bash

mkdir -p ~/.config/alacritty/ ~/.config/zellij

cd ~
ln -sf ~/.dotfiles/zshrc .zshrc
ln -sf ~/.dotfiles/gitconfig .gitconfig
ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/.dotfiles/zellij.kdl ~/.config/zellij/config.kdl
